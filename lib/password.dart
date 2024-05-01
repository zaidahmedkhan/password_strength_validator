import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class PasswordValidator extends StatefulWidget {
  const PasswordValidator({super.key});

  @override
  State<PasswordValidator> createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {
  final TextEditingController _controller = TextEditingController();
  bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Password Strength Validator",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isSuccess ? Icons.lock_open : Icons.lock,
                      size: 100,
                      color: isSuccess ? Colors.green : Colors.blueGrey,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      isSuccess
                          ? "Password is Strong"
                          : "Create a Strong Password",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSuccess ? Colors.green : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              FlutterPwValidator(
                controller: _controller,
                uppercaseCharCount: 2,
                numericCharCount: 2,
                specialCharCount: 1,
                normalCharCount: 3,
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
                minLength: 8,
                onSuccess: () {
                  setState(() {
                    isSuccess = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password is strong!")),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
