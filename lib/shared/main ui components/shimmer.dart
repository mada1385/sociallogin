import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social_login/shared/main%20ui%20components/placeholder.dart';

class LoadingListPage extends StatefulWidget {
  const LoadingListPage({Key key, this.vertical = true}) : super(key: key);
  final bool vertical;

  @override
  State<LoadingListPage> createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SingleChildScrollView(
          scrollDirection: widget.vertical ? Axis.vertical : Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: widget.vertical
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    SizedBox(height: 16.0),
                    ContentPlaceholder(
                      lineType: ContentLineType.threeLines,
                    ),
                    SizedBox(height: 16.0),
                    ContentPlaceholder(
                      lineType: ContentLineType.twoLines,
                    ),
                    SizedBox(height: 16.0),
                    ContentPlaceholder(
                      lineType: ContentLineType.twoLines,
                    ),
                    SizedBox(height: 16.0),
                    ContentPlaceholder(
                      lineType: ContentLineType.twoLines,
                    ),
                    SizedBox(height: 16.0),
                    ContentPlaceholder(
                      lineType: ContentLineType.twoLines,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    SizedBox(height: 16.0),
                    HorizntalContentPlaceholder(
                      lineType: ContentLineType.threeLines,
                    ),
                    SizedBox(height: 16.0),
                    HorizntalContentPlaceholder(
                      lineType: ContentLineType.twoLines,
                    ),
                    SizedBox(height: 16.0),
                    HorizntalContentPlaceholder(
                      lineType: ContentLineType.twoLines,
                    ),
                    SizedBox(height: 16.0),
                    HorizntalContentPlaceholder(
                      lineType: ContentLineType.twoLines,
                    ),
                    SizedBox(height: 16.0),
                    HorizntalContentPlaceholder(
                      lineType: ContentLineType.twoLines,
                    ),
                  ],
                )),
    );
  }
}
