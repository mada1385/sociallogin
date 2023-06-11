import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Polls/application/Pollsprovider.dart';
import 'package:social_login/features/Polls/domain/PollModel.dart';
import 'package:social_login/features/Polls/presentation/Components/PollsListingCard.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/shimmer.dart';

class PollList extends StatefulWidget {
  const PollList({
    Key key,
    this.pagingController,
  }) : super(key: key);
  final PagingController<int, POLL> pagingController;

  @override
  State<PollList> createState() => _PollListState();
}

class _PollListState extends State<PollList> {
  @override
  void initState() {
    widget.pagingController.addPageRequestListener((pageKey) async {
      Logger().d("hello");
      final pov = Provider.of<PollsProvider>(context, listen: false);
      pov.fetchPage(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<PollsProvider>(context).loading
        ? const LoadingListPage()
        : PagedListView.separated(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig().widthr(8, context)),
            pagingController: widget.pagingController,
            builderDelegate: PagedChildBuilderDelegate<POLL>(
              itemBuilder: (context, item, index) => PollsListingCard(
                poll: item,
              ),
            ),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            });
  }
}
