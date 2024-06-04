import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ProfileScreen()));
              },
              icon: Icon(Icons.person))
        ],
        backgroundColor: const Color.fromARGB(255, 101, 173, 231),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'dash.png',
              scale: 3,
            ),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SignOutButton(),
            FilledButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: "landrinedoh11@gmail.com");
                    // Show success message or navigate to a success screen
                    print("Password reset email sent successfully");
                  } catch (error) {
                    // Show error message
                    print("Error sending password reset email: $error");
                  }
                },
                child: const Text("Reset Password"))
          ],
        ),
      ),
    );
  }
}
