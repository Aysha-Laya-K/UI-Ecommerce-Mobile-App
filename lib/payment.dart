import 'package:flutter/material.dart';
import 'package:ecom/Checkout.dart';


class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PAYMENT METHOD',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: PaymentMethods(),
    );
  }
}

class PaymentMethods extends StatefulWidget {
  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  String selectedMethod = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PaymentMethodTile('CASH ON DELIVERY', selectedMethod, updateSelectedMethod),
          PaymentMethodTile('CREDIT/DEBIT/ATM', selectedMethod, updateSelectedMethod),
          PaymentMethodTile('NET BANKING', selectedMethod, updateSelectedMethod),
          PaymentMethodTile('UPI', selectedMethod, updateSelectedMethod),
          SizedBox(height: 50),
          if (selectedMethod.isNotEmpty)
            ElevatedButton(
              onPressed: () {
                if (selectedMethod.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage(selectedPaymentMethod: selectedMethod)),
                  );
                } else {
                  // Handle case when no payment method is selected
                  // You might want to show a message to the user or handle it as needed
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // No rounded corners
                )),
                minimumSize: MaterialStateProperty.all(Size(200, 50)), // Adjust width and height
              ),
              child: Text('CONTINUE', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w900)),
            ),
        ],
      ),
    );
  }

  void updateSelectedMethod(String methodName) {
    setState(() {
      selectedMethod = methodName;
    });
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String methodName;
  final String selectedMethod;
  final Function(String) onSelect;

  const PaymentMethodTile(this.methodName, this.selectedMethod, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            methodName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: GestureDetector(
            onTap: () {
              onSelect(methodName);
            },
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.5),
                color: selectedMethod == methodName ? Colors.black : Colors.transparent,
              ),
              child: selectedMethod == methodName
                  ? Icon(
                Icons.check,
                color: Colors.white,
              )
                  : null,
            ),
          ),
        ),
        Divider(
          thickness: 0.5,
          color: Colors.grey,
        ),
      ],
    );
  }
}
