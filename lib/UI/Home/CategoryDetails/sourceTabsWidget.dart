import 'package:flutter/material.dart';
import 'package:news_app/SourcesResponse/Source.dart';
import 'package:news_app/UI/Home/CategoryDetails/TabWidget.dart';
import 'package:news_app/UI/Home/news/NewsListWidget.dart';


class sourceTabsWidget extends StatefulWidget {
  List<Source> sources;
  sourceTabsWidget(this.sources,{super.key});

  @override
  State<sourceTabsWidget> createState() => _sourceTabsWidgetState();
}

class _sourceTabsWidgetState extends State<sourceTabsWidget> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,

        child: Column(
          children: [
            const SizedBox(height: 15,),
            TabBar(
              indicatorColor: Colors.transparent,
              onTap: (newIndex){
                selectedIndex = newIndex;
                setState(() {

                });
              },
                isScrollable: true,
                tabs: widget.sources.map((source) => TabWidget(source,
                  widget.sources.indexOf(source) == selectedIndex
                )).toList()),
            Expanded(child: NewsListWidget(widget.sources[selectedIndex])),
          ],
        )

    );
  }
}
