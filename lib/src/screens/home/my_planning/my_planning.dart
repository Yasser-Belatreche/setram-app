import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:setram/src/core/planning/api_contracts/employee_planning.dart';
import 'package:setram/src/core/planning/planning_service.dart';
import 'package:setram/src/screens/home/my_planning/day_activity_item.dart';
import 'package:setram/src/ui/loader.dart';

class MyPlanning extends StatefulWidget {
  const MyPlanning({Key? key}) : super(key: key);

  @override
  State<MyPlanning> createState() => _MyPlanningState();
}

class _MyPlanningState extends State<MyPlanning> {
  EmployeePlanning? _planning;

  @override
  void initState() {
    super.initState();

    _fetchPlanning();
  }

  Future<void> _fetchPlanning() async {
    final response = await getMyPlanning();

    setState(() {
      _planning = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _planning == null
        ? const Center(child: Loader())
        : PlanningView(planning: _planning!);
  }
}

class PlanningView extends StatefulWidget {
  final EmployeePlanning planning;

  const PlanningView({Key? key, required this.planning}) : super(key: key);

  @override
  State<PlanningView> createState() => _PlanningViewState();
}

class _PlanningViewState extends State<PlanningView> {
  DateTime _selectedDate = DateTime.now();

  List<DayTiming> _getSelectedDayActivites() {
    final Map<int, List<DayTiming>> weekDayMap = {
      7: widget.planning.sunday,
      1: widget.planning.monday,
      2: widget.planning.tuesday,
      3: widget.planning.wednesday,
      4: widget.planning.thursday,
      5: widget.planning.friday,
      6: widget.planning.saturday,
    };

    print(widget.planning.wednesday);

    return weekDayMap[_selectedDate.weekday]!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DayPicker(
          selectedDate: _selectedDate,
          onChange: (date) {
            setState(() {
              _selectedDate = date;
            });
          },
        ),
        DayActivities(list: _getSelectedDayActivites()),
      ],
    );
  }
}

class DayPicker extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onChange;

  const DayPicker({
    Key? key,
    required this.onChange,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('MMM, d').format(selectedDate),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          DatePicker(
            DateTime.now(),
            locale: "fr",
            daysCount: 7,
            initialSelectedDate: selectedDate,
            selectionColor: const Color.fromARGB(255, 123, 0, 245),
            onDateChange: onChange,
          )
        ],
      ),
    );
  }
}

class DayActivities extends StatelessWidget {
  final List<DayTiming> list;

  const DayActivities({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Activites",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: list
                  .map((activity) => DayActivityItem(activity: activity))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
