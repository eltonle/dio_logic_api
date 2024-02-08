import 'package:dio_logic_api/features/Post/presentation/screen/home_screen.dart';
import 'package:dio_logic_api/features/auth_http/presentations/screens/login_screen.dart';
import 'package:dio_logic_api/features/users/presentations/screens/Home_user_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Learn mobile app",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shadowColor: Colors.grey,
                elevation: 2,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text(
                'Posts screen',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shadowColor: Colors.grey,
                elevation: 2,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeUserScreen(),
                  ),
                );
              },
              child: const Text(
                'Users screen',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shadowColor: Colors.grey,
                elevation: 2,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text(
                'login screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
