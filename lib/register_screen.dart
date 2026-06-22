import 'package:flutter/material.dart';
import 'main_screen.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
   //defining the five text controllers that are required for registration
  final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final TextEditingController birthdateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          //the back button does not have a fuction yet 
          onPressed: () {}  
        ),
      ),
     body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
                
           // const SizedBox(height: 5),
              
             // app logo gotten from the internet (pintrest)
             Center(
              child: Column(
                children: [
                  Image.network(
                    'https://i.pinimg.com/webp85/736x/6b/65/41/6b6541cf791ecf8680de60f51e44e95f.webp',
                    width: 80,
                    height: 80,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 80),

                  ),
                  // calling the constructor widget for the input fields
                  const SizedBox(height: 5),
                  _buildInputField('NAME', "Enter your full name", nameController),
                  _buildInputField('EMAIL', "Enter your phone or email", emailController),
                  _buildInputField('PASSWORD', "Create a password", passwordController, isPassword: true),
                  _buildInputField('CONFIRM PASSWORD', "Re-enter your password", confirmPasswordController, isPassword: true),
                  _buildInputField('BIRTH DATE', "Enter your birth date", birthdateController),
                  const SizedBox(height: 10),

                  //Registration button
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF009BBD),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),

                      onPressed: () {
                        //  check if any field is empty
                        if (nameController.text.trim().isEmpty|| emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty || confirmPasswordController.text.trim().isEmpty || birthdateController.text.trim().isEmpty) {

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please fill in all fields')),
                          );
                          return;
                        } 
                        // check if the password and confirm password are actually the same
                        if (passwordController.text != confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Passwords do not match')),
                          );
                          return;
                        } 
                        // when all validation is passed,  the app now redirects to the main screen.
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(
                              userName: nameController.text.trim(),
                              userEmail: emailController.text.trim(),
                             
                              isFromLogin:false,
                            ),
                          ),
                        );
                      },

                     
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
             )

          ],
        ),
      )
      
      )
    );
  }
  // wideget builder for the input field
Widget _buildInputField(String label, String hint, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 87, 86, 86)),
          ),
          const SizedBox(height: 3),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 13),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: Colors.grey[500]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: Color(0xFF009BBD)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}