import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(child: Text(text)),
      ),
    );
  }
}
