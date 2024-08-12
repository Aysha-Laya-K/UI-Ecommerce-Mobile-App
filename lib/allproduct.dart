import 'package:flutter/material.dart';
import 'addcart.dart';





class AllProductsPage extends StatefulWidget {
  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearchVisible = false;
  int _activeCategoryIndex = 0; // Index of the currently active category

  // Dummy data for categories
  List<String> categories = ['ALL', 'VEGETABLES', 'GROCERY', 'RICE', 'FRUITS', 'NUTS'];

  // Dummy data for all products
  List<Product> allProducts = [
    Product('Tomato', '15% OFF', 2.99, 'assets/images/tomato.png', 15, "Indulge in the delightful experience of our fresh and juicy tomatoes. Harvested at the peak of ripeness, these tomatoes boast a vibrant red color and a burst of flavor. Whether you're adding them to salads, sandwiches, or cooking up a savory dish, our tomatoes are sure to elevate your culinary creations. Enjoy the natural goodness and versatility of these premium tomatoes that add a touch of freshness to every bite."),
    Product('Cauliflower', '10% OFF', 3.49, 'assets/images/cauli.png', 10, "Savor the wholesome goodness of cauliflower, a versatile cruciferous vegetable that brings a unique blend of flavors and textures to your plate. With its crisp and mildly sweet taste, cauliflower offers a delightful culinary experience, whether roasted, steamed, or incorporated into various dishes. Rich in essential vitamins, minerals, and antioxidants, cauliflower provides a nutrient-packed addition to your meals, supporting overall health and well-being. Its neutral flavor makes it a fantastic canvas for various seasonings and cooking methods, allowing you to explore a myriad of delicious recipes. From cauliflower rice to roasted cauliflower steaks, this cruciferous gem invites creativity in the kitchen while delivering a satisfying and nutritious dining experience."),
    Product('Basmati Rice', '20% OFF', 9.99, 'assets/images/basmathi.jpg', 20, "Embark on a culinary journey with the aromatic and slender grains of Basmati rice, celebrated for its exceptional fragrance, distinct flavor, and long, fluffy texture. Hailing from the foothills of the Himalayas, Basmati rice is renowned for its unique aroma reminiscent of sweet-scented jasmine and its ability to elongate and separate beautifully during cooking. This premium rice variety is a staple in many traditional dishes, adding a fragrant and delicate touch to biryanis, pilafs, and various rice-based recipes. Beyond its delightful taste and texture, Basmati rice boasts nutritional benefits, offering a low to medium glycemic index and serving as a rich source of carbohydrates. Elevate your dining experience with the regal allure of Basmati rice, a culinary treasure that transforms every meal into a fragrant and delectable feast."),
    Product('Almond', '25% OFF', 12.99, 'assets/images/almond.jpg', 25, "Indulge in the exquisite taste and nutritional richness of almonds, a delightful nut that's both wholesome and versatile. Almonds are renowned for their crunchy texture and subtly sweet flavor, making them a popular choice for snacking or as a versatile ingredient in various culinary creations. Packed with essential nutrients, almonds are a powerhouse of healthy fats, protein, vitamins, and minerals, contributing to overall well-being. Whether enjoyed on their own, added to salads, or incorporated into baked goods, almonds bring a delightful crunch and a wealth of nutritional benefits to every bite. Elevate your taste experience with these nutrient-dense gems and savor the natural goodness of almonds."),
    Product('Tomato', '15% OFF', 2.99, 'assets/images/tomato.png', 15, "Indulge in the delightful experience of our fresh and juicy tomatoes. Harvested at the peak of ripeness, these tomatoes boast a vibrant red color and a burst of flavor. Whether you're adding them to salads, sandwiches, or cooking up a savory dish, our tomatoes are sure to elevate your culinary creations. Enjoy the natural goodness and versatility of these premium tomatoes that add a touch of freshness to every bite."),
    Product('Cauliflower', '10% OFF', 3.49, 'assets/images/cauli.png', 10, "Savor the wholesome goodness of cauliflower, a versatile cruciferous vegetable that brings a unique blend of flavors and textures to your plate. With its crisp and mildly sweet taste, cauliflower offers a delightful culinary experience, whether roasted, steamed, or incorporated into various dishes. Rich in essential vitamins, minerals, and antioxidants, cauliflower provides a nutrient-packed addition to your meals, supporting overall health and well-being. Its neutral flavor makes it a fantastic canvas for various seasonings and cooking methods, allowing you to explore a myriad of delicious recipes. From cauliflower rice to roasted cauliflower steaks, this cruciferous gem invites creativity in the kitchen while delivering a satisfying and nutritious dining experience."),
    Product('Basmati Rice', '20% OFF', 9.99, 'assets/images/basmathi.jpg', 20, "Embark on a culinary journey with the aromatic and slender grains of Basmati rice, celebrated for its exceptional fragrance, distinct flavor, and long, fluffy texture. Hailing from the foothills of the Himalayas, Basmati rice is renowned for its unique aroma reminiscent of sweet-scented jasmine and its ability to elongate and separate beautifully during cooking. This premium rice variety is a staple in many traditional dishes, adding a fragrant and delicate touch to biryanis, pilafs, and various rice-based recipes. Beyond its delightful taste and texture, Basmati rice boasts nutritional benefits, offering a low to medium glycemic index and serving as a rich source of carbohydrates. Elevate your dining experience with the regal allure of Basmati rice, a culinary treasure that transforms every meal into a fragrant and delectable feast."),
    Product('Almond', '25% OFF', 12.99, 'assets/images/almond.jpg', 25, "Indulge in the exquisite taste and nutritional richness of almonds, a delightful nut that's both wholesome and versatile. Almonds are renowned for their crunchy texture and subtly sweet flavor, making them a popular choice for snacking or as a versatile ingredient in various culinary creations. Packed with essential nutrients, almonds are a powerhouse of healthy fats, protein, vitamins, and minerals, contributing to overall well-being. Whether enjoyed on their own, added to salads, or incorporated into baked goods, almonds bring a delightful crunch and a wealth of nutritional benefits to every bite. Elevate your taste experience with these nutrient-dense gems and savor the natural goodness of almonds."),
    // Add more products for the "ALL" category
  ];

  // Dummy data for category-specific products
  Map<String, List<Product>> categoryProducts = {
    'VEGETABLES': [
      Product('Tomato', '15% OFF', 2.99, 'assets/images/tomato.png', 15, "Indulge in the delightful experience of our fresh and juicy tomatoes. Harvested at the peak of ripeness, these tomatoes boast a vibrant red color and a burst of flavor. Whether you're adding them to salads, sandwiches, or cooking up a savory dish, our tomatoes are sure to elevate your culinary creations. Enjoy the natural goodness and versatility of these premium tomatoes that add a touch of freshness to every bite."),
      Product('Cauliflower', '10% OFF', 3.49, 'assets/images/cauli.png', 10, "Savor the wholesome goodness of cauliflower, a versatile cruciferous vegetable that brings a unique blend of flavors and textures to your plate. With its crisp and mildly sweet taste, cauliflower offers a delightful culinary experience, whether roasted, steamed, or incorporated into various dishes. Rich in essential vitamins, minerals, and antioxidants, cauliflower provides a nutrient-packed addition to your meals, supporting overall health and well-being. Its neutral flavor makes it a fantastic canvas for various seasonings and cooking methods, allowing you to explore a myriad of delicious recipes. From cauliflower rice to roasted cauliflower steaks, this cruciferous gem invites creativity in the kitchen while delivering a satisfying and nutritious dining experience."
      ),
      Product('Tomato', '15% OFF', 2.99, 'assets/images/tomato.png', 15, "Indulge in the delightful experience of our fresh and juicy tomatoes. Harvested at the peak of ripeness, these tomatoes boast a vibrant red color and a burst of flavor. Whether you're adding them to salads, sandwiches, or cooking up a savory dish, our tomatoes are sure to elevate your culinary creations. Enjoy the natural goodness and versatility of these premium tomatoes that add a touch of freshness to every bite."
      ),
      Product('Cauliflower', '10% OFF', 3.49, 'assets/images/cauli.png', 10, "Savor the wholesome goodness of cauliflower, a versatile cruciferous vegetable that brings a unique blend of flavors and textures to your plate. With its crisp and mildly sweet taste, cauliflower offers a delightful culinary experience, whether roasted, steamed, or incorporated into various dishes. Rich in essential vitamins, minerals, and antioxidants, cauliflower provides a nutrient-packed addition to your meals, supporting overall health and well-being. Its neutral flavor makes it a fantastic canvas for various seasonings and cooking methods, allowing you to explore a myriad of delicious recipes. From cauliflower rice to roasted cauliflower steaks, this cruciferous gem invites creativity in the kitchen while delivering a satisfying and nutritious dining experience."
      ),
      Product('Tomato', '15% OFF', 2.99, 'assets/images/tomato.png', 15, "Indulge in the delightful experience of our fresh and juicy tomatoes. Harvested at the peak of ripeness, these tomatoes boast a vibrant red color and a burst of flavor. Whether you're adding them to salads, sandwiches, or cooking up a savory dish, our tomatoes are sure to elevate your culinary creations. Enjoy the natural goodness and versatility of these premium tomatoes that add a touch of freshness to every bite."
      ),
      Product('Cauliflower', '10% OFF', 3.49, 'assets/images/cauli.png', 10, "Savor the wholesome goodness of cauliflower, a versatile cruciferous vegetable that brings a unique blend of flavors and textures to your plate. With its crisp and mildly sweet taste, cauliflower offers a delightful culinary experience, whether roasted, steamed, or incorporated into various dishes. Rich in essential vitamins, minerals, and antioxidants, cauliflower provides a nutrient-packed addition to your meals, supporting overall health and well-being. Its neutral flavor makes it a fantastic canvas for various seasonings and cooking methods, allowing you to explore a myriad of delicious recipes. From cauliflower rice to roasted cauliflower steaks, this cruciferous gem invites creativity in the kitchen while delivering a satisfying and nutritious dining experience."
      ),
      // Add more vegetable products
    ],
    'GROCERY': [
      Product('Basmati Rice', '20% OFF', 9.99, 'assets/images/basmathi.jpg', 20, "Embark on a culinary journey with the aromatic and slender grains of Basmati rice, celebrated for its exceptional fragrance, distinct flavor, and long, fluffy texture. Hailing from the foothills of the Himalayas, Basmati rice is renowned for its unique aroma reminiscent of sweet-scented jasmine and its ability to elongate and separate beautifully during cooking. This premium rice variety is a staple in many traditional dishes, adding a fragrant and delicate touch to biryanis, pilafs, and various rice-based recipes. Beyond its delightful taste and texture, Basmati rice boasts nutritional benefits, offering a low to medium glycemic index and serving as a rich source of carbohydrates. Elevate your dining experience with the regal allure of Basmati rice, a culinary treasure that transforms every meal into a fragrant and delectable feast."),
      Product('Almond', '25% OFF', 12.99, 'assets/images/almond.jpg', 25, "Indulge in the exquisite taste and nutritional richness of almonds, a delightful nut that's both wholesome and versatile. Almonds are renowned for their crunchy texture and subtly sweet flavor, making them a popular choice for snacking or as a versatile ingredient in various culinary creations. Packed with essential nutrients, almonds are a powerhouse of healthy fats, protein, vitamins, and minerals, contributing to overall well-being. Whether enjoyed on their own, added to salads, or incorporated into baked goods, almonds bring a delightful crunch and a wealth of nutritional benefits to every bite. Elevate your taste experience with these nutrient-dense gems and savor the natural goodness of almonds."),
      Product('Basmati Rice', '20% OFF', 9.99, 'assets/images/basmathi.jpg', 20, "Embark on a culinary journey with the aromatic and slender grains of Basmati rice, celebrated for its exceptional fragrance, distinct flavor, and long, fluffy texture. Hailing from the foothills of the Himalayas, Basmati rice is renowned for its unique aroma reminiscent of sweet-scented jasmine and its ability to elongate and separate beautifully during cooking. This premium rice variety is a staple in many traditional dishes, adding a fragrant and delicate touch to biryanis, pilafs, and various rice-based recipes. Beyond its delightful taste and texture, Basmati rice boasts nutritional benefits, offering a low to medium glycemic index and serving as a rich source of carbohydrates. Elevate your dining experience with the regal allure of Basmati rice, a culinary treasure that transforms every meal into a fragrant and delectable feast."),
      Product('Almond', '25% OFF', 12.99, 'assets/images/almond.jpg', 25, "Indulge in the exquisite taste and nutritional richness of almonds, a delightful nut that's both wholesome and versatile. Almonds are renowned for their crunchy texture and subtly sweet flavor, making them a popular choice for snacking or as a versatile ingredient in various culinary creations. Packed with essential nutrients, almonds are a powerhouse of healthy fats, protein, vitamins, and minerals, contributing to overall well-being. Whether enjoyed on their own, added to salads, or incorporated into baked goods, almonds bring a delightful crunch and a wealth of nutritional benefits to every bite. Elevate your taste experience with these nutrient-dense gems and savor the natural goodness of almonds."),

    ],

    'RICE': [
      Product('Basmati Rice', '20% OFF', 9.99, 'assets/images/basmathi.jpg', 20, "Embark on a culinary journey with the aromatic and slender grains of Basmati rice, celebrated for its exceptional fragrance, distinct flavor, and long, fluffy texture. Hailing from the foothills of the Himalayas, Basmati rice is renowned for its unique aroma reminiscent of sweet-scented jasmine and its ability to elongate and separate beautifully during cooking. This premium rice variety is a staple in many traditional dishes, adding a fragrant and delicate touch to biryanis, pilafs, and various rice-based recipes. Beyond its delightful taste and texture, Basmati rice boasts nutritional benefits, offering a low to medium glycemic index and serving as a rich source of carbohydrates. Elevate your dining experience with the regal allure of Basmati rice, a culinary treasure that transforms every meal into a fragrant and delectable feast."),

    ],

    'FRUITS': [
      Product('Tomato', '15% OFF', 2.99, 'assets/images/tomato.png', 15, "Indulge in the delightful experience of our fresh and juicy tomatoes. Harvested at the peak of ripeness, these tomatoes boast a vibrant red color and a burst of flavor. Whether you're adding them to salads, sandwiches, or cooking up a savory dish, our tomatoes are sure to elevate your culinary creations. Enjoy the natural goodness and versatility of these premium tomatoes that add a touch of freshness to every bite."),

    ],


    'NUTS': [
      Product('Almond', '25% OFF', 12.99, 'assets/images/almond.jpg', 25, "Indulge in the exquisite taste and nutritional richness of almonds, a delightful nut that's both wholesome and versatile. Almonds are renowned for their crunchy texture and subtly sweet flavor, making them a popular choice for snacking or as a versatile ingredient in various culinary creations. Packed with essential nutrients, almonds are a powerhouse of healthy fats, protein, vitamins, and minerals, contributing to overall well-being. Whether enjoyed on their own, added to salads, or incorporated into baked goods, almonds bring a delightful crunch and a wealth of nutritional benefits to every bite. Elevate your taste experience with these nutrient-dense gems and savor the natural goodness of almonds."),

    ],





    // Add more categories and their products
  };

  // Currently displayed products
  List<Product> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    displayedProducts = allProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: _buildAppBarActions(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.black12,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 16.0, 22.0, 8.0),
              child: Text(
                'ALL PRODUCTS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2000 products',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'SORT',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          // Add your onClick action for the upward icon here
                        },
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(3.141), // Rotate 180 degrees
                          child: Icon(
                            Icons.sort,
                            // Add your preferred icon and styling here
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Horizontal Scrollable List of Categories
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildCategoryItem(index),
                  );
                },
              ),
            ), SizedBox(height: 10),

            // GridView of Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              // Add horizontal padding
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 10.0, // Adjusted mainAxisSpacing
                  childAspectRatio: 0.7, // Adjusted aspect ratio
                ),
                itemCount: displayedProducts.length,
                itemBuilder: (context, index) {
                  return _buildProductItem(displayedProducts[index]);
                },
              ),
            ),  SizedBox(height: 100),
            // Add to Cart Button
          ],
        ),
      ),
    );
  }
  Widget _buildCategoryItem(int index) {
    bool isActive = index == _activeCategoryIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeCategoryIndex = index;
          _updateDisplayedProducts(categories[index]);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: isActive ? Colors.black : Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            categories[index],
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );

  }

  Widget _buildProductItem(Product product) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  product.imagePath,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '₹${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${product.offer} (${product.discount}% OFF)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          // Add to Cart Button
          Container(
            width: double.infinity, // Match the container width
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(product),
                  ),
                );// Implement your 'Add to Cart' logic here
                // You might want to add the selected product to a cart or perform any other action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Remove rounded corners
                ),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }





  List<Widget> _buildAppBarActions() {
    if (_isSearchVisible) {
      return [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 100),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.cancel, color: Colors.black),
          onPressed: () {
            setState(() {
              _isSearchVisible = false;
              _searchController.clear();
            });
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: Icon(Icons.filter_list, color: Colors.black),
          onPressed: () {
            // Handle filter icon tap
          },
        ),
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {
            setState(() {
              _isSearchVisible = true;
            });
          },
        ),
      ];
    }
  }

  void _updateDisplayedProducts(String category) {
    if (category == 'ALL') {
      displayedProducts = allProducts;
    } else {
      displayedProducts = categoryProducts[category] ?? [];
    }
  }
}

class Product {
  final String title;
  final String offer;
  final double price;
  final String imagePath;
  final int discount;
  final String description;

  Product(this.title, this.offer, this.price, this.imagePath, [this.discount = 0, this.description = ""]);
}