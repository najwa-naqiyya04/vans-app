import 'package:flutter/material.dart';

import '../contollers/auth_controller.dart';
import '../screen/login_screen.dart';

class ProfileLogoutDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Log Out',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          content: const Text(
            'Are you sure you want to log out?',
          ),
          actions: [
            // CANCEL
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            // LOG OUT
            TextButton(
              onPressed: () async {
                // Tutup dialog terlebih dahulu
                Navigator.pop(dialogContext);

                // Simpan status logout
                await AuthController.logout();

                if (!context.mounted) return;

                // Pindah ke LoginScreen
                // dan hapus semua halaman sebelumnya
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}