import 'package:flutter/material.dart';
import 'package:setram/src/screens/home/principle/widgets/announcements/announcements.dart';
import 'package:setram/src/screens/home/principle/widgets/events/events.dart';
import 'package:setram/src/screens/home/principle/widgets/jobs/jobs.dart';
import 'package:setram/src/screens/home/principle/widgets/workshops/workshops.dart';

class Principle extends StatelessWidget {
  const Principle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 40),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Row(
            children: const [
              Text(
                "Bonjour John Doe 👋,",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                Announcements(),
                SizedBox(height: 40),
                Events(),
                SizedBox(height: 40),
                Workshops(),
                SizedBox(height: 40),
                Jobs(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
