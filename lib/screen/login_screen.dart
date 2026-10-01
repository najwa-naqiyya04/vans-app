import 'package:flutter/material.dart';

import 'package:hello_flutter/contollers/auth_controller.dart';
import 'package:hello_flutter/screen/main.screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;
  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    FocusScope.of(context).unfocus();

    final email =
        emailController.text.trim();

    final password =
        passwordController.text.trim();

    // CEK INPUT KOSONG
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage =
            'Email dan password wajib diisi.';
      });

      return;
    }

    setState(() {
      errorMessage = null;
      isLoading = true;
    });

    try {
      final success =
          await AuthController.login(
        email: email,
        password: password,
      );

      if (!mounted) return;

      if (success) {
        // LOGIN BERHASIL
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const MainScreen(),
          ),
        );
      } else {
        // LOGIN GAGAL
        setState(() {
          errorMessage =
              'Email atau password salah.';
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage =
            'Terjadi kesalahan saat login.';
      });
    } finally {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF8F8F7),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            24,
            20,
            24,
            30,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              // =========================
              // BACK BUTTON
              // =========================

              Container(
                width: 42,
                height: 42,

                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,

                  border: Border.all(
                    color:
                        Colors.grey.shade200,
                  ),
                ),

                child: IconButton(
                  padding: EdgeInsets.zero,

                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 22,
                  ),

                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              const SizedBox(height: 18),

              // =========================
              // LOGO
              // =========================

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 58,
                      height: 58,

                      decoration:
                          BoxDecoration(
                        color: Colors.black,

                        borderRadius:
                            BorderRadius.circular(
                          18,
                        ),
                      ),

                      child: const Center(
                        child: Text(
                          'V',

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,

                            fontWeight:
                                FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      'VANS',

                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                            FontWeight.w700,

                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // =========================
              // TITLE
              // =========================

              const Text(
                'Selamat Datang\nKembali',

                style: TextStyle(
                  fontSize: 30,
                  height: 1.08,

                  fontWeight:
                      FontWeight.w800,

                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Masuk ke akun Vans Anda untuk\n'
                'melanjutkan belanja sneakers favorit.',

                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,

                  color:
                      Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 28),

              // =========================
              // EMAIL LABEL
              // =========================

              const Text(
                'Alamat Email',

                style: TextStyle(
                  fontSize: 12,

                  fontWeight:
                      FontWeight.w600,

                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 8),

              // =========================
              // EMAIL FIELD
              // =========================

              TextField(
                controller:
                    emailController,

                keyboardType:
                    TextInputType
                        .emailAddress,

                decoration:
                    InputDecoration(
                  hintText:
                      'nama@email.com',

                  prefixIcon:
                      const Icon(
                    Icons.email_outlined,
                    size: 20,
                  ),

                  filled: true,

                  fillColor:
                      Colors.white,

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),

                    borderSide:
                        BorderSide(
                      color:
                          Colors.grey.shade300,
                    ),
                  ),

                  enabledBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),

                    borderSide:
                        BorderSide(
                      color:
                          Colors.grey.shade300,
                    ),
                  ),

                  focusedBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),

                    borderSide:
                        const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // =========================
              // PASSWORD LABEL
              // =========================

              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [
                  const Text(
                    'Kata Sandi',

                    style: TextStyle(
                      fontSize: 12,

                      fontWeight:
                          FontWeight.w600,

                      color: Colors.black,
                    ),
                  ),

                  Text(
                    'Lupa Password?',

                    style: TextStyle(
                      fontSize: 11,

                      color:
                          Colors.grey.shade600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // =========================
              // PASSWORD FIELD
              // =========================

              TextField(
                controller:
                    passwordController,

                obscureText:
                    obscurePassword,

                decoration:
                    InputDecoration(
                  hintText:
                      'Minimal 6 karakter',

                  prefixIcon:
                      const Icon(
                    Icons.lock_outline_rounded,
                    size: 20,
                  ),

                  suffixIcon:
                      IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons
                              .visibility_outlined
                          : Icons
                              .visibility_off_outlined,

                      size: 20,
                    ),

                    onPressed: () {
                      setState(() {
                        obscurePassword =
                            !obscurePassword;
                      });
                    },
                  ),

                  filled: true,

                  fillColor:
                      Colors.white,

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),

                    borderSide:
                        BorderSide(
                      color:
                          Colors.grey.shade300,
                    ),
                  ),

                  enabledBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),

                    borderSide:
                        BorderSide(
                      color:
                          Colors.grey.shade300,
                    ),
                  ),

                  focusedBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),

                    borderSide:
                        const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // =========================
              // ERROR MESSAGE
              // =========================

              if (errorMessage != null)
                Container(
                  width: double.infinity,

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 11,
                  ),

                  margin:
                      const EdgeInsets.only(
                    bottom: 14,
                  ),

                  decoration:
                      BoxDecoration(
                    color:
                        const Color(0xFFFFEEEE),

                    borderRadius:
                        BorderRadius.circular(
                      12,
                    ),

                    border: Border.all(
                      color:
                          const Color(
                        0xFFFFCCCC,
                      ),
                    ),
                  ),

                  child: Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 18,

                        color:
                            Color(0xFFD32F2F),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Text(
                          errorMessage!,

                          style:
                              const TextStyle(
                            fontSize: 12,

                            color:
                                Color(
                              0xFFD32F2F,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // =========================
              // LOGIN BUTTON
              // =========================

              SizedBox(
                width: double.infinity,
                height: 54,

                child: ElevatedButton(
                  onPressed:
                      isLoading
                          ? null
                          : login,

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.black,

                    disabledBackgroundColor:
                        Colors.grey.shade400,

                    foregroundColor:
                        Colors.white,

                    elevation: 0,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        14,
                      ),
                    ),
                  ),

                  child: isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,

                          child:
                              CircularProgressIndicator(
                            strokeWidth: 2,

                            color:
                                Colors.white,
                          ),
                        )
                      : const Text(
                          'Masuk Sekarang',

                          style: TextStyle(
                            fontSize: 14,

                            fontWeight:
                                FontWeight.w700,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 26),

              // =========================
              // TERMS
              // =========================

              Center(
                child: Text(
                  'Dengan masuk, Anda menyetujui '
                  'Ketentuan Layanan & Privasi\n'
                  'Vans.',

                  textAlign:
                      TextAlign.center,

                  style: TextStyle(
                    fontSize: 10,
                    height: 1.5,

                    color:
                        Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}