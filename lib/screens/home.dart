import 'package:esp32test/screens/questioncard.dart';
import 'package:esp32test/screens/splashscreen.dart';
import 'package:esp32test/widgets/customclipper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int coins = 518;
     int selectedIndex = 1;
    final List<Map<String, dynamic>> questionTypes = [
  {'icon': Icons.menu, 'title': 'Multiple Choice'},
  {'icon': Icons.check, 'title': 'True/False'},
  {'icon': Icons.grid_on_rounded, 'title': 'Drag & Drop'},
  {'icon': Icons.grid_on_outlined, 'title': 'Flash Card'},
];
  @override
  Widget build(BuildContext context) {
  


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.notifications),
          actions: [
            Row(
              children: [
                Text.rich(
  TextSpan(
    children: [
      TextSpan(
        text: 'Atharva Dhawan\n',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(
         text: 'Coins: $coins',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[700],
        ),
      ),
    ],
  ),
  textAlign: TextAlign.left,
),

                CircleAvatar(child: Text("A")),
              ],
            )
          ],
        ),

        body:  Stack(
          children:[ 
            Positioned(
              left: 167,
                top: 190,
                child: CustomPaint(
              size: const Size(80, 80),
               painter: TrianglePainter(),
              ),
            ),

            Column(
            children: [
                      // Unit 1 Title
                      Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                       width: double.infinity,
                       height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255,46,204,156),
              borderRadius: BorderRadius.circular(16),
            
            ),
            child: Center(
              child: Text("Unit 1",
               style: TextStyle(fontSize: 20, 
               fontWeight: FontWeight.bold, 
               color: Colors.white)),
            ),
                      ),
                      SizedBox(height: 28,),
            CircleAvatar(
              minRadius: 25,
              backgroundColor: Color.fromARGB(255,46,204,156),
              child: 
            Icon(Icons.card_giftcard),
            ),
                      // Main Card with Gift Icon using Stack
                      Container(
            width: 300,
            height: 400,
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255,46,204,156),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(height: 18), // leave space for the icon above
                Align(alignment: Alignment.topLeft,child: Text("Easy", style: TextStyle(color: Colors.white, fontSize: 18))),
                SizedBox(height: 15,),
                Align(alignment: Alignment.topLeft,child: Text("Select Question Type:", style: TextStyle(color: Colors.white,fontSize: 14))),
                SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: questionTypes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,           // 2 per row
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 2/2.6,       // tweak based on button size
                ),
               itemBuilder: (context, index) {
    final item = questionTypes[index];
    return _questionTypeButton(
      item['icon'],
      item['title'],
      index,
    );
  },
              ),
                SizedBox(height: 16),
               
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
                      ),
          Positioned
           (bottom: 180,
           left: 0,
           right: 0,
             child: Container(
              height: 80,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color:  const Color.fromARGB(255,46,204,156),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 80,
                        width: 300,
                        child: ElevatedButton(onPressed: 
                        () {
                          if (coins >= 10) {
                          setState(() {
                        coins -= 10;
                           });
                        // Navigate to the GameScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:
                           (context) =>  QuestionCard()),
                       );
                         } else {
                     ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Not enough coins!")),
                          );
                       }
                        }
                        , child: Text('- 10 coins'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(10, 80)
                        ),
                        ),
                      ),
                      ),
                  ),
           ),
          ]
        ),
      ),
    );

  }
  Widget _questionTypeButton(IconData icon, String title, int index) {
    bool isSelected = index == selectedIndex;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(111, 41, 40, 40),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal),
        ),
        child: Column(
          children: [
             Icon(icon,color:  isSelected
              ? Color.fromARGB(255,46,204,156)
              : const Color.fromARGB(255, 255, 255, 255),),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(color: isSelected
              ? Color.fromARGB(255,46,204,156)
              : const Color.fromARGB(255, 255, 253, 253), fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
  
}
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255,46,204,156)
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


// Widget _questionTypeButton(Icon icon, String title, {bool isSelected = false}) {
//   return InkWell(
//     onTap: () {
      
//     },
//     hoverColor: Colors.grey,
//     focusColor: Colors.grey,
//     child: Container(
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//       decoration: BoxDecoration(
//         color: isSelected ? 
//         const Color.fromARGB(255, 15, 255, 227) : 
//         const Color.fromARGB(255, 41, 40, 40),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.teal),
//       ),
//       child: Column(
//         children: [
//           IconButton(onPressed: () {
//             isSelected = true;
//           }, icon: icon ,style: IconButton.styleFrom(
//             hoverColor: Colors.greenAccent,
//             foregroundColor: Colors.white
            
//           ),
//           ),
//           Text(title,
//           style: TextStyle(color: Colors.white,
//           fontSize: 13),)
//         ],
//       )
//     ),
//   );
//  }
// color: isSelected ? Colors.white : Colors.teal,
