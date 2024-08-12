import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


class CheckoutPage extends StatelessWidget {
  final String selectedPaymentMethod;

  const CheckoutPage({required this.selectedPaymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CHECKOUT',
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
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SHIPPING ADDRESS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              Text('Name'),
              SizedBox(height: 8),
              Text('Address Line 1'),
              SizedBox(height: 8),
              Text('Address Line 2'),
              SizedBox(height: 8),
              Text('City'),
              SizedBox(height: 8),
              Text('Pincode'),
              SizedBox(height: 8),
              Text('State'),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(
                'BILLING ADDRESS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              Text('Name'),
              SizedBox(height: 8),
              Text('Address Line 1'),
              SizedBox(height: 8),
              Text('Address Line 2'),
              SizedBox(height: 8),
              Text('City'),
              SizedBox(height: 8),
              Text('Pincode'),
              SizedBox(height: 8),
              Text('State'),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(
                'CONTACT DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              Text('Mobile Number'),
              SizedBox(height: 8),
              Text('Email Id'),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(
                'SHIPPING METHOD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'STANDARD',
                style: TextStyle(
                  fontSize: 18, // Increase the font size as needed
                  // Add any other desired TextStyle properties here
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(
                'PAYMENT METHOD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                selectedPaymentMethod,
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(
                'ORDERLIST [1]',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        'assets/images/almond.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 70),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Almond', // Replace with actual item name
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '₹ 250', // Replace with actual price
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '1 kg', // Replace with actual quantity/unit
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SUBTOTAL',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '₹ 250.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SHIPPING COST', // Replace with actual Subtotal value
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'FREE', // Replace with actual Shipping Cost value
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'TOTAL',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '(Incl.of all taxes)',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 80),
                  Text(
                    '₹ 250.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By placing an order, you agree to our ',
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // Set the background color of the bottom bar to transparent
        child: Container(
          height: 80.0, // Increase the height of the container
          padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the container
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // Handle place order action
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.black,
                    minimumSize: Size(110, 60), // Set the size of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0), // Set border radius to 0 for a rectangular button
                    ),
                  ),
                  child: Text(
                    'PLACE ORDER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18// Make text bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
