import 'package:ecom/signin.dart';
import 'package:flutter/material.dart';
import 'payment.dart';


class ShippingPage extends StatefulWidget {
  @override
  _ShippingPageState createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  bool isContainerVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SHIPPING',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: FractionalOffset.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Visibility(
                visible: isContainerVisible,
                child: Container(
                  width: 345,
                  height: 110,
                  padding: EdgeInsets.all(16),
                  color: Colors.grey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Have a CVS account?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(width: 100),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Toggle the visibility of the container
                                      isContainerVisible =
                                      !isContainerVisible;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close_sharp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Sign in for a fast checkout',
                              style:
                              TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              'experience.',
                              style:
                              TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isContainerVisible,
                child: Container(
                  width: 345,
                  padding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: 8), // Adjust vertical padding here
                  color: Colors.black,
                  child: Flexible(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        ); // Add functionality for the sign-in or register button
                      },
                      child: Text(
                        'SIGN IN / REGISTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 17, // Adjust the font size as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              // Add the text SHIPPING ADDRESS at the left side below the button
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'SHIPPING ADDRESS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              // Non-typing fields for Name, Address Line 1, Address Line 2, Town/City, Postal Code, State
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildShippingInfo('NAME'),
                    SizedBox(height: 30),
                    buildShippingInfo('ADDRESS LINE 1'),
                    SizedBox(height: 30),
                    buildShippingInfo('ADDRESS LINE 2'),
                    SizedBox(height: 30),
                    buildShippingInfo('TOWN/CITY'),
                    SizedBox(height: 30),
                    buildShippingInfo('POSTAL CODE'),
                    SizedBox(height: 30),
                    buildShippingInfo('STATE'),
                  ],
                ),
              ),
              SizedBox(height: 25),
              // Add the text SHIPPING ADDRESS at the left side below the button
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'CONTACT INFORMATION',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              // Non-typing fields for Name, Address Line 1, Address Line 2, Town/City, Postal Code, State
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildContactInfo('EMAIL'),
                    SizedBox(height: 30),
                    buildShippingInfo('MOBILE NUMBER'),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              Container(
                width: 345,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage()),
                    );
                    // Add functionality for the continue button
                  },
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShippingInfo(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the label bold
          ),
        ),
        Divider(
          color: Colors.black26, // Set the color of the divider to grey
        ),
      ],
    );
  }

  Widget buildContactInfo(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the label bold
          ),
        ),
        Divider(
          color: Colors.black26, // Set the color of the divider to grey
        ),
      ],
    );
  }
}
