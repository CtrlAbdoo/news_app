import 'package:flutter/material.dart';
import 'package:news_app/UI/Home/Categories/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  CategoryItem(this.category,this.index,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(24),
          topRight: const Radius.circular(24),
          bottomRight: Radius.circular(index.isEven? 0:24),
          bottomLeft: Radius.circular(index.isEven? 24:0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/${category.imageName}',
          height: 120,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Text(category.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Exo',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
