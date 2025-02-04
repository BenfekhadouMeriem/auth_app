import 'package:flutter/material.dart';
import 'signup_page.dart' as signup;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/background.png", fit: BoxFit.cover),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centre verticalement
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 35),
                  // Champs de saisie avec étiquettes intégrées sur la bordure
                  _buildOutlinedTextField("رقم الهاتف"),
                  _buildOutlinedTextField("كلمة المرور", obscureText: true),
                  const SizedBox(height: 55),
                  // Bouton d'inscription
                  SizedBox(
                    width: 250, // Remplace par la largeur souhaitée
                    child: Material(
                      color: Colors.transparent, // Rend le Material transparent
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(10), // Effet de vague arrondi
                        onTap: () {
                          // Action au clic
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 41, 12, 191), // Bleu foncé
                                Color.fromARGB(255, 70, 36, 241),
                                Color.fromARGB(
                                    255, 92, 76, 240), // Bleu plus clair
                                Color.fromARGB(255, 128, 115, 243),
                              ],
                              begin: Alignment
                                  .bottomLeft, // Point de départ (haut gauche)
                              end: Alignment
                                  .topRight, // Point d'arrivée (bas droite)
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Center(
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  // Lien vers la connexion
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centrer les éléments
                    children: [
                      Directionality(
                        textDirection: TextDirection
                            .rtl, // Active l'écriture de droite à gauche
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Centre les éléments
                          children: [
                            const Text("ليس لدي حساب "),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const signup.SignupPage()),
                                );
                              },
                              child: const Text(
                                "انشاء الحساب",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOutlinedTextField(String label, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.w900,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 26, 63, 245), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 26, 63, 245), width: 2.5),
            ),
          ),
        ),
      ),
    );
  }
}
