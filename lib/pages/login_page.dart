import 'package:flutter/material.dart';
import '../shared/authentication.dart';
import '../screens/event_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLogin = true;
  late String _userId;
  late String _password;
  late String _email;
  String _message = "";
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  Authentication? auth;

  @override
  void initState() {
    auth = Authentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                emailInput(),
                passwordInput(),
                mainButton(),
                secondaryButton(),
                validationMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailInput() {
    return Padding(
        padding: const EdgeInsets.only(top: 120),
        child: TextFormField(
          controller: txtEmail,
          keyboardType: TextInputType.emailAddress,
          decoration:
              const InputDecoration(hintText: 'email', icon: Icon(Icons.mail)),
          validator: (text) => text!.isEmpty ? 'Email is required' : '',
        ));
  }

  Widget passwordInput() {
    return Padding(
        padding: const EdgeInsets.only(top: 120),
        child: TextFormField(
          controller: txtPassword,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'password', icon: Icon(Icons.enhanced_encryption)),
          validator: (text) => text!.isEmpty ? 'Password is required' : '',
        ));
  }

  Widget mainButton() {
    String buttonText = _isLogin ? 'Login' : 'Sign up';
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          child: Text(buttonText),
          onPressed: () {
            submit;
          },
        ),
      ),
    );
  }

  Future submit() async {
    setState(() {
      _message = "";
    });
    try {
      if (_isLogin) {
        _userId = await auth!.login(txtEmail.text, txtPassword.text);
        print('Login for user $_userId');
      } else {
        _userId = await auth!.signUp(txtEmail.text, txtPassword.text);
        print('Sign up for user $_userId');
      }
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => EventScreen(_userId)));
    } catch (e) {
      print('Error: $e');
      setState(() {
        _message = e.toString();
      });
    }
  }

  Widget secondaryButton() {
    String buttonText = !_isLogin ? 'Login' : 'Sign up';
    return TextButton(
      child: Text(buttonText),
      onPressed: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },
    );
  }

  Widget validationMessage() {
    return Text(
      _message,
      style: const TextStyle(
          fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
}
