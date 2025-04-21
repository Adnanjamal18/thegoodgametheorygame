import 'package:esp32test/widgets/customclipper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.notifications),
          actions: [
            Row(
              children: [
                Text("Atharva Dhawan"),
                Text("Coins: 518"),
                CircleAvatar(child: Text("A")),
              ],
            )
          ],
        ),

        body:  Stack(
          children:[ 
  
            Positioned(
              left: 192,
                top: 202,
                child: CustomPaint(
              size: const Size(27, 27),
               painter: TrianglePainter(),
              ),
            ),

            Column(
            children: [
          // Profile & Coins Section (Top)
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.notifications),

              
              ],
            ),
          ),
                
              
          // Unit 1 Title
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text("Unit 1",
             style: TextStyle(fontSize: 20, 
             fontWeight: FontWeight.bold, 
             color: Colors.white)),
          ),
          SizedBox(height: 28,),
            CircleAvatar(child: 
            Icon(Icons.card_giftcard),
            ),
          // Main Card with Gift Icon using Stack
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(height: 24), // leave space for the icon above
                Align(alignment: Alignment.topLeft,child: Text("Easy", style: TextStyle(color: Colors.white, fontSize: 18))),
                SizedBox(height: 28,),
                Align(alignment: Alignment.topLeft,child: Text("Select Question Type:", style: TextStyle(color: Colors.white,fontSize: 14))),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    // Custom buttons
                    _questionTypeButton("Multiple Choice"),
                    _questionTypeButton("True/False", isSelected: true),
                    _questionTypeButton("Drag & Drop"),
                    _questionTypeButton("Flash Card"),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("-10 COINS", style: TextStyle(color: Colors.teal)),
                ),
              ],
            ),
          ),
            // Positioned(
            //   bottom: 12,
            //   child: Transform.rotate(
            //     angle: 3.14 / 4, // 45 degrees
            //     child: Container(
            //       width: 20,
            //       height: 20,
            //       color: Colors.green,
            //     ),
            //   ),
            // ),
            ],
          ),]
        ),
      ),
    );

  }
}
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color =  Colors.teal
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(size.width / 2, 0) // Top center
      ..lineTo(0, size.height)    // Bottom left
      ..lineTo(size.width, size.height) // Bottom right
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


Widget _questionTypeButton(String title, {bool isSelected = false}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    decoration: BoxDecoration(
      color: isSelected ? Colors.teal.shade700 : Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.teal),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.teal,
      ),
    ),
  );
}

