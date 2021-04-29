import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePage> {
  var _passwordVisible = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _accountkey = GlobalKey<FormState>(); //判斷email輸入的變數
  final Map<String, dynamic> _formData = {
    'email': '',
    'password': '',
  };
  final _passwordKey = GlobalKey<FormState>(); //判斷password輸入的變數
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      // resizeToAvoidBottomPadding: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
            image:
                new DecorationImage(image: new AssetImage("assets/logo2.png"), fit: BoxFit.fill)),
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
              height: 10,
              thickness: 3,
              indent: 50,
              endIndent: 50,
              color: Color(0xFFFFFAFA),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  constraints: BoxConstraints(
                    // maxWidth: 350,
                    maxHeight: 575,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.rectangle,
                  ),
                  child: PageView(
                      controller: PageController(
                        viewportFraction: 0.8,
                      ),
                      children: [
                        Padding(
                          //第一張卡片
                          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Card(
                            shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular((20))),
                            color: Color(0xFFF3F7E8),
                            child: Container(
                              child: new Column(children: [
                                SizedBox(height: 35.0), //填充行距
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              image: new AssetImage("assets/家人1.jpg"),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'SIGN IN',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF6D7660),
                                            decoration: TextDecoration.underline,
                                          ),
                                        )),
                                    TextButton(
                                        onPressed: () {},
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
                                    Form(
                                        key: _accountkey, //設定email的key
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.emailAddress, //輸入型態
                                            autofocus: false,
                                            controller: emailController, //給sharedpreference存
                                            decoration: InputDecoration(
                                              hintText: 'Email',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(50.0)),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return '請輸入email';
                                              }
                                              _formData['email'] = value; //處存email資料
                                              return null;
                                            },
                                          ) // Add TextFormFields and ElevatedButton here.
                                          ,
                                        )),
                                    SizedBox(height: 8),
                                    Form(
                                        key: _passwordKey, //設定password key
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: TextFormField(
                                            obscureText: !_passwordVisible, //是否可視
                                            autofocus: false,
                                            controller: passController, //給sharedpreference存
                                            decoration: InputDecoration(
                                              hintText: 'password',
                                              suffixIcon: IconButton(
                                                //改變密碼可視
                                                icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                  _passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Theme.of(context).primaryColorDark,
                                                ),
                                                onPressed: () {
                                                  // Update the state i.e. toogle the state of passwordVisible variable
                                                  setState(() {
                                                    _passwordVisible = !_passwordVisible; //改變可視狀態
                                                  });
                                                },
                                              ),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(50.0)),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return '請輸入密碼';
                                              }
                                              _formData['password'] = value; //處存password資料
                                              return null;
                                            },
                                          ) // Add TextFormFields and ElevatedButton here.
                                          ,
                                        )),
                                    Container(
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
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0)),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 3.0), //填充行距
                                Row(
                                  //icon的row
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(color: Color(0x706D7660), fontSize: 12),
                                    ))
                              ]),
                            ),
                          ),
                        ),
                        Padding(
                          //第二張卡片
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Card(
                            shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular((20))),
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
                                          image: new DecorationImage(
                                              image: new AssetImage("assets/老人合照.jpg"),
                                              fit: BoxFit.fill)),
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
    );
  }
}
