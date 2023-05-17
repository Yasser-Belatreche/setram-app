import 'package:flutter/material.dart';
import 'package:setram/src/core/announcements/announcements_service.dart';
import 'package:setram/src/core/announcements/api_contracts/announcement.dart';
import 'package:setram/src/core/announcements/api_contracts/get_announcements_query_params.dart';
import 'package:setram/src/screens/home/principle/widgets/announcements/announcement_item.dart';
import 'package:setram/src/ui/loader.dart';

class Announcements extends StatelessWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          "Annonces 📢 :",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15),
        AnnouncementsListController(),
      ],
    );
  }
}

class AnnouncementsListController extends StatefulWidget {
  const AnnouncementsListController({Key? key}) : super(key: key);

  @override
  State<AnnouncementsListController> createState() =>
      _AnnouncementsListControllerState();
}

class _AnnouncementsListControllerState
    extends State<AnnouncementsListController> {
  bool _loading = true;
  bool _lastPageReached = false;
  List<Announcement> _announcements = List.empty();
  final GetAnnouncementsQueryParams _queryParams =
      GetAnnouncementsQueryParams(page: 1, perPage: 10);

  @override
  void initState() {
    super.initState();

    _fetchNextPage();
  }

  Future<void> _fetchNextPage() async {
    if (_lastPageReached) return;

    final response = await getAnnouncements(_queryParams);

    if (response.list.isNotEmpty) {
      setState(() {
        if (_loading) _loading = false;
        _announcements += response.list;
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
        : AnnouncementsList(
            list: _announcements,
            refresh: _refresh,
            onScrollEnd: _fetchNextPage,
          );
  }
}

class AnnouncementsList extends StatelessWidget {
  final void Function() onScrollEnd;
  final void Function() refresh;
  final List<Announcement> list;

  const AnnouncementsList({
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
          children: list.map((announcement) {
            if (list.last == announcement) {
              return AnnouncementItem(announcement: announcement);
            }

            return Row(
              children: [
                AnnouncementItem(announcement: announcement),
                const SizedBox(width: 10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
