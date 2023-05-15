import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 244, 255, 1),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text("Notifications"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Notification(
              title: "Test",
              isNew: true,
              description:
                  "Lorem isppu sadlfkjas df; asdkl;fja sdpoifj asdl;kfj akl;sdfj lkasdjf ;laksdfj ; laksdjfiasdf lkaysdfjqwle ; ;lakmsdlfyuq  asdfulkasd f",
            ),
            Notification(
              title: "Test",
              isNew: true,
              description:
                  "Lorem isppu sadlfkjas df; asdkl;fja sdpoifj asdl;kfj akl;sdfj lkasdjf ;laksdfj ; laksdjfiasdf lkaysdfjqwle ; ;lakmsdlfyuq  asdfulkasd f",
            ),
            Notification(
              title: "Test",
              isNew: true,
              description:
                  "Lorem isppu sadlfkjas df; asdkl;fja sdpoifj asdl;kfj akl;sdfj lkasdjf ;laksdfj ; laksdjfiasdf lkaysdfjqwle ; ;lakmsdlfyuq  asdfulkasd f",
            ),
            SizedBox(height: 20),
            Notification(
              title: "Test",
              isNew: false,
              description:
                  "Lorem isppu sadlfkjas df; asdkl;fja sdpoifj asdl;kfj akl;sdfj lkasdjf ;laksdfj ; laksdjfiasdf lkaysdfjqwle ; ;lakmsdlfyuq  asdfulkasd f",
            )
          ],
        ),
      ),
    );
  }
}

class Notification extends StatelessWidget {
  final String title;
  final String description;
  final bool isNew;

  const Notification({
    Key? key,
    required this.title,
    required this.description,
    required this.isNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isNew
                  ? const Color.fromARGB(255, 123, 0, 245)
                  : const Color.fromARGB(25, 123, 0, 245),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(LineIcons.clock, size: 12),
                    SizedBox(width: 5),
                    Text(
                      "10 minute",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
