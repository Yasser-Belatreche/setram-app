import 'package:flutter/material.dart';
import 'package:setram/src/core/workshops/api_contracts/get_workshops_query_params.dart';
import 'package:setram/src/core/workshops/api_contracts/workshop.dart';
import 'package:setram/src/core/workshops/workshops_service.dart';
import 'package:setram/src/screens/home/principle/widgets/workshops/workshop_item.dart';
import 'package:setram/src/ui/loader.dart';

class Workshops extends StatelessWidget {
  const Workshops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          "Ateliers 🧠:",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15),
        WorkshopsListController(),
      ],
    );
  }
}

class WorkshopsListController extends StatefulWidget {
  const WorkshopsListController({Key? key}) : super(key: key);

  @override
  State<WorkshopsListController> createState() =>
      _WorkshopsListControllerState();
}

class _WorkshopsListControllerState extends State<WorkshopsListController> {
  bool _loading = true;
  bool _lastPageReached = false;
  List<Workshop> _workshops = List.empty();
  final GetWorkshopsQueryParams _queryParams =
      GetWorkshopsQueryParams(page: 1, perPage: 10);

  @override
  void initState() {
    super.initState();

    _fetchNextPage();
  }

  Future<void> _fetchNextPage() async {
    if (_lastPageReached) return;

    final response = await getWorkshops(_queryParams);

    if (response.list.isNotEmpty) {
      setState(() {
        if (_loading) _loading = false;
        _workshops += response.list;
        _queryParams.page++;
      });
      return;
    }
    _lastPageReached = true;

    if (_loading) {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _lastPageReached = false;
      _loading = true;
      _queryParams.page = 1;
    });

    await _fetchNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const SizedBox(
            height: 150,
            child: Center(
              child: Loader(),
            ),
          )
        : WorkshopsList(
            list: _workshops,
            refresh: _refresh,
            onScrollEnd: _fetchNextPage,
          );
  }
}

class WorkshopsList extends StatelessWidget {
  final void Function() onScrollEnd;
  final void Function() refresh;
  final List<Workshop> list;

  const WorkshopsList({
    Key? key,
    required this.onScrollEnd,
    required this.list,
    required this.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list.isEmpty ? _buildEmptyState() : _buildList();
  }

  Widget _buildEmptyState() {
    return SizedBox(
      height: 150,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off),
            GestureDetector(
              onTap: refresh,
              child: const Text(
                "refrecher",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          onScrollEnd();
        }
        return true;
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list.map((workshop) {
            if (list.last == workshop) {
              return WorkshopItem(workshop: workshop);
            }

            return Row(
              children: [
                WorkshopItem(workshop: workshop),
                const SizedBox(width: 10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
