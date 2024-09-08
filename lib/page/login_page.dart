import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
final void Function()?onTap;
  LoginPage({super.key, required this.onTap});
// login method
  void login(){

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
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome back,you've beeb missed!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextField(
              hintText: "Email",
              controller: _emailController,
            ),
            SizedBox(
              height: 25,
            ),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Log In',
              onTap: login,
            ),
            SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                    onTap: onTap,
                    child: Text("Register now",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
