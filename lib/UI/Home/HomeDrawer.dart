import 'package:flutter/material.dart';

typedef OnMenuItemClick = void Function(MenuItem clickedItemPos);
class HomeDrawer extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;

  HomeDrawer(this.onMenuItemClick);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 48,
              ),
              color: Theme.of(context).primaryColor,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'News App!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                onMenuItemClick(MenuItem.categories);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15,top: 25),
                child: Row(
                  children: [
                    Icon(Icons.view_list_rounded ,size: 34,),
                    SizedBox(width: 5,),
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Color(0xFF303030),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                onMenuItemClick(MenuItem.settings);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Icon(Icons.settings_rounded ,size: 34,),
                    SizedBox(width: 5,),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Color(0xFF303030),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


enum MenuItem{
  categories,
  settings
}