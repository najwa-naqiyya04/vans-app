import 'package:flutter/material.dart';

import '../widgets/profile_divider.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_logout_button.dart';
import '../widgets/profile_logout_dialog.dart';
import '../widgets/profile_menu_card.dart';
import '../widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // =========================
              // PROFILE HEADER
              // =========================
              const ProfileHeader(),

              // =========================
              // ACCOUNT MENU
              // =========================
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  14,
                  16,
                  0,
                ),
                child: Column(
                  children: [
                    // ACCOUNT
                    ProfileMenuCard(
                      children: [
                        ProfileMenuItem(
                          icon: Icons.location_on_outlined,
                          title: 'My Address',
                          onTap: () {
                            debugPrint(
                              'My Address clicked',
                            );
                          },
                        ),

                        const ProfileDivider(),

                        ProfileMenuItem(
                          icon: Icons.person_outline_rounded,
                          title: 'Account',
                          onTap: () {
                            debugPrint(
                              'Account clicked',
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // =========================
                    // SETTINGS
                    // =========================
                    ProfileMenuCard(
                      children: [
                        ProfileMenuItem(
                          icon: Icons.notifications_none_rounded,
                          title: 'Notifications',
                          onTap: () {
                            debugPrint(
                              'Notifications clicked',
                            );
                          },
                        ),

                        const ProfileDivider(),

                        ProfileMenuItem(
                          icon: Icons.phone_android_outlined,
                          title: 'Devices',
                          onTap: () {
                            debugPrint(
                              'Devices clicked',
                            );
                          },
                        ),

                        const ProfileDivider(),

                        ProfileMenuItem(
                          icon: Icons.lock_outline_rounded,
                          title: 'Passwords',
                          onTap: () {
                            debugPrint(
                              'Passwords clicked',
                            );
                          },
                        ),

                        const ProfileDivider(),

                        ProfileMenuItem(
                          icon: Icons.language_rounded,
                          title: 'Language',
                          onTap: () {
                            debugPrint(
                              'Language clicked',
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // =========================
                    // LOGOUT
                    // =========================
                    ProfileLogoutButton(
                      onTap: () {
                        ProfileLogoutDialog.show(
                          context,
                        );
                      },
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}