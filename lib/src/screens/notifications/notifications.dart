import 'package:flutter/material.dart';
import 'package:setram/src/core/notifications/api_contracts/get_notifications_query_params.dart';
import 'package:setram/src/core/notifications/api_contracts/notification.dart'
as n;
import 'package:setram/src/core/notifications/notifications_service.dart';
import 'package:setram/src/screens/notifications/notification_item.dart';
import 'package:setram/src/ui/loader.dart';

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
      body: const NotificationsListController(),
    );
  }
}

class NotificationsListController extends StatefulWidget {
  const NotificationsListController({Key? key}) : super(key: key);

  @override
  State<NotificationsListController> createState() =>
      _NotificationsListControllerState();
}

class _NotificationsListControllerState
    extends State<NotificationsListController> {
  bool _loading = true;
  bool _lastPageReached = false;
  List<n.Notification> _notifications = List.empty();
  final GetNotificationsQueryParams _queryParams =
  GetNotificationsQueryParams(page: 1, perPage: 10);

  @override
  void initState() {
    super.initState();

    _fetchNextPage().then((value) async {
      await markNotificationsAsRead();
      return null;
    });
  }

  Future<void> _fetchNextPage() async {
    if (_lastPageReached) return;

    final response = await getNotifications(_queryParams);

    if (response.list.isNotEmpty) {
      setState(() {
        if (_loading) _loading = false;
        _notifications += response.list;
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
        : NotificationsList(
      list: _notifications,
      refresh: _refresh,
      onScrollEnd: _fetchNextPage,
    );
  }
}

class NotificationsList extends StatelessWidget {
  final void Function() onScrollEnd;
  final void Function() refresh;
  final List<n.Notification> list;

  const NotificationsList({
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
            const Icon(Icons.notifications_off),
            GestureDetector(
              onTap: refresh,
              child: const Text(
                "refrecher",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  fontSize: 14,
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
    return Row(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                onScrollEnd();
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: list.map((notification) {
                  final int lastIndex = list.indexOf(notification) - 1;

                  final bool currentNotificationIsRead = notification.read;
                  final bool lastNotificationIsUnread =
                  list.first == notification
                      ? !notification.read
                      : !list
                      .elementAt(lastIndex)
                      .read;

                  final bool firstRead =
                      currentNotificationIsRead && lastNotificationIsUnread;

                  if (firstRead) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        NotificationItem(notification: notification),
                      ],
                    );
                  }

                  return NotificationItem(notification: notification);
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
