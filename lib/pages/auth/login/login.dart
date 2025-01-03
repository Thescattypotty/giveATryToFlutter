import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:giveatrytoflutter/pages/auth/register/register.dart';
import 'package:giveatrytoflutter/services/auth_service.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _register(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 12,
        toolbarHeight: 180,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
                color: Color(0xffF7F7F9), shape: BoxShape.circle),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Hello Again',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              _emailAddress(),
              const SizedBox(
                height: 15,
              ),
              _password(),
              const SizedBox(
                height: 24,
              ),
              _login(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailAddress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            filled: true,
            hintText: 'login:user.user@user.com mdp:useruser',
            hintStyle: const TextStyle(
              color: Color(0xff6A6A6A),
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            fillColor: const Color(0xffF7F7F9),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _password() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 16,
        ),
        TextField(
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF7F7F9),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14))),
        )
      ],
    );
  }

  Widget _login(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0D6EFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(double.infinity, 60),
        elevation: 0,
      ),
      onPressed: () async {
        final email = emailController.text;
        final password = passwordController.text;
        await AuthService()
            .login(email: email, password: password, context: context);
      },
      child: const Text(
        "Login",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _register(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(
              text: "New User? ",
              style: TextStyle(
                color: Color(0xff6A6A6A),
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: "Create Account",
              style: const TextStyle(
                color: Color(0xff1A1D1E),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
