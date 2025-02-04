import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'login_page.dart' as login;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  File? _image; // Stockage de l'image de profil

  // Méthode pour choisir l'image à partir de la galerie ou de la caméra
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Afficher un dialogue pour choisir entre la caméra ou la galerie
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path); // Mettre à jour l'image
      });
    }
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image de profil avec icône d'édition
                  const SizedBox(height: 15),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: _image == null
                            ? AssetImage(
                                "assets/profile.jpg") // Image par défaut
                            : FileImage(_image!)
                                as ImageProvider, // Image choisie
                      ),
                      GestureDetector(
                        onTap:
                            _pickImage, // Appeler la méthode pour changer l'image
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 55),
                  // Champs de saisie avec étiquettes intégrées sur la bordure
                  _buildOutlinedTextField("رقم بطاقة التعريف"),
                  _buildOutlinedTextField("الاسم الأول"),
                  _buildOutlinedTextField("الاسم العائلي"),
                  _buildOutlinedTextField("رقم الهاتف"),
                  _buildOutlinedTextField("كلمة المرور", obscureText: true),
                  _buildOutlinedTextField("تأكيد كلمة المرور",
                      obscureText: true),
                  const SizedBox(height: 35),
                  // Bouton d'inscription
                  SizedBox(
                    width: 250,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          // Action au clic
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 41, 12, 191),
                                Color.fromARGB(255, 70, 36, 241),
                                Color.fromARGB(255, 92, 76, 240),
                                Color.fromARGB(255, 128, 115, 243),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Center(
                              child: Text(
                                "إنشاء حساب",
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("لدي حساب "),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const login.LoginPage()),
                                );
                              },
                              child: const Text(
                                "تسجيل الدخول",
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
