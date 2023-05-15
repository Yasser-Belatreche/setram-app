import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Announcements extends StatelessWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Annonces 📢 :",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              AnnouncementItem(),
              SizedBox(width: 10),
              AnnouncementItem(),
              SizedBox(width: 10),
              AnnouncementItem(),
              SizedBox(width: 10),
              AnnouncementItem(),
            ],
          ),
        ),
      ],
    );
  }
}

class AnnouncementItem extends StatelessWidget {
  const AnnouncementItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 123, 0, 245),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: const Icon(LineIcons.newspaper, color: Colors.white),
              ),
              Text(
                "2h ago",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Title",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Description l;kasdfulkq lasd fqywer f;lkasdjf yqwe falksdjf qywef lsdkfj qweyf sadlfkj qweurf asldkfj qwoeiuf asdl;kfj ",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
