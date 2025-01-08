import 'package:flutter/material.dart';
import 'package:login_signup/ForgetPassword_page.dart';
import 'package:login_signup/Home_page.dart';
import 'package:login_signup/SignUp_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _rememberMe = false;

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
     Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff102C57),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 36,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "Login to continue",
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                  ),
                  const SizedBox(height: 90),
                  const Text(
                    "Email",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            50.0),
                      ),
                      filled: true, // Enables fillColor
                      fillColor: const Color(
                          0xFFF8F0E5),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Simple email validation
                      if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 45),
                  const Text(
                    "Password",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F0E5),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Remember Me Checkbox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                            fillColor: MaterialStateProperty.all(
                                const Color(0xffD9D9D9)),
                            activeColor: const Color(
                                0xffD9D9D9),
                            checkColor:
                            Colors.black,
                          ),
                          const Text(
                            "Remember me",
                            style:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Action for "Forgot password?"
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordPage()));
                        },
                        child: const Text(
                          'Forgot Password?',
                          style:
                          TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Login Button
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xffDAC0A3)),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xffDAC0A3),
                              decoration:
                              TextDecoration.underline,
                              decorationColor: Color(
                                  0xffDAC0A3),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
