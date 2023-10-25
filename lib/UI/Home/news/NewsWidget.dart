import 'package:flutter/material.dart';
import 'package:news_app/model/News.dart';

class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(news.image,
              height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
              )),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(
              children: [
                TextSpan(
                  text: news.author,
                  style: TextStyle(
                    color: Color(0xFF79828B),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Text(news.title,
            textAlign: TextAlign.start,
            style: TextStyle(
            color: Color(0xFF42505C),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),),
          Text(news.date,
            style: TextStyle(
            color: Color(0xFFA3A3A3),
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
