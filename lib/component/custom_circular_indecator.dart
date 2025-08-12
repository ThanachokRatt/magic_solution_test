import 'package:flutter/material.dart';

class CustomCircularIndecator extends StatelessWidget {
  const CustomCircularIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 2.0,
          ),
        ),
      ),
    );
  }
}
