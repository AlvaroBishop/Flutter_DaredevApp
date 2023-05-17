import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      theme: ThemeData(
        canvasColor: Colors.black,
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(
            'images/justice-logo.png'), // Replace with your splash image
        splashIconSize: 300,
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DaredevApp'),
        foregroundColor: Colors.amber,
        titleTextStyle: TextStyle(
          fontSize: 35,
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Screen 3',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ImageDetailScreen('Image ${index + 1}'),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.grey,
                      child: Center(
                        child: Text('Image ${index + 1}'),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Information',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen('Love'),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CustomPaint(
                        painter: DiamondPainter(),
                        child: Center(
                          child: Icon(Icons.favorite, size: 40),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen('Wine'),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CustomPaint(
                        painter: DiamondPainter(),
                        child: Center(
                          child: Icon(Icons.wine_bar_outlined, size: 40),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen('Car'),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CustomPaint(
                        painter: DiamondPainter(),
                        child: Center(
                          child: Icon(Icons.car_crash, size: 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen('Disabled'),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CustomPaint(
                        painter: DiamondPainter(),
                        child: Center(
                          child: Icon(Icons.accessible_outlined, size: 40),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen('Justice'),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CustomPaint(
                        painter: DiamondPainter(),
                        child: Center(
                          child: Icon(Icons.account_balance, size: 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen('Money'),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CustomPaint(
                        painter: DiamondPainter(),
                        child: Center(
                          child: Container(
                            width: 90,
                            height: 90,
                            child: CustomPaint(
                              painter: DiamondPainter(),
                              child: Center(
                                child: Icon(Icons.attach_money, size: 40),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen('Couple'),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CustomPaint(
                        painter: DiamondPainter(),
                        child: Center(
                          child: Icon(Icons.wc, size: 40),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen('Airport'),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CustomPaint(
                        painter: DiamondPainter(),
                        child: Center(
                          child:
                              Icon(Icons.airplanemode_active_rounded, size: 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDetailScreen extends StatelessWidget {
  final String image;

  ImageDetailScreen(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
      ),
      body: Center(
        child: Text(
          'Selected Image: $image',
          style: TextStyle(fontSize: 24, color: Colors.amber),
        ),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  final String text;

  NewScreen(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Screen'),
      ),
      body: Center(
        child: Text(
          'Selected Icon: $text',
          style: TextStyle(fontSize: 24, color: Colors.amber),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Screen 2', style: TextStyle(color: Colors.amber)),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Screen 3', style: TextStyle(color: Colors.amber)),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Screen 4', style: TextStyle(color: Colors.amber)),
    );
  }
}

class Screen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewsItem(
              header: 'Breaking News',
              title: 'Lorem ipsum dolor sit amet',
              info: 'Published: May 16, 2023',
              image: 'images/lawBI.jpeg',
            ),
            NewsItem(
              header: 'Sports News',
              title: 'Consectetur adipiscing elit',
              info: 'Published: May 15, 2023',
              image: 'images/lawBI.jpeg',
            ),
            NewsItem(
              header: 'Technology News',
              title: 'Sed do eiusmod tempor',
              info: 'Published: May 14, 2023',
              image: 'images/lawBI.jpeg',
            ),
            // Add more news items as desired
          ],
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String header;
  final String title;
  final String info;
  final String image;

  NewsItem({
    required this.header,
    required this.title,
    required this.info,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            info,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          Image.asset(
            image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ), // Replace with your own image asset
          SizedBox(height: 16),
          Text(
            'Additional information about the news item can be displayed here.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 2);
    path.close();

    final paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
