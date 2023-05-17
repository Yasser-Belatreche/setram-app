import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:setram/src/core/auth/api_contracts/employee.dart';
import 'package:setram/src/core/auth/auth_service.dart';
import 'package:setram/src/screens/home/profile/profile_item.dart';
import 'package:setram/src/ui/loader.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Employee? _employee;

  @override
  void initState() {
    super.initState();

    _fetchEmployee();
  }

  Future<void> _fetchEmployee() async {
    final response = await getAuthEmployee();

    setState(() {
      _employee = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _employee == null
        ? const Center(child: Loader())
        : ProfileView(employee: _employee!);
  }
}

class ProfileView extends StatelessWidget {
  final Employee employee;

  const ProfileView({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileIconAndFullName(employee: employee),
        const SizedBox(height: 30),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileItem(
                  icon: LineIcons.penNib,
                  label: "Nom",
                  value: employee.lastName,
                ),
                ProfileItem(
                  icon: LineIcons.penNib,
                  label: "Preson",
                  value: employee.firstName,
                ),
                ProfileItem(
                  icon: LineIcons.genderless,
                  label: "Sexe",
                  value: employee.gender,
                ),
                ProfileItem(
                  icon: LineIcons.birthdayCake,
                  label: "Date de naissance",
                  value: DateFormat.yMd().format(employee.birthDate),
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  icon: LineIcons.businessTime,
                  label: "Departement",
                  value: employee.department,
                ),
                ProfileItem(
                  icon: LineIcons.at,
                  label: "Email",
                  value: employee.email,
                ),
                ProfileItem(
                  icon: LineIcons.phone,
                  label: "Telephone",
                  value: employee.phoneNumber,
                ),
                ProfileItem(
                  icon: LineIcons.calendarCheck,
                  label: "Joined",
                  value: DateFormat.yMd().format(employee.startingDate),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileIconAndFullName extends StatelessWidget {
  final Employee employee;

  const ProfileIconAndFullName({Key? key, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Row(
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
              Text(
                "${employee.firstName} ${employee.lastName}",
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              Text(
                employee.email,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
