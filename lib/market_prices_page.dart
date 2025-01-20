import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome icons

class MarketPricesPage extends StatelessWidget {
  final Map<String, List<Map<String, String>>> productCategories = {
    'Pesticides': [
      {'name': 'Azoxystrobin', 'price': '₹500/kg', 'details': 'Effective for pest control in crops.'},
      {'name': 'Chlorothalonil', 'price': '₹300/kg', 'details': 'Recommended for wheat crops.'},
      {'name': 'Triazoles', 'price': '₹750/kg', 'details': 'Organic pesticide, safe for vegetables.'},
    ],
    'Farming Equipment': [
      {'name': 'Tractor', 'price': '₹5,00,000', 'details': 'Heavy-duty tractor for large farms.'},
      {'name': 'Plough', 'price': '₹50,000', 'details': 'Used for plowing the soil efficiently.'},
      {'name': 'Harvester', 'price': '₹12,00,000', 'details': 'Harvests crops with high efficiency.'},
    ],
    'Seeds': [
      {'name': 'Wheat Seeds', 'price': '₹200/kg', 'details': 'High-quality wheat seeds for better yield.'},
      {'name': 'Rice Seeds', 'price': '₹180/kg', 'details': 'Good for wetland farming.'},
      {'name': 'Maize Seeds', 'price': '₹220/kg', 'details': 'Fast-growing and drought-resistant.'},
    ],
    'Fertilizers': [
      {'name': 'Urea', 'price': '₹350/50kg', 'details': 'Improves nitrogen content in soil.'},
      {'name': 'DAP', 'price': '₹450/50kg', 'details': 'Used for enhancing plant root growth.'},
      {'name': 'Potash', 'price': '₹400/50kg', 'details': 'Essential for plant health and fruiting.'},
    ],
    'Irrigation Systems': [
      {'name': 'Drip Irrigation', 'price': '₹15,000', 'details': 'Efficient water usage for crops.'},
      {'name': 'Sprinkler System', 'price': '₹20,000', 'details': 'Ideal for large field irrigation.'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Prices'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: productCategories.keys.map((category) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              color: Colors.green[50],
              child: ExpansionTile(
                leading: _getCategoryIcon(category),
                title: Text(
                  category,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
                children: productCategories[category]!
                    .map(
                      (product) => ListTile(
                        title: Text(
                          product['name']!,
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price: ${product['price']}',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Details: ${product['details']}',
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.add_shopping_cart, color: Colors.green),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to cart')),
                            );
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _getCategoryIcon(String category) {
    switch (category) {
      case 'Farming Equipment':
        return Icon(FontAwesomeIcons.tractor, color: Colors.blue, size: 30);
      case 'Seeds':
        return Icon(FontAwesomeIcons.seedling, color: Colors.brown, size: 30);
      case 'Pesticides':
        return Icon(Icons.local_florist, color: Colors.orange, size: 30);
      case 'Fertilizers':
        return Icon(Icons.water_drop, color: Colors.green, size: 30);
      case 'Irrigation Systems':
        return Icon(Icons.invert_colors, color: Colors.cyan, size: 30);
      default:
        return Icon(Icons.category, color: Colors.grey, size: 30);
    }
  }
}
