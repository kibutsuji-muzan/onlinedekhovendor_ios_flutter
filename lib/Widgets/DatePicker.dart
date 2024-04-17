import 'dart:async';
import 'package:flutter/material.dart';

class DateWidget extends StatefulWidget {
  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  TextEditingController dateController = TextEditingController();
  TextEditingController anotherDateController = TextEditingController(); // Add another controller

  @override
  void initState() {
    super.initState();
    dateController.text = "";
    anotherDateController.text = ""; // Initialize the second controller
  }

  @override
  Widget build(BuildContext context) {
    return Row( // Use a Row to arrange the text fields horizontally
      children: [
        SizedBox(height:30,),
        Expanded(
          child: TextField(
            controller: dateController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),),
              prefixIcon: Icon(Icons.calendar_month),
              labelText: "Enter From Date",
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                setState(() {
                  dateController.text = pickedDate.toString();
                });
              } else {
                print("Not Selected");
              }
            },
          ),
        ),
        SizedBox(width: 16), // Add some spacing between the text fields
        Expanded(
          child: TextField(
            controller: anotherDateController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              prefixIcon: Icon(Icons.calendar_month),
              labelText: "Enter To Date",
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                setState(() {
                  anotherDateController.text = pickedDate.toString();
                });
              } else {
                print("Not Selected");
              }
            },
          ),
        ),
        SizedBox(height: 10,)
      ],
    );

  }
}
