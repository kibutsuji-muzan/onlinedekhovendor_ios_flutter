import 'package:flutter/material.dart';

class DoneSlider extends StatelessWidget {
  final Function() onSubmitCallback;

  DoneSlider({required this.onSubmitCallback});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive width and height based on screen size
    final buttonWidth = screenWidth * 0.9; // Adjust as needed
    final buttonHeight = screenHeight * 0.05; // Adjust as needed

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: () {
            _showConfirmationDialog(context);
          },
          child: Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF03a9f4),
                  Color(0xFF03a9f4),
                ],
              ),
              borderRadius: BorderRadius.circular(buttonHeight * 0.5), // Circular border radius
            ),
            alignment: Alignment.center,
            child: Text(
              ' Press to Done',
              style: TextStyle(color: Colors.white, fontSize: buttonHeight * 0.4), // Responsive font size
            ),
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Permission Required"),
          content: Text("Are you sure want to done this order?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onSubmitCallback(); // Ensure onSubmitCallback is invoked here
              },
              child: Text("Done"),
            ),
          ],
        );
      },
    );
  }
}
