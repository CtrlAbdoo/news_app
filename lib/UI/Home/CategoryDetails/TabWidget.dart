import 'package:flutter/material.dart';
import 'package:news_app/SourcesResponse/Source.dart';


class TabWidget extends StatelessWidget {
  Source source;
  bool isSelected;
  TabWidget(this.source,this.isSelected,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isSelected? Theme.of(context).primaryColor:Colors.white,
        border: Border.all(color: Theme.of(context).primaryColor,width: 2)
      ),
      child: Text(source.name??'',
        style: TextStyle(
          color: isSelected? Colors.white:Theme.of(context).primaryColor,
          fontSize: 14,
          fontFamily: 'Exo',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
