import 'package:flutter/material.dart';
import 'package:setram/src/core/auth/api_contracts/employee.dart';
import 'package:setram/src/core/auth/auth_service.dart';
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
        const Salutation(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

class Salutation extends StatefulWidget {
  const Salutation({Key? key}) : super(key: key);

  @override
  State<Salutation> createState() => _SalutationState();
}

class _SalutationState extends State<Salutation> {
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
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Row(
        children: [
          Text(
            _employee == null
                ? "Bonjour 👋,"
                : "Bonjour ${_employee!.firstName} ${_employee!.lastName} 👋,",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
