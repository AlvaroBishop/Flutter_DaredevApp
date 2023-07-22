import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:daredevapp/law_detail_data.dart';
import 'package:flutter/material.dart';
import 'law_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        splash: Image.asset('images/justice-logo.png'),
        splashIconSize: 300,
        nextScreen: const HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MainScreen(),
    const NewsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DaredevApp'),
        foregroundColor: Colors.amber,
        titleTextStyle: const TextStyle(
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
            label: 'Home',
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

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  final imageData = images[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LawImageDetailScreen(imageData),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.grey,
                      child: Center(
                        child: Image.asset(
                          imageData['url'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Select the topic you need for legal consulting.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LawIconDetailScreen(iconsData[0]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CustomPaint(
                      painter: DiamondPainter(),
                      child: const Center(
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
                        builder: (context) => LawIconDetailScreen(iconsData[1]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CustomPaint(
                      painter: DiamondPainter(),
                      child: const Center(
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
                        builder: (context) => LawIconDetailScreen(iconsData[2]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CustomPaint(
                      painter: DiamondPainter(),
                      child: const Center(
                        child: Icon(Icons.car_crash, size: 40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LawIconDetailScreen(iconsData[3]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CustomPaint(
                      painter: DiamondPainter(),
                      child: const Center(
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
                        builder: (context) => LawIconDetailScreen(iconsData[4]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CustomPaint(
                      painter: DiamondPainter(),
                      child: const Center(
                        child: Icon(Icons.account_balance, size: 40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LawIconDetailScreen(iconsData[5]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CustomPaint(
                      painter: DiamondPainter(),
                      child: Center(
                        child: SizedBox(
                          width: 90,
                          height: 90,
                          child: CustomPaint(
                            painter: DiamondPainter(),
                            child: const Center(
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
                        builder: (context) => LawIconDetailScreen(iconsData[6]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CustomPaint(
                      painter: DiamondPainter(),
                      child: const Center(
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
                        builder: (context) => LawIconDetailScreen(iconsData[7]),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CustomPaint(
                      painter: DiamondPainter(),
                      child: const Center(
                        child:
                            Icon(Icons.airplanemode_active_rounded, size: 40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LawImageDetailScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const LawImageDetailScreen(this.data, {super.key});

  @override
  State<LawImageDetailScreen> createState() => _LawImageDetailScreenState();
}

class _LawImageDetailScreenState extends State<LawImageDetailScreen> {
  String containerText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.black, // Set the background color to black
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.data['info'],
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 70, // Adjust the height as desired
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: 'Option 1',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                  dropdownColor: Colors.white,
                  items: [
                    for (var index = 0;
                        index < widget.data['questions'].length;
                        index++)
                      DropdownMenuItem(
                        value: 'Option ${index + 1}',
                        child: Text(
                          widget.data['questions'][index],
                          style: const TextStyle(
                              fontSize: 9.6,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      switch (value) {
                        case 'Option 1':
                          containerText = widget.data[value];
                          break;
                        case 'Option 2':
                          containerText = widget.data[value];
                          break;
                        case 'Option 3':
                          containerText = widget.data[value];
                          break;
                        case 'Option 4':
                          containerText = widget.data[value];
                          break;
                        case 'Option 5':
                          containerText = widget.data[value];
                          break;
                        default:
                          containerText = '';
                      }
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                containerText,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LawIconDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const LawIconDetailScreen(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    String textName = data['caseName'];
    return Scaffold(
      appBar: AppBar(
        title: Text(textName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$textName Common Cases',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Case Information:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                data['information'],
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewsItem(
              title: 'A Brief Guide to Copyright Law',
              info: 'Published: May 16, 2023',
              image: 'images/intelectual.jpg',
              description:
                  "Copyright is a type of intellectual property that protects original works of authorship from being copied or used without permission. These rights last for a limited time, usually 70 years after the author’s death or 95 years after publication.\n"
                  "\n"
                  "The goal of copyright law is to encourage creativity and promote art and culture. This is stated in the U.S. Constitution, Article I section 8, clause 8.\n"
                  "\n"
                  "Copyright protects many kinds of works, such as paintings, books, music, movies, and more!\n"
                  "\n"
                  "To be protected, a work must be:\n"
                  "\n"
                  "Original: The work must be created by a human author and have some creativity. It cannot be copied or too common.\n"
                  "Fixed: The work must be recorded in a physical or digital form that can be seen or heard.",
            ),
            NewsItem(
              title: 'The Power of a Handshake in Business',
              info: 'Published: January 6, 2023',
              image: 'images/corporate.jpg',
              description:
                  "A handshake is one of the most common rituals in the workplace for greeting coworkers, clients or business partners. A person’s handshake is one of their first opportunities to use body language to form a positive professional relationship with someone else.\n"
                  "\n"
                  "A handshake can communicate a message of warmth, sincerity and trust. It can also show confidence, motivation and respect. A good handshake can create a lasting impression and set the tone for a successful interaction.\n"
                  "\n"
                  "But what makes a good handshake in business? Here are some key elements to consider:\n"
                  "\n"
                  "Dry hands: Make sure that your hands are clean and dry before shaking someone’s hand. Wet or sweaty hands can indicate nervousness or discomfort.\n\n"
                  "Initiative: Reach out first and offer your hand to show that you are confident and interested in the other person. If you’re sitting down, stand up before shaking hands as a sign of respect1.\n\n"
                  "Body language: Use open and welcoming body language when initiating a handshake. Face the other person, give them your full attention, and smile. Remove your hands from your pockets to show openness.\n\n"
                  "Perpendicular position: Keep your hand perpendicular to the floor with your thumb facing up. This shows that you value the other person as an equal. Avoid turning your hand up or down, as this can imply dominance or submission1.\n\n"
                  "Firm grip: Grip the other person’s hand firmly but gently with light pressure between your palm and thumb. A firm grip shows that you are attentive and engaged. Avoid squeezing too hard or too soft, as this can indicate aggression or weakness.\n\n"
                  "Good eye contact: Look the other person in the eyes while shaking their hand. This creates an instant connection and shows trustworthiness and confidence.\n\n"
                  "A handshake is more than just a gesture. It is a powerful tool to communicate your personality and intentions in business. By mastering the art of handshaking, you can make a positive impact on your professional relationships.",
            ),
            NewsItem(
              title: 'Medicine Law: A New Concept in Health Care',
              info: 'Published: July 26, 2023',
              image: 'images/health.jpg',
              description:
                  "Medicine Law is a term coined by Dr. John Smith, a cardiologist and a lawyer, who uses a stethoscope in the shape of a balance scale as his logo. He explains that Medicine Law is a new concept that combines the principles of medicine and law to provide better health care for his patients.\n\nAccording to Dr. Smith, Medicine Law is based on four pillars:\n\nDiagnosis: Using the stethoscope, he listens to the sounds of the body and identifies the problem.\nEvidence: Using the balance scale, he gathers and analyzes the relevant data and information to support his diagnosis.\nTreatment: Using his medical and legal expertise, he proposes and implements the best solution for his patient.\nJustice: Using his ethical and moral values, he ensures that his patient receives fair and quality care.\nDr. Smith says that Medicine Law is not only a way of practicing medicine, but also a way of thinking and living. He believes that by applying the principles of Medicine Law, he can help his patients achieve optimal health and well-being. He also hopes that his concept will inspire other doctors and lawyers to collaborate and innovate in their fields.\n\nMedicine Law is a novel and intriguing idea that challenges the traditional boundaries between medicine and law. It may offer new perspectives and opportunities for health care professionals and patients alike. What do you think of Medicine Law? Do you agree or disagree with Dr. Smith’s vision? Share your thoughts in the comments section below.",
            ),
          ],
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String title;
  final String info;
  final String image;
  final String description;

  const NewsItem({
    super.key,
    required this.title,
    required this.info,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            info,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(
            image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ), // Replace with your own image asset
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 16),
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
