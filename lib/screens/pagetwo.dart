import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool _sortAscending = true;

  void _sortProductsByPrice() {
    setState(() {
      if (_sortAscending) {
        products.sort((a, b) => double.parse(a.price.replaceAll('\$', '')).compareTo(double.parse(b.price.replaceAll('\$', ''))));
      } else {
        products.sort((a, b) => double.parse(b.price.replaceAll('\$', '')).compareTo(double.parse(a.price.replaceAll('\$', ''))));
      }
      _sortAscending = !_sortAscending;
      print('is working');
    });
  }


  final List<ProductItem> products = [
    ProductItem(
      productName: 'GadgetMaster 3000',
      storeName: 'Amazon',
      price: '\$99.99',
      gradientColor: Colors.blue,
    ),
    ProductItem(
      productName: 'PowerHub Pro',
      storeName: 'Best Buy',
      price: '\$49.99',
      gradientColor: Colors.red,
    ),
    ProductItem(
      productName: 'UltraSlim Laptop',
      storeName: 'eBay',
      price: '\$799.99',
      gradientColor: Colors.green,
    ),
    ProductItem(
      productName: 'Wireless Earbuds',
      storeName: 'Walmart',
      price: '\$29.99',
      gradientColor: Colors.orange,
    ),
    ProductItem(
      productName: 'SmartWatch X2',
      storeName: 'Amazon',
      price: '\$199.99',
      gradientColor: Colors.purple,
    ),
    ProductItem(
      productName: 'Gaming Keyboard',
      storeName: 'Best Buy',
      price: '\$89.99',
      gradientColor: Colors.teal,
    ),
    ProductItem(
      productName: '4K HDR Monitor',
      storeName: 'eBay',
      price: '\$299.99',
      gradientColor: Colors.amber,
    ),
    ProductItem(
      productName: 'Portable Charger',
      storeName: 'Walmart',
      price: '\$19.99',
      gradientColor: Colors.indigo,
    ),
    ProductItem(
      productName: 'Bluetooth Speaker',
      storeName: 'Amazon',
      price: '\$59.99',
      gradientColor: Colors.brown,
    ),
    ProductItem(
      productName: 'Smart Home Hub',
      storeName: 'Best Buy',
      price: '\$149.99',
      gradientColor: Colors.pink,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          IconButton(
            icon: Icon(
                _sortAscending ? Icons.arrow_upward : Icons.arrow_downward),
            onPressed: _sortProductsByPrice,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductItem(
            productName: product.productName,
            storeName: product.storeName,
            price: product.price.toString(),
            gradientColor: product.gradientColor,
          );
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String productName;
  final String storeName;
  final String price;
  final Color gradientColor;

  const ProductItem({
    Key? key,
    required this.productName,
    required this.storeName,
    required this.price,
    required this.gradientColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            print('Tapped on ${productName}');
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        gradientColor.withOpacity(0.5),
                        gradientColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(storeName),
                      const SizedBox(height: 4),
                      Text(price),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
