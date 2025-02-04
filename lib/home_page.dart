import 'package:flutter/material.dart';
import 'login_page.dart' as login;
import 'signup_page.dart' as signup;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image en arrière-plan
          Positioned.fill(
            child: Image.asset("assets/background.png", fit: BoxFit.cover),
          ),
          // Contenu
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGradientButton(
                  text: "تسجيل الدخول",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const login.LoginPage()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildGradientButton(
                  text: "إنشاء حساب",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const signup.SignupPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Fonction pour créer un bouton avec un dégradé
  Widget _buildGradientButton(
      {required String text, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF290CBF), // Bleu foncé
              Color(0xFF4624F1), // Bleu moyen
              Color(0xFF5C4CF0), // Bleu clair
              Color(0xFF8073F3), // Bleu très clair
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
