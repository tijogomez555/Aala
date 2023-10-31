import 'package:aala/core/firebase/services/auth_service.dart';
import 'package:aala/core/text_widgets.dart';
import 'package:flutter/material.dart';
import '../../../core/image_path.dart';
import '../dashboard/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/Bg.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Card(
                    color: Colors.white70,
                    child: _mainBody(),
                  ),
                ),
              ),
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
          Transform.translate(
            offset: const Offset(0, -50),
            child: _headerRoundedImage(),
          ),
          const SizedBox(height: 30),
          _signinButton(),
        ],
      ),
    );
  }

  Widget _headerRoundedImage() {
    return ClipOval(
      child: Image.asset(
        Images.loginScreenRoundLogo,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _signinButton() {
    return SizedBox(
      width: 200,
      height: 50,
      child: Transform.translate(
        offset: const Offset(0, -25),
        child: ElevatedButton(
          onPressed: () async {
            await AuthService().signInWithGoogle();

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(234, 177, 18, 18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Images.googleLogo,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 3),
              const Text(
                Strings.signinButtonText,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
