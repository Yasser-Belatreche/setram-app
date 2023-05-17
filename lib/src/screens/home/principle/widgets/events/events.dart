import 'package:flutter/material.dart';
import 'package:setram/src/core/events/api_contracts/event.dart';
import 'package:setram/src/core/events/api_contracts/get_events_query_params.dart';
import 'package:setram/src/core/events/events_service.dart';
import 'package:setram/src/screens/home/principle/widgets/events/event_item.dart';
import 'package:setram/src/ui/loader.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          "Evenememnts 🎟️:",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15),
        EventsListController(),
      ],
    );
  }
}

class EventsListController extends StatefulWidget {
  const EventsListController({Key? key}) : super(key: key);

  @override
  State<EventsListController> createState() => _EventsListControllerState();
}

class _EventsListControllerState extends State<EventsListController> {
  bool _loading = true;
  bool _lastPageReached = false;
  List<Event> _events = List.empty();
  final GetEventsQueryParams _queryParams =
      GetEventsQueryParams(page: 1, perPage: 10);

  @override
  void initState() {
    super.initState();

    _fetchNextPage();
  }

  Future<void> _fetchNextPage() async {
    if (_lastPageReached) return;

    final response = await getEvents(_queryParams);

    if (response.list.isNotEmpty) {
      setState(() {
        if (_loading) _loading = false;
        _events += response.list;
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
        : EventsList(
            list: _events,
            refresh: _refresh,
            onScrollEnd: _fetchNextPage,
          );
  }
}

class EventsList extends StatelessWidget {
  final void Function() onScrollEnd;
  final void Function() refresh;
  final List<Event> list;

  const EventsList({
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
          children: list.map((event) {
            if (list.last == event) {
              return EventItem(event: event);
            }

            return Row(
              children: [
                EventItem(event: event),
                const SizedBox(width: 10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
