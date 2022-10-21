// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../Theme/button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login to your account'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          _HeaderWidget(),
          // _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'In order in use the editing and rating capabilities of TMDb,'
            'as well as get personal recommendations you will need to login'
            ' to your account. If you do not have an account, registering for '
            'an account is free and simple.',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Register'),
          ),
          const SizedBox(height: 25),
          const Text(
            'If you signed up but didn`t get your verification email.',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Verifi email'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      print('open app');
    } else {
      errorText = 'Invalid username or password';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    const color = Color(0xFF01B4E4);
    const textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(fontSize: 17, color: Colors.red),
          ),
          const SizedBox(height: 20),
        ],
        const Text('Username', style: textStyle),
        const SizedBox(height: 5),
        TextField(
            controller: _loginTextController, decoration: textFieldDecoration),
        const SizedBox(height: 20),
        const Text('Password', style: textStyle),
        const SizedBox(height: 5),
        TextField(
            controller: _passwordTextController,
            decoration: textFieldDecoration,
            obscureText: true),
        const SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
              ),
              onPressed: _auth,
              child: const Text('Login'),
            ),
            const SizedBox(width: 20),
            TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: _resetPassword,
              child: const Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}
