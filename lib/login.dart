import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../tool/api_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:animations/animations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class SignInVarible {
  //Sign IN 所使用到的參數
  bool _onFirstPage = true;
  var _passwordVisible = false; //判斷密碼是否可視函數
  final _passwordKey = GlobalKey<FormState>(); //判斷password輸入的變數
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _accountkey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    //帳號密碼回傳格式型態
    'email': '',
    'password': '',
  };
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
}

class SignUpVarible {
  //Sign UP 所使用到的參數
  var _passwordVisible = false; //可否看見密碼變數
  var _checkpasswordVisible = false; //可否看見密碼變數
  final String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$"; //校正SignUp頁面email格式函數
  final String regexPassword = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,30}$'; //校正SignUp頁面password格式函數
  final ValueNotifier<String> _check = ValueNotifier<String>('');
  final _namekey = GlobalKey<FormState>(); //判斷name輸入的變數
  final _emailkey = GlobalKey<FormState>(); //判斷email輸入的變數
  final _passwordkey = GlobalKey<FormState>(); //判斷password輸入的變數
  final _checkpasswordkey = GlobalKey<FormState>(); //判斷checkpassword輸入的變數
  final Map<String, dynamic> _formData = {
    //輸入的資料
    'name': '',
    'email': '',
    'password': '',
    'checkpassword': '',
  };
}

class _HomePageWidgetState extends State<HomePage> {
  var signIn = SignInVarible(); //引入signIn函數庫
  var signUp = SignUpVarible(); //引路signUp函數庫
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: signIn.scaffoldKey,
      backgroundColor: Colors.transparent, //底色設為透明
      body: SingleChildScrollView(
        //**SingleChildScrollView**能夠消除pixel不足
        child: Container(
          width: MediaQuery.of(context).size.width, //寬度: 偵查個人手機寬度
          height: MediaQuery.of(context).size.height, //長度: 偵查個人手機長度
          decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/logo2.png"), fit: BoxFit.fill)), //底圖

          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      //頂部文字
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        'Welcome To Safer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ))
                ],
              ),
              Divider(
                //分隔線
                height: 10,
                thickness: 3,
                indent: 50,
                endIndent: 50,
                color: Color(0xFFFFFAFA),
              ),
              SizedBox(
                //填充分隔線與底下的距離
                height: 60,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    constraints: BoxConstraints(
                      // maxWidth: 350,
                      maxHeight: 575,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                    ),
                    child: PageView(

                        //左右滑動頁面
                        controller: PageController(
                          viewportFraction: 0.8, //旁邊卡片能夠突出
                        ),
                        children: [
                          Padding(
                            //第一張卡片內容
                            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((20))), //讓卡片邊框變成圓角
                              color: Color(0xFFF3F7E8),
                              child: Container(
                                child: new Column(children: [
                                  SizedBox(height: 35.0), //填充行距
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center, //置中
                                    children: [
                                      Container(
                                        width: 125,
                                        height: 125,
                                        decoration: BoxDecoration(
                                            //Sign-In 頭像
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(image: new AssetImage("assets/家人1.jpg"), fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          //Sign In 文字按鈕
                                          onPressed: () {
                                            setState(() {
                                              {
                                                signIn._onFirstPage = true;
                                              }
                                            });
                                          },
                                          child: Text(
                                            'SIGN IN',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF6D7660),
                                              decoration: TextDecoration.underline,
                                            ),
                                          )),
                                      TextButton(
                                          //Sign Up文字按鈕
                                          onPressed: () {
                                            setState(() {
                                              {
                                                signIn._onFirstPage = false;
                                              }
                                            });
                                          },
                                          child: Text(
                                            'SIGN UP',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF6D7660),
                                              decoration: TextDecoration.underline,
                                            ),
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      PageTransitionSwitcher(
                                        //Sign In Sign UP 動畫轉換頁面
                                        duration: Duration(milliseconds: 300),
                                        reverse: !(signIn._onFirstPage),
                                        transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) {
                                          return SharedAxisTransition(
                                              child: child,
                                              animation: animation,
                                              secondaryAnimation: secondaryAnimation,
                                              transitionType: SharedAxisTransitionType.horizontal);
                                        },
                                        child: signIn._onFirstPage
                                            ? Container(
                                                //Sign IN 頁面
                                                color: Color(0xFFF3F7E8),
                                                child: Column(
                                                  children: [
                                                    Form(
                                                        key: signIn._accountkey, //設定email的key
                                                        child: Padding(
                                                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                          child: TextFormField(
                                                            keyboardType: TextInputType.emailAddress, //輸入型態
                                                            autofocus: false,
                                                            controller: signIn.emailController, //給sharedpreference存
                                                            decoration: InputDecoration(
                                                              hintText: 'Email',
                                                              contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                                                            ),
                                                            validator: (value) {
                                                              if (value.isEmpty) {
                                                                return '請輸入email';
                                                              }
                                                              signIn._formData['email'] = value; //處存email資料
                                                              return null;
                                                            },
                                                          ) // Add TextFormFields and ElevatedButton here.
                                                          ,
                                                        )),
                                                    SizedBox(height: 8),
                                                    Form(
                                                        key: signIn._passwordKey, //設定password key
                                                        child: Padding(
                                                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                          child: TextFormField(
                                                            obscureText: !signIn._passwordVisible, //是否可視
                                                            autofocus: false,
                                                            controller: signIn.passController, //給sharedpreference存
                                                            decoration: InputDecoration(
                                                              hintText: 'password',
                                                              suffixIcon: IconButton(
                                                                //改變密碼可視
                                                                icon: Icon(
                                                                  // Based on passwordVisible state choose the icon
                                                                  signIn._passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                                  color: Theme.of(context).primaryColorDark,
                                                                ),
                                                                onPressed: () {
                                                                  // Update the state i.e. toogle the state of passwordVisible variable
                                                                  setState(() {
                                                                    signIn._passwordVisible = !signIn._passwordVisible; //改變可視狀態
                                                                  });
                                                                },
                                                              ),
                                                              contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                                                            ),
                                                            validator: (value) {
                                                              if (value.isEmpty) {
                                                                return '請輸入密碼';
                                                              }
                                                              signIn._formData['password'] = value; //處存password資料
                                                              return null;
                                                            },
                                                          ) // Add TextFormFields and ElevatedButton here.
                                                          ,
                                                        )),
                                                    Container(
                                                      //Login 按鈕
                                                      width: double.infinity,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(12),
                                                        child: ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text('Login'),
                                                          style: ElevatedButton.styleFrom(
                                                            primary: Color(0xFF5A6248),
                                                            padding: EdgeInsets.all(12),
                                                            shadowColor: Color(0xFF5A6248),
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      //icon的row
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //中間分隔
                                                      children: [
                                                        IconButton(
                                                          //google icon
                                                          color: Colors.red[600],
                                                          icon: Icon(FontAwesomeIcons.google),
                                                          iconSize: 40.0,
                                                          onPressed: () {},
                                                        ),
                                                        IconButton(
                                                          //line icon
                                                          color: Colors.green[600],
                                                          icon: Icon(FontAwesomeIcons.line),
                                                          iconSize: 40.0,
                                                          onPressed: () {},
                                                        ),
                                                        IconButton(
                                                          //facebook icon
                                                          color: Colors.blue[600],
                                                          // 第三方庫icon圖示
                                                          icon: Icon(FontAwesomeIcons.facebook),
                                                          iconSize: 40.0,
                                                          onPressed: () {},
                                                        ),
                                                      ],
                                                    ),
                                                    TextButton(
                                                        //忘記密碼按鈕
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Forgot Password',
                                                          style: TextStyle(color: Color(0x706D7660), fontSize: 12),
                                                        ))
                                                  ],
                                                ),
                                              )
                                            : Container(
                                                //Sign Up頁面
                                                color: Color(0xFFF3F7E8),
                                                child: Column(children: [
                                                  Form(
                                                    //email輸入框
                                                    key: signUp._emailkey,
                                                    child: TextFormField(
                                                      keyboardType: TextInputType.emailAddress,
                                                      autofocus: false,
                                                      decoration: InputDecoration(
                                                        hintText: 'Email',
                                                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                                      ),
                                                      validator: (value) {
                                                        bool check = RegExp(signUp.regexEmail).hasMatch(value);
                                                        if (value.isEmpty) {
                                                          return '請輸入email';
                                                        }
                                                        if (check != true) {
                                                          return 'email格式有誤,請查核';
                                                        }
                                                        signUp._formData['email'] = value; //處存email資料
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  Form(
                                                    //name輸入框
                                                    key: signUp._namekey,
                                                    child: TextFormField(
                                                      keyboardType: TextInputType.name,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        hintText: '姓名',
                                                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                                      ),
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Please enter some text';
                                                        }
                                                        signUp._formData['name'] = value; //處存name資料
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  Form(
                                                    //password輸入框
                                                    key: signUp._passwordkey,
                                                    child: TextFormField(
                                                      autofocus: false,
                                                      obscureText: !(signUp._passwordVisible),
                                                      decoration: InputDecoration(
                                                        hintText: '密碼',
                                                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                                        suffixIcon: IconButton(
                                                          //改變密碼可視
                                                          icon: Icon(
                                                            // Based on passwordVisible state choose the icon
                                                            signUp._passwordVisible ? Icons.visibility : Icons.visibility_off,
                                                            color: Theme.of(context).primaryColorDark,
                                                          ),
                                                          onPressed: () {
                                                            // Update the state i.e. toogle the state of passwordVisible variable
                                                            setState(() {
                                                              signUp._passwordVisible = !(signUp._passwordVisible);
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      validator: (value) {
                                                        bool check = RegExp(signUp.regexPassword).hasMatch(value);
                                                        if (value.isEmpty) {
                                                          return 'Please enter some text';
                                                        }
                                                        if (value.length < 6) {
                                                          return '密碼長度至少需要6字';
                                                        }
                                                        if (value.length >= 30) {
                                                          return '密碼長度過長';
                                                        }
                                                        if (check != true) {
                                                          return '密碼強度不足,密碼需至少含一個大寫字母,小寫字母與數字';
                                                        }
                                                        signUp._formData['password'] = value; //處存password資料
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  Form(
                                                    //checkpassword輸入框
                                                    key: (signUp._checkpasswordkey),
                                                    child: TextFormField(
                                                      autofocus: false,
                                                      obscureText: !(signUp._checkpasswordVisible),
                                                      decoration: InputDecoration(
                                                        hintText: '確認密碼',
                                                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                                        suffixIcon: IconButton(
                                                          //改變密碼可視
                                                          icon: Icon(
                                                            // Based on passwordVisible state choose the icon
                                                            signUp._checkpasswordVisible ? Icons.visibility : Icons.visibility_off,
                                                            color: Theme.of(context).primaryColorDark,
                                                          ),
                                                          onPressed: () {
                                                            // Update the state i.e. toogle the state of passwordVisible variable
                                                            setState(() {
                                                              signUp._checkpasswordVisible = !(signUp._checkpasswordVisible); //變更可視狀態
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Please enter some text';
                                                        }
                                                        signUp._formData['checkpassword'] = value; //處存checkpassword資料
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    //註冊按鈕
                                                    padding: EdgeInsets.symmetric(vertical: 16.0),
                                                    child: RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(24),
                                                      ),
                                                      onPressed: () async {
                                                        var check0 = signUp._passwordkey.currentState.validate(); //更新輸入資料狀態
                                                        var check1 = signUp._namekey.currentState.validate(); //更新輸入資料狀態
                                                        var check2 = signUp._emailkey.currentState.validate(); //更新輸入資料狀態
                                                        var check3 = signUp._checkpasswordkey.currentState.validate(); //更新輸入資料狀態
                                                        if (check0 && check1 && check2 && check3) {
                                                          //確認有無輸入
                                                          if (signUp._formData['password'] != signUp._formData['checkpassword']) {
                                                            //確認輸入密碼正確
                                                            signUp._check.value = '確認密碼相同';
                                                          } else {
                                                            signUp._check.value = await ApiTool.signuppost(
                                                                    signUp._formData['name'], signUp._formData['email'], signUp._formData['password'])
                                                                as String; //註冊post
                                                            print('value=');
                                                            print(signUp._check.value);
                                                          }
                                                        }
                                                      },
                                                      padding: EdgeInsets.all(12),
                                                      color: Colors.lightBlueAccent,
                                                      child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                                                    ),
                                                    ValueListenableBuilder<String>(
      builder: (BuildContext context, String value, Widget child) {
        return Text('$value');
      },
      valueListenable: signUp._check,
    )
                                                  )
                                                ]),
                                              ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          Padding(
                            //第二張卡片
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((20))),
                              color: Color(0xFFF3F7E8),
                              child: Container(
                                child: new Column(children: [
                                  SizedBox(height: 100.0), //填充行距
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(image: new AssetImage("assets/老人合照.jpg"), fit: BoxFit.fill)),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
