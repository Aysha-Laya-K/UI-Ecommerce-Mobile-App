import 'package:flutter/material.dart';
import 'signin.dart';
import 'package:flutter/gestures.dart';


class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FDFF),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF6FDFF), Color(0xFFF6FDFF)],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 130),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 320,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6FDFF),
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.black, width: 1.3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.5),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    width: 320,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6FDFF),
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.black, width: 1.3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.5),
                    child: Row(
                      children: [
                        Text(
                          '+91',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Mobile Number',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 320,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6FDFF),
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.black, width: 1.3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.5),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Email Address',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 320,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6FDFF),
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.black, width: 1.3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.5),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter City',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 20),
                  Container(
                    width: 320,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.black],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        elevation: MaterialStateProperty.all<double>(0),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'By Registering, you agree to our ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms and Conditions-Privacy Policy',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.black, // You can use any color for the clickable link
                            ),
                            // Add an onTap handler to make the text clickable
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle the tap on the link (navigate to terms and conditions, privacy policy, etc.)
                                // You can use Navigator to navigate to the respective pages or show a dialog.
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
