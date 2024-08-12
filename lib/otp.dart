import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController _otpController = TextEditingController();
  bool _isOtpVerified = false;

  void _verifyOtp() {
    // Replace this with your OTP verification logic
    // For demonstration purposes, I'll assume OTP is verified if it's not empty
    if (_otpController.text.isNotEmpty) {
      setState(() {
        _isOtpVerified = true;
      });

      // Start a timer to navigate after 5 seconds
      Timer(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FDFF),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200),
                  Text(
                    'Otp Verification',
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
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(color: Colors.black, width: 1.3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _otpController,
                            decoration: InputDecoration(
                              hintText: 'Enter OTP',
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
                      borderRadius: BorderRadius.circular(0.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.black],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _verifyOtp();
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
                  SizedBox(height: 10),
                  if (_isOtpVerified) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 24,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Verified OTP',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
