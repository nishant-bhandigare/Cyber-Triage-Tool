import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageController _pageController = PageController();
  bool isSignUp = true;
  bool _agreeToTerms = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side: Blank Containers Carousel
          Expanded(
            flex: 3,
            child: _buildBlankContainerCarousel(),
          ),
          // Right side: Form
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isSignUp ? 'Create an account' : 'Sign in',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignUp = !isSignUp;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          isSignUp ? 'Already have an account? ' : 'Don’t have an account? ',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          isSignUp ? 'Log in' : 'Sign up',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildFormFields(),
                  const SizedBox(height: 20),
                  if (isSignUp)
                    Row(
                      children: [
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value!;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle terms click
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(child: Text(isSignUp ? 'Create account' : 'Sign in')),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Or register with',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  _buildSocialButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlankContainerCarousel() {
    return PageView(
      controller: _pageController,
      children: [
        _buildBlankContainer(Colors.purple.shade100),
        _buildBlankContainer(Colors.purple.shade200),
        _buildBlankContainer(Colors.purple.shade300),
      ],
    );
  }

  Widget _buildBlankContainer(Color color) {
    return Container(
      color: color,
      child: const Center(
        child: Text(
          'Capturing Moments, Creating Memories',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        if (isSignUp)
          Row(
            children: [
              Expanded(
                child: _buildTextField('First name'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField('Last name'),
              ),
            ],
          ),
        const SizedBox(height: 10),
        _buildTextField('Email'),
        const SizedBox(height: 10),
        _buildTextField('Enter your password', obscureText: true),
      ],
    );
  }

  Widget _buildTextField(String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText && !_passwordVisible,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: obscureText
            ? IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        )
            : null,
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Handle Google sign-in
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  'Google',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            // Handle Apple sign-in
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.apple,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  'Apple',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
