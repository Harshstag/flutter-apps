import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required String title});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Page")),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 300,
          child: Column(
            children: [
              Text("Username : "),
              TextField(),
              SizedBox(height: 50),
              Text("Password : "),
              TextField(),
              SizedBox(height: 50),

              ElevatedButton(onPressed: _login(), child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
