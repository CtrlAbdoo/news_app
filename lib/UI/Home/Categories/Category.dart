import 'dart:ui';

class Category{
  String id;
  String title;
  Color color;
  String imageName;

  Category(this.id, this.title, this.color, this.imageName);

  static List<Category> getAllCategories(){
    return[
      Category('sports', 'Sports', const Color(0xFFC91C22), 'sports.png'),
      Category('general', 'General', const Color(0xFF003E90), 'general.png'),
      Category('health', 'Health', const Color(0xFFED1E79), 'health.png'),
      Category('business', 'Business', const Color(0xFFCF7E48), 'business.png'),
      Category('technology', 'Technology', const Color(0xFF4882CF), 'technology.png'),
      Category('science', 'Science', const Color(0xFFF2D352), 'science.png'),
    ];
  }
}