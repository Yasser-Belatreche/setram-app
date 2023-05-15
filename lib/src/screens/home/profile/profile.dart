import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ProfileIconAndFullName(),
          Divider(height: 50),
          ProfileItem(
            icon: LineIcons.penNib,
            label: "Nom",
            value: "Belatreche",
          ),
          Divider(height: 30),
          ProfileItem(
            icon: LineIcons.penNib,
            label: "Preson",
            value: "Yasser",
          ),
          Divider(height: 30),
          ProfileItem(
            icon: LineIcons.genderless,
            label: "Sex",
            value: "Male",
          ),
          Divider(height: 30),
          ProfileItem(
            icon: LineIcons.birthdayCake,
            label: "Date de naissance",
            value: "18/11/2002",
          ),
          Divider(height: 30),
          ProfileItem(
            icon: LineIcons.businessTime,
            label: "Departement",
            value: "Informatique",
          ),
          Divider(height: 30),
          ProfileItem(
            icon: LineIcons.at,
            label: "Email",
            value: "yasser.belatreche@yalitec.com",
          ),
          Divider(height: 30),
          ProfileItem(
            icon: LineIcons.phone,
            label: "Telephone",
            value: "07 98 08 92 38",
          ),
          Divider(height: 30),
          ProfileItem(
            icon: LineIcons.calendarCheck,
            label: "Joined",
            value: "18/11/2002",
          ),
        ],
      ),
    );
  }
}

class ProfileIconAndFullName extends StatelessWidget {
  const ProfileIconAndFullName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey.shade50,
          child: const Icon(LineIcons.user, color: Colors.black, size: 40.0),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "John Snow",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
            ),
            Text(
              "Male",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        )
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const ProfileItem(
      {Key? key, required this.label, required this.icon, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
