import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY PROFILE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 130),
            Container(
              width: 300.0, // Set the desired width
              height: 50.0, // Set the desired height
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic for signing in with a mobile number here
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black, // text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0), // Set border radius to 0 for straight corners
                  ),
                ),
                child: Text(
                  'Sign in with mobile number',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontWeight: FontWeight.bold,
                    fontSize: 16, // Make text bold
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Add some space between the button and the text
            Text(
              'Or',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16), // Add some space between the lines
            Divider(height: 1, thickness: 1),

            // Divider line
            SizedBox(height: 16),

            InkWell(
              onTap: () {
                // Add your logic for clicking on 'Additional information' text here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align items in the center vertically
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8), // Add some space between the icon and text
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By placing Signing Up, you agree to our ',
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
    );
  }
}
