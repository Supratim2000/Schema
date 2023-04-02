import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:schema/views/SignInView.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: SignUpViewBody()
    );
  }
}

class SignUpViewBody extends StatefulWidget{
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      body: SingleChildScrollView (
        child: Padding (
          padding: EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                SizedBox (
                  width: MediaQuery.of(context).size.width,
                  height: 10.0,
                ),
                Image.asset('images/register.png'),
                SizedBox (
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle (
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Merriweather',
                      color: Colors.blue
                  ),
                ),
                SizedBox (
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                ),
                inputEmailField(_emailController, 'Enter email...', Icons.email, false, TextInputType.emailAddress),
                SizedBox (
                  height:10,
                  width: MediaQuery.of(context).size.width,
                ),
                inputNameField(_nameController, 'Enter yor name...', Icons.person, false, TextInputType.name),
                SizedBox (
                  height:10,
                  width: MediaQuery.of(context).size.width,
                ),
                inputPasswordField(_passwordController, 'Enter password...', Icons.password, TextInputType.visiblePassword),
                SizedBox (
                  height:10,
                  width: MediaQuery.of(context).size.width,
                ),
                inputConfirmPasswordField(_confirmPasswordController, 'Renter password...', Icons.password, TextInputType.visiblePassword),
                SizedBox (
                  height:10,
                  width: MediaQuery.of(context).size.width,
                ),
                Row (
                  children: <Widget> [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        navigateToSignInView();
                      },
                      child: const Text(
                        'Already have an account? Sign in',
                        style: TextStyle (
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Merriweather',
                            color: Colors.blue
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox (
                  height: 25.0,
                  width: MediaQuery.of(context).size.width,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor (
                      height: 50.0,
                      width: MediaQuery.of(context).size.width
                  ),
                  child: ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle (
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Merriweather',
                            color: Colors.white
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField inputEmailField(TextEditingController _controller, String _labelText, IconData _prefixIcon,bool _obscureText, var _keyboardType) {
    return TextField (
      controller: _controller,
      style:const TextStyle (
          fontSize:18.0,
          color: Colors.blue
      ),
      obscureText: _obscureText,
      keyboardType: _keyboardType,
      decoration: InputDecoration (
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide (
                  width: 1.5,
                  color: Colors.blue.shade300
              )
          ),
          labelText: _labelText,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(_prefixIcon),
          suffixIcon: IconButton (
            onPressed: () {
              _controller.clear();
            },
            icon: const Icon(Icons.clear),
          )
      ),
    );
  }

  TextField inputNameField(TextEditingController _controller, String _labelText, IconData _prefixIcon,bool _obscureText, var _keyboardType) {
    return TextField (
      controller: _controller,
      style:const TextStyle (
          fontSize:18.0,
          color: Colors.blue
      ),
      obscureText: _obscureText,
      keyboardType: _keyboardType,
      decoration: InputDecoration (
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide (
                  width: 1.5,
                  color: Colors.blue.shade300
              )
          ),
          labelText: _labelText,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(_prefixIcon),
          suffixIcon: IconButton (
            onPressed: () {
              _controller.clear();
            },
            icon: const Icon(Icons.clear),
          )
      ),
    );
  }

  TextField inputPasswordField(TextEditingController _controller, String _labelText, IconData _prefixIcon, var _keyboardType) {
    return TextField (
      controller: _controller,
      style:const TextStyle (
          fontSize:18.0,
          color: Colors.blue
      ),
      obscureText: _obscurePasswordText,
      keyboardType: _keyboardType,
      decoration: InputDecoration (
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide (
                  width: 1.5,
                  color: Colors.blue.shade300
              )
          ),
          labelText: _labelText,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(_prefixIcon),
          suffixIcon: IconButton (
            onPressed: () {
              setState(() {
                _obscurePasswordText = !_obscurePasswordText;
              });
            },
            icon: _obscurePasswordText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
          )
      ),
    );
  }

  TextField inputConfirmPasswordField(TextEditingController _controller, String _labelText, IconData _prefixIcon, var _keyboardType) {
    return TextField (
      controller: _controller,
      style:const TextStyle (
          fontSize:18.0,
          color: Colors.blue
      ),
      obscureText: _obscureConfirmPasswordText,
      keyboardType: _keyboardType,
      decoration: InputDecoration (
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide (
                  width: 1.5,
                  color: Colors.blue.shade300
              )
          ),
          labelText: _labelText,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(_prefixIcon),
          suffixIcon: IconButton (
            onPressed: () {
              setState(() {
                _obscureConfirmPasswordText = !_obscureConfirmPasswordText;
              });
            },
            icon: _obscureConfirmPasswordText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
          )
      ),
    );
  }

  void navigateToSignInView() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SignInView() ,));
  }
}