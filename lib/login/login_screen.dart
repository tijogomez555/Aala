import 'package:aala/utils/square_tile.dart';
import 'package:aala/utils/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../dashboard/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF808080),
                    Color(0xFFFFFFFF),
                  ],
                ),
              ),
              child: _mainBody(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _headerText(),
          _secondHeading(),
          const SizedBox(height: 10),
          _textFields(),
          const SizedBox(height: 20.0),
          _signinButton(),
          const SizedBox(height: 20.0),
          dividerContinuewith(),
          const SizedBox(height: 10),
          googleIcon(),
        ],
      ),
    );
  }

  Widget _headerText() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: Text(
              TextWidgets.welcomeMessage,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _secondHeading() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 50.0),
      child: Text(
        TextWidgets.welcomeMessageDescription,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _textFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: mobileController,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: TextWidgets.textfieldEmail,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.email),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: passwordController,
            obscureText: _isObscured,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: TextWidgets.textfieldPassword,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                child:
                    Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _signinButton() {
    return SizedBox(
      width: 390,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const DashBoard();
            },
          ));
        },
        child: const Text(
          TextWidgets.signinButtonText,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget dividerContinuewith() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              TextWidgets.continueWithText,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget googleIcon() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SquareTile(imagepath: 'assets/images/google2-removebg-preview.png'),
      ],
    );
  }
}
