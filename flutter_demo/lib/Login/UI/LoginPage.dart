/*
 * Created by mannyhuang on 2019/11/21.
 * 登录页面
 */
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
//import 'package:groovin_material_icons/groovin_material_icons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//变量区域
  static const platform = const MethodChannel('flutter.demo/goToNativePage');
  final _formKey = GlobalKey<FormState>();
  String _phoneNum, _password;
  bool _isObscure = true;//密码是否显示

Future<void> _goToNativePage() async {
    try {
      final int result = await platform
          .invokeMethod('goToNativePage', {'userName': '$_phoneNum'});
      print(result);
    } on PlatformException catch (e) {}
 }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          SizedBox(
            height: 48,
          ),
          buildTitle(),
          SizedBox(height: 70.0),
          buildUserTextField(),
          SizedBox(height: 30.0),
          buildPasswordTextField(context),
          buildForgetPasswordText(context),
          SizedBox(height: 60.0),
          buildLoginButton(context),
          SizedBox(height: 30.0),
          buildOtherLoginText(),
          buildRegisterText(context),
        ],
      ),
      ),
    ),
  );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '登陆',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }
  TextFormField buildUserTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '电话号码',
      ),
      validator: (String value) {
        var emailReg = RegExp(
            r"\d{3}-\d{8}|\d{4}-\{7,8}");
        if (!emailReg.hasMatch(value)) {
          return '请输入正确的电话号码';
        }
      },
      onSaved: (String value) => _phoneNum = value,
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              })),
    );
  }

  Padding buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            '忘记密码？',
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          onPressed: _goToNativePage,
        ),
      ),
    );
  }


  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            '登陆',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.black,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              print('phoneNum:$_phoneNum , password:$_password');
              Navigator.pop(context);
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

    Align buildOtherLoginText() {
    return Align(
        alignment: Alignment.center,
        child: Text(
          '其他账号登录',
          style: TextStyle(color: Colors.grey, fontSize: 14.0),
        ));
  }

    Align buildRegisterText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('没有账号？'),
            GestureDetector(
              child: Text(
                '点击注册',
                style: TextStyle(color: Colors.green),
              ),
              onTap: _goToNativePage,
            ),
          ],
        ),
      ),
    );
  }
}

