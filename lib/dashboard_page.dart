import 'package:flutter/material.dart';
class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      'title': 'Crop Analysis Using AI',
      'icon': Icons.agriculture_outlined,
      'route': '/cropAnalysis',
      'color': Colors.green,
    },
    {
      'title': 'Soil-Plant Recommendations',
      'icon': Icons.local_florist_outlined,
      'route': '/soilRecommendations',
      'color': Colors.orange,
    },
    {
      'title': 'Weather Forecast',
      'icon': Icons.wb_sunny_outlined,
      'route': '/weatherForecast',
      'color': Colors.blue,
    },
    {
      'title': 'Suggestions',
      'icon': Icons.lightbulb_outline,
      'route': '/suggestions',
      'color': Colors.yellow,
    },
    {
      'title': 'Market Prices',
      'icon': Icons.attach_money_outlined,
      'route': '/marketPrices',
      'color': Colors.purple,
    },
    {
      'title': 'Ask an Expert',
      'icon': Icons.person_outline,
      'route': '/askExpert',
      'color': Colors.red,
    },
    {
      'title': 'Crop Information',
      'icon': Icons.book_outlined,
      'route': '/crop-info',
      'color': Colors.teal,
    },
    {
      'title': 'Soil Information',
      'icon': Icons.grain_outlined,
      'route': '/soil-info',
      'color': Colors.brown,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth < 600 ? 2 : 4; // Adjust for mobile vs. larger screens

    return Scaffold(
      appBar: AppBar(
        title: Text('AgroDoc Dashboard'),
        backgroundColor: Colors.green,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Number of columns based on screen width
            crossAxisSpacing: 16, // Horizontal spacing
            mainAxisSpacing: 16, // Vertical spacing
            childAspectRatio: 1.2, // Aspect ratio to make cards more rectangular
          ),
          itemCount: features.length, // Ensure this is correct
          itemBuilder: (context, index) {
            final feature = features[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, feature['route']);
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      feature['color']?.withOpacity(0.8) ?? Colors.transparent,
                      feature['color']?.withOpacity(0.4) ?? Colors.transparent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      feature['icon'],
                      size: 60,
                      color: feature['color'],
                    ),
                    SizedBox(height: 10),
                    Text(
                      feature['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
