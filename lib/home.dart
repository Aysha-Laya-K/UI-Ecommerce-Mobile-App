import 'package:ecom/shipping.dart';
import 'package:flutter/material.dart';
import 'allproduct.dart';
import 'account.dart';
import 'notification.dart';
import 'settings.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _initializeWidgetOptions();
  }

  void _initializeWidgetOptions() {
    _widgetOptions = [
      Center(
        child: Text(
          'Home Content',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      WishlistPage(),
      ShopPage(),
      CartPage(),
      AccountPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });


  }


  Widget buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 40.0), // Adjust the left padding as needed
              child: Image.asset(
                'assets/images/ecomlogo.png',
                height: 220,
                width: 300,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            size: 28,
            color: Colors.black,
          ),
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationPage()),
            );
            // Handle notifications action
          },
        ),
      ],
    );
  }


  Widget _buildCategoryButton(String label) {
    String imagePath;
    switch (label) {
      case 'Top offers':
        imagePath = 'assets/images/offer.jpg';
        break;
      case 'Rice':
        imagePath = 'assets/images/rice.jpg';
        break;
      case 'Vegetables':
        imagePath = 'assets/images/veggie.jpg';
        break;
      case 'Snacks':
        imagePath = 'assets/images/snacks.jpg';
        break;
      case 'Nuts':
        imagePath = 'assets/images/nuts.jpg';
        break;
      case 'Others':
        imagePath = 'assets/images/others.jpg';
        break;
      default:
        imagePath = 'assets/images/default.jpg';
        break;
    }

    return GestureDetector(
      onTap: () {
        // Perform action when the category is tapped
        print('Category $label tapped!');
        // Navigate or perform any action here
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
  Widget _buildRecentProducts() {
    // Replace the sample data with your actual product data
    List<Map<String, dynamic>> recentProducts = [
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
            itemCount: recentProducts.length,
            itemBuilder: (context, index) {
              final product = recentProducts[index];

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





  Widget _buildCategoryList() {
    List<String> categories = ['Top offers', 'Rice', 'Vegetables', 'Snacks', 'Nuts', 'Others'];

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) => _buildCategoryButton(category)).toList(),
          ),
        ),
        SizedBox(height: 30),
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/images/market.jpg',
                width: 500,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            AnimatedTextOverlay(),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllProductsPage()),
                );
                // Handle the Shop Now button tap
                print('Shop Now button tapped!');
                // Navigate or perform any action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'SHOP NOW',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        // Add 'veg.png' and 'veg1.jpg' images with curved corners
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: 200,
                  height: 265,
                  child: Image.asset(
                    'assets/images/veg.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: 150,
                  height: 265,
                  child: Image.asset(
                    'assets/images/veg1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        // Add 'fru.png' image with curved corners
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: 355,
            height: 200,
            child: Image.asset(
              'assets/images/fru.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20), // Add some space between the images and the new button
        // Add 'Shop All Products' button with the same style as 'Shop Now' button
        Container(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllProductsPage()),
              );
              // Handle the Shop All Products button tap
              print('Shop All Products button tapped!');
              // Navigate or perform any action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'SHOP ALL PRODUCTS',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50), // Add some space before the "Recent Products" text
        // Add 'Recent Products' text
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'RECENT PRODUCTS',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: Colors.black),
              ),
            ),
          ],
        ),

        _buildRecentProducts(),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/shop.jpg',
              width: 500,
              height: 250,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllProductsPage()),
                );
                // Handle the Shop Now button tap
                print('Shop Now button tapped!');
                // Navigate or perform any action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'SHOP NOW',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 50), // Add some space before the "Recent Products" text
        // Add 'Recent Products' text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'POPULAR PRODUCTS',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Handle the "VIEW ALL" click action for Popular Products
                print('POPULAR PRODUCTS VIEW ALL clicked!');
                // Navigate or perform any action here
              },
              child: Row(
                children: [
                  Text(
                    'VIEW ALL',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }

  Widget _buildPopularItems() {
    List<Map<String, dynamic>> popularItems = [
      {
        'name': 'Tomato',
        'image': 'assets/images/tomato.png',
        'price': '₹1.99',
        'offerPrice': '₹1.49',
      },
      {
        'name': 'Almond',
        'image': 'assets/images/almond.jpg',
        'price': '₹5.99',
        'offerPrice': '₹4.99',
      },
      {
        'name': 'Cauliflower',
        'image': 'assets/images/cauli.png',
        'price': '₹2.49',
        'offerPrice': '₹1.99',
      },
      {
        'name': 'Potato',
        'image': 'assets/images/potato.png',
        'price': '₹0.99',
        'offerPrice': '₹0.79',
      },
    ];

    return Container(

      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: popularItems.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final product = popularItems[index];

          // Calculate the percentage off
          double percentageOff =
              (1 - (double.parse(product['offerPrice'].substring(1)) / double.parse(product['price'].substring(1)))) * 100;

          return GestureDetector(
            onTap: () {
              // Handle tap on popular product
              print('Popular product ${product['name']} tapped!');
              // Navigate or perform any action here
            },
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      product['image'],
                      width: double.infinity,
                      height: 100, // Adjusted image height
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 0),
                        Row(
                          children: [
                            Text(
                              '${product['offerPrice']}',
                              style: TextStyle(
                                fontSize: 14,
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
                        SizedBox(height: 0),
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 1000),
        child: Container(
          child: Column(
            children: [
              buildAppBar(context),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search...',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.mic,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    // Perform microphone action
                                  },
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildCategoryList(),
                            ],
                          ),
                        ),
                        _buildPopularItems(),
                        SizedBox(height: 150,)
                      ],
                      ),
                    )
                  ],

                ),
              ),
            ],
          ),
        ),
      )
          : AppBar(

          // Set automaticallyImplyLeading to false to remove the back button
          automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 18), // Adjust the left margin as needed
          child: Text(
            _getAppBarTitle(_selectedIndex),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22, // Adjust the font size as needed
            ),
          ),
        ),
      ),

      body: Container(
        color: Colors.white,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  String _getAppBarTitle(int index) {

    switch (index) {
      case 0:
        return 'HOME';
      case 1:
        return 'WISHLIST';
      case 2:
        return 'SHOP';
      case 3:
        return 'MY CART';
      case 4:
        return 'ACCOUNT';
      default:
        return 'Your App Name';
    }
  }
}

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),

      ),
    );
  }
}


class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),

      ),
    );
  }
}






class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Add a boolean variable to track whether the item is in the wishlist

  bool isAddedToWishlist = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1 ITEM',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),

            Row(
              children: [
                Image.asset(
                  'assets/images/almond.jpg', // Make sure to replace 'assets/' with the correct path
                  height: 130.0, // Adjust the height as needed
                  width: 180.0, // Adjust the width as needed
                ),
                SizedBox(width: 30.0), // Adjust the spacing between image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Almond', // Replace with your item name
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '₹100.00', // Replace with your item price
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Unit: 1 kg', // Replace with your item unit
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.only(right: 8.0),
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: IconButton(
                            alignment: Alignment.center, // Center the icon within the container
                            icon: Icon(Icons.remove, color: Colors.white,size: 20,),
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                          ),
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.only(left: 8.0),
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: IconButton(
                            alignment: Alignment.center, // Center the icon within the container
                            icon: Icon(Icons.add, color: Colors.white, size: 20,),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ],
            ),




            Container(
              height: 40.0, // Adjust the height of the container
              decoration: BoxDecoration(
                color: isAddedToWishlist ? Colors.green : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: isAddedToWishlist ? Colors.green : Colors.black,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'ADD',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: isAddedToWishlist ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isAddedToWishlist ? Icons.favorite : Icons.favorite_border,
                      color: isAddedToWishlist ? Colors.white : null,
                    ),
                    onPressed: () {
                      setState(() {
                        isAddedToWishlist = !isAddedToWishlist;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Divider(thickness: 1.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Text(
                    'TOTAL ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '(Incl. of all taxes)         ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '₹100.00',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              alignment: Alignment.center, // Align the button at the center
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShippingPage()),
                  );// Add your checkout logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: Size(300.0, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0), // Remove rounded corners
                  ),
                ),
                child: Text(
                  'CHECKOUT',
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),



            // Add other widgets related to your cart content here
          ],
        ),
      ),
    );
  }
}


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    // Creamy white color
    Color creamyWhite = Color(0xFFF5F5F5);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(Icons.person, color: Colors.black54), // Myntra-like icon for My Profile
              title: Text(
                'My Profile',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
              tileColor: creamyWhite,
              onTap: () {

                // Handle My Account option
              },
            ),
            //Divider(),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.list, color: Colors.black54), // Myntra-like icon for Orders
              title: Text(
                'My Orders',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
              tileColor: creamyWhite,
              onTap: () {
                // Handle Orders option
              },
            ),
           // Divider(),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.account_balance_wallet, color: Colors.black54), // Myntra-like icon for Account Details
              title: Text(
                'Account Details',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
              tileColor: creamyWhite,
              onTap: () {
                // Handle Account Details option
              },
            ),
            //Divider(),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.card_giftcard, color: Colors.black54), // Myntra-like icon for My Points
              title: Text(
                'My Points',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
              tileColor: creamyWhite,
              onTap: () {
                // Handle My Points option
              },
            ),
            //Divider(),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.headset_mic, color: Colors.black54), // Myntra-like icon for Customer Service
              title: Text(
                'Customer Service',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
              tileColor: creamyWhite,
              onTap: () {
                // Handle Customer Service option
              },
            ),
           // Divider(),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.star, color: Colors.black54), // Myntra-like icon for Rate & Review
              title: Text(
                'Rate & Review',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
              tileColor: creamyWhite,
              onTap: () {
                // Handle Rate & Review option
              },
            ),
           // Divider(),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black54), // Myntra-like icon for Settings
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
              tileColor: creamyWhite,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
                // Handle Settings option
              },
            ),
           // Divider(),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black54), // Myntra-like icon for Logout
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
              tileColor: creamyWhite,
              onTap: () {
                // Handle Logout option
              },
            ),
           // Divider(),
          ],
        ),
      ),
    );
  }
}

class AnimatedTextOverlay extends StatefulWidget {
  @override
  _AnimatedTextOverlayState createState() => _AnimatedTextOverlayState();
}

class _AnimatedTextOverlayState extends State<AnimatedTextOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/supermarket1..jpg',
          width: MediaQuery.of(context).size.width,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 23,
          top: 50,
          child: FadeTransition(
            opacity: _fadeInAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THE BEST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'GROCERY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'EVER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


