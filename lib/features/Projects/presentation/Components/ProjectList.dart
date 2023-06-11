import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Projects/application/Projectprovider.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/features/Projects/presentation/Components/ProjectsListingCard.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/shimmer.dart';

enum ListProject { projects, favourite, myProject }

class ProjectList extends StatefulWidget {
  const ProjectList({
    Key key,
    this.pagingController,
  }) : super(key: key);
  final PagingController<int, Project> pagingController;

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  Color color = Colors.black;
  @override
  void initState() {
    Logger().d("hello");
    widget.pagingController.addPageRequestListener((pageKey) async {
      final pov = Provider.of<ProjectsProvider>(context, listen: false);
      pov.fetchPage(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<ProjectsProvider>(context).loading
        ? const LoadingListPage()
        : PagedListView.separated(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig().widthr(8, context)),
            pagingController: widget.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Project>(
              itemBuilder: (context, item, index) => ProjectListingCard(
                project: item,
              ),
            ),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            });
  }
}
