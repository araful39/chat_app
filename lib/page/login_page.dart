import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

// login method
  void login() async {
    final authService = AuthService();
    try {
      await authService.singInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Welcome back,you've beeb missed!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              hintText: "Email",
              controller: _emailController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Log In',
              onTap: login,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    )),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                },
                child: const Text("Google SignIn")),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
