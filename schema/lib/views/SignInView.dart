import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<StatefulWidget> createState() => _SignInViewState();

}

class _SignInViewState extends State<SignInView> {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: SignInViewBody()
    );
  }
}

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<StatefulWidget> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<StatefulWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePasswordText = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold (

      backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                Image.asset('images/login.png'),
                SizedBox (
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                ),
                const Text(
                    'Sign In',
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
                inputPasswordField(_passwordController, 'Enter password...', Icons.password, TextInputType.visiblePassword),
                SizedBox (
                  height:10,
                  width: MediaQuery.of(context).size.width,
                ),
                Row (
                  children: <Widget> [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        print('forgot password?');
                      },
                      child: const Text(
                        'Forgot password?',
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
                          'Sign In',
                        style: TextStyle (
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Merriweather',
                            color: Colors.white
                        ),
                      )
                  ),
                ),
                SizedBox (
                  height: 10.0,
                  width: MediaQuery.of(context).size.width,
                ),
                TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle (
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather',
                        color: Colors.blue
                    ),
                  )
                )
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
}