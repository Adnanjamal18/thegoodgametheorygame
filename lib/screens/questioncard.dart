import 'dart:math';

import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({super.key});
  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> with TickerProviderStateMixin {
  final List<String> questions = [
    "Is Flutter made by Google?",
    "Is the earth flat?",
    "Is 2 + 2 = 4?",
    "Can penguins fly?",
  ];

  int currentIndex = 0;
  bool isShaking = false;
  bool isSliding = false;
  bool isRotating = false;

  late AnimationController slideController;
  late Animation<Offset> slideAnimation;

  late AnimationController rotateController;
  late Animation<double> rotationAnimation;
  late Animation<double> rotateAnimation;

  @override
  void initState() {
    super.initState();

    slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    slideAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(-1.5, 0))
        .animate(CurvedAnimation(parent: slideController, curve: Curves.easeInOut));


    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    rotateAnimation = Tween<double>(begin: 0, end: 2 * 3.1416).animate(
      CurvedAnimation(parent: rotateController, curve: Curves.easeInOut),
    );

  }



  void goToNextQuestion() {
    setState(() {
      currentIndex = (currentIndex + 1) % questions.length;
      isSliding = false;
    });
  }

  void handleRight() {
    setState(() {
      isSliding = true;
    });

    slideController.forward(from: 0).whenComplete(() {
      setState(() {
        isSliding = false;
        currentIndex = (currentIndex + 1) % questions.length;
      });
    });
  }



  void handleWrong() {
    setState(() {
      isRotating = true;
    });

    rotateController.forward(from: 0).whenComplete(() {
      setState(() {
        isRotating = false;
        currentIndex = (currentIndex + 1) % questions.length;
      });
    });
  }

  @override
  void dispose() {
    rotateController.dispose();
    slideController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
   body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔁 Animated card
          SlideTransition(
            position: isSliding ? slideAnimation : AlwaysStoppedAnimation(Offset.zero),
            child: AnimatedBuilder(
              animation: rotateAnimation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateY(isRotating ? rotateAnimation.value : 0),
                  child: child,
                );
              },
              child: SizedBox(
                width: 300,
                height: 200,
                child: Card(
                  elevation: 8,
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: Text(
                        question,
                        style: const TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // ✅ Buttons row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: handleWrong,
                  icon: const Icon(Icons.close),
                  label: const Text(""),
                  //style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                ElevatedButton.icon(
                  onPressed: handleRight,
                  icon: const Icon(Icons.check),
                  label: const Text(""),
                 // style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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