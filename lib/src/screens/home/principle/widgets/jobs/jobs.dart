import 'package:flutter/material.dart';
import 'package:setram/src/core/jobs/api_contracts/get_jobs_query_params.dart';
import 'package:setram/src/core/jobs/api_contracts/job.dart';
import 'package:setram/src/core/jobs/jobs_service.dart';
import 'package:setram/src/screens/home/principle/widgets/jobs/job_item.dart';
import 'package:setram/src/ui/loader.dart';

class Jobs extends StatelessWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Post de travail 💼:",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15),
        JobsListController(),
      ],
    );
  }
}

class JobsListController extends StatefulWidget {
  const JobsListController({Key? key}) : super(key: key);

  @override
  State<JobsListController> createState() => _JobsListControllerState();
}

class _JobsListControllerState extends State<JobsListController> {
  bool _loading = true;
  bool _lastPageReached = false;
  List<Job> _jobs = List.empty();
  final GetJobsQueryParams _queryParams =
      GetJobsQueryParams(page: 1, perPage: 10);

  @override
  void initState() {
    super.initState();

    _fetchNextPage();
  }

  Future<void> _fetchNextPage() async {
    if (_lastPageReached) return;

    final response = await getJobs(_queryParams);

    if (response.list.isNotEmpty) {
      setState(() {
        if (_loading) _loading = false;
        _jobs += response.list;
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
        : JobsList(
            list: _jobs,
            refresh: _refresh,
            onScrollEnd: _fetchNextPage,
          );
  }
}

class JobsList extends StatelessWidget {
  final void Function() onScrollEnd;
  final void Function() refresh;
  final List<Job> list;

  const JobsList({
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
          children: list.map((job) {
            if (list.last == job) {
              return JobItem(job: job);
            }

            return Row(
              children: [
                JobItem(job: job),
                const SizedBox(width: 10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
