import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // defining the two text controllers that are required for logging in
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), 
          //the back button has no function for now
          onPressed: () {}, 
        ),
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                      SizedBox(height: 20),
              
              // Centered Application Logo gotten from the internet (pintrest)
              Center(
                child: 
                    Image.network(
                      'https://i.pinimg.com/webp85/736x/6b/65/41/6b6541cf791ecf8680de60f51e44e95f.webp',
                      width: 90,
                      height: 90,
                     
                    ),
                     
              ),
              const SizedBox(height: 50),

              // calling the build funtion to create an input field 
              _buildInputField('PHONE OR EMAIL', 'Enter your phone or email', emailController),
              _buildInputField('PASSWORD', 'Enter your password', passwordController, isPassword: true),
              

              // Navigation link to go to the Registration Screen
              
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("don't have an account? ", style: TextStyle(color: Color.fromARGB(255, 75, 74, 74), fontSize: 13)),
                    GestureDetector(
                      //Navigation function to move to the registration screen
                      onTap: () {
                      
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Color(0xFF009BBD), fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              
              const SizedBox(height: 110),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF009BBD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {
                    // validation to know if any of the two field is empty
                    if (emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill in both fields')),
                      );
                      return;
                    }

                    // if the validation is successful, the app then navigates to the main screen while passing the email the user entered
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(
                          userName: 'Visitor', // default user name incases where user did not register and login
                          userEmail: emailController.text.trim(),
                          isFromLogin: true, // Tells MainScreen when a user came from Login page directly
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Creating and styling reusable builder for the input section
  Widget _buildInputField(String label, String hint, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 124, 123, 123)),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: Colors.grey[300]!),
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