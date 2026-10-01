import 'package:flutter/material.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 52,
      ),
      child: Divider(
        height: 1,
        thickness: 0.7,
        color: Colors.grey.shade200,
      ),
    );
  }
}