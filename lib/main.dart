import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background Image Changer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BackgroundImageChanger(),
    );
  }
}

class BackgroundImageChanger extends StatefulWidget {
  @override
  _BackgroundImageChangerState createState() => _BackgroundImageChangerState();
}

class _BackgroundImageChangerState extends State<BackgroundImageChanger> {
  String _backgroundImage = 'assets/background1.jpg'; // Initial background image
  final List<String> _images = [
    'assets/background1.jpeg',
    'assets/background2.jpeg',
    'assets/background3.jpeg',
    'assets/background4.jpg',
    'assets/background5.jpg',
  ]; // List of available images

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => _showActionSheet(context),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              'Tap to change background',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            children: <Widget>[
              SizedBox(height: 16),
              const Text(
                'Select Background Image',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _backgroundImage = _images[index];
                        });
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          image: DecorationImage(
                            image: AssetImage(_images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
