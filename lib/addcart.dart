import 'package:flutter/material.dart';
import 'allproduct.dart';
import 'shipping.dart';
class CartPage extends StatelessWidget {
  final Product product;

  CartPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280,
              width: double.infinity,
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '₹${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              // Add to cart logic
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              side: BorderSide(color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                'ADD TO CART',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShippingPage()),
                              );// Buy now logic
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ), backgroundColor: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                'BUY NOW',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'PRODUCT DETAILS',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  // More Information Section
                  InkWell(
                    onTap: () {
                      // Add your action for More Information here
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'MORE INFORMATION',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'RATINGS & REVIEWS',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Ratings Section
                  SizedBox(height: 30),
                  Text(
                    '4.7',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      // Display colored stars based on the rating
                      for (int i = 0; i < 5; i++)
                        Icon(
                          i < 4 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Clickable text for reviews
                  InkWell(
                    onTap: () {
                      // Add your action for clicking on reviews
                    },
                    child: Text(
                      '125 REVIEWS',
                      style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'YOU MAY ALSO LIKE',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  _buildLikeProducts(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildLikeProducts() {
    // Replace the sample data with your actual product data
    List<Map<String, dynamic>> likeProducts = [
      {
        'name': 'Tomato',
        'image': 'assets/images/tomato.png',
        'price': '₹1.99',
        'offerPrice': '₹1.49',
        'rating': 4.5,
      },
      {
        'name': 'Almond',
        'image': 'assets/images/almond.jpg',
        'price': '₹5.99',
        'offerPrice': '₹4.99',
        'rating': 4.8,
      },
      {
        'name': 'Cauliflower',
        'image': 'assets/images/cauli.png',
        'price': '₹2.49',
        'offerPrice': '₹1.99',
        'rating': 4.2,
      },
      {
        'name': 'Basmati Rice',
        'image': 'assets/images/basmathi.jpg',
        'price': '₹3.99',
        'offerPrice': '₹2.99',
        'rating': 4.6,
      },
      {
        'name': 'Potato',
        'image': 'assets/images/potato.png',
        'price': '₹0.99',
        'offerPrice': '₹0.79',
        'rating': 4.0,
      },
      {
        'name': 'Carrot',
        'image': 'assets/images/carrot.png',
        'price': '₹1.49',
        'offerPrice': '₹1.19',
        'rating': 4.4,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Container(
          height: 310,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: likeProducts.length,
            itemBuilder: (context, index) {
              final product = likeProducts[index];

              // Calculate the percentage off
              double percentageOff = (1 - (double.parse(product['offerPrice'].substring(1)) / double.parse(product['price'].substring(1)))) * 100;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: 180,
                        height: 150,
                        child: Image.asset(
                          product['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      product['name'],
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '${product['offerPrice']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '(${percentageOff.toStringAsFixed(0)}% off)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '${product['price']}',
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.black, // Set star color to black
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          product['rating'].toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }



}
