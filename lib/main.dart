import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'language_provider.dart';
import 'welcome_page.dart';
import 'language_selection_page.dart';
import 'dashboard_page.dart';
import 'crop_analysis_page.dart';
import 'soil_plant_recommendations_page.dart';
import 'weather_forecast_page.dart';
import 'suggestions_page.dart';
import 'market_prices_page.dart';
import 'ask_an_expert_page.dart';
import 'crop_info_page.dart';
import 'soil_info_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            title: 'AgroDoc',
            theme: ThemeData(
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            locale: languageProvider.locale,
            supportedLocales: const [
              Locale('en', ''),
              Locale('hi', ''),
              Locale('kn', ''),
              Locale('te', ''),
              Locale('ta', ''),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: '/',
            routes: _buildRoutes(),
          );
        },
      ),
    );
  }

  /// Define app routes for navigation
  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      '/': (context) => WelcomePage(),
      '/languageSelection': (context) => LanguageSelectionPage(),
      '/dashboard': (context) => DashboardPage(),
      '/cropAnalysis': (context) => CropAnalysisPage(),
      '/soilRecommendations': (context) => SoilPlantRecommendationsPage(),
      '/weatherForecast': (context) => WeatherForecastPage(),
      '/suggestions': (context) => SuggestionsPage(),
      '/marketPrices': (context) => MarketPricesPage(),
      '/askExpert': (context) => AskAnExpertPage(),
      '/cropInfo': (context) => CropInfoPage(),
      '/soilInfo': (context) => SoilInfoPage(),
    };
  }
}

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      'title': 'Crop Analysis Using AI',
      'icon': Icons.agriculture,
      'route': '/cropAnalysis',
      'color': Colors.green,
    },
    {
      'title': 'Soil-Plant Recommendations',
      'icon': Icons.local_florist,
      'route': '/soilRecommendations',
      'color': Colors.orange,
    },
    {
      'title': 'Weather Forecast',
      'icon': Icons.wb_sunny,
      'route': '/weatherForecast',
      'color': Colors.blue,
    },
    {
      'title': 'Suggestions',
      'icon': Icons.lightbulb,
      'route': '/suggestions',
      'color': Colors.yellow,
    },
    {
      'title': 'Market Prices',
      'icon': Icons.attach_money,
      'route': '/marketPrices',
      'color': Colors.purple,
    },
    {
      'title': 'Ask an Expert',
      'icon': Icons.person,
      'route': '/askExpert',
      'color': Colors.red,
    },
    {
      'title': 'Crop Information',
      'icon': Icons.book_outlined,
      'route': '/cropInfo',
      'color': Colors.teal,
    },
    {
      'title': 'Soil Information',
      'icon': Icons.grain_outlined,
      'route': '/soilInfo',
      'color': Colors.brown,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgroDoc Dashboard'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            final feature = features[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, feature['route']),
              child: Container(
                decoration: BoxDecoration(
                  color: feature['color']?.withOpacity(0.2),
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
                      size: 50,
                      color: feature['color'],
                    ),
                    SizedBox(height: 10),
                    Text(
                      feature['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
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
