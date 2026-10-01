import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 335,
      child: Stack(
        children: [
          // =========================
          // BACKGROUND
          // =========================
          Positioned.fill(
            child: Image.asset(
              'assets/profile_header.png',
              fit: BoxFit.cover,
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return Container(
                  color: Colors.black,
                );
              },
            ),
          ),

          // =========================
          // DARK OVERLAY
          // =========================
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(
                      alpha: 0.15,
                    ),
                    Colors.black.withValues(
                      alpha: 0.65,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // =========================
          // PROFILE INFORMATION
          // =========================
          Positioned(
            left: 20,
            right: 20,
            bottom: 25,
            child: Column(
              children: [
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profile.jpeg',
                      fit: BoxFit.cover,
                      errorBuilder: (
                        context,
                        error,
                        stackTrace,
                      ) {
                        return Container(
                          color: Colors.grey.shade300,
                          child: const Icon(
                            Icons.person,
                            size: 45,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Vans User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Step into your style. '
                  'Make every step count.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}