class Menu {
  final String day;
  final List<FoodItem> items;
  Menu({required this.day, required this.items});

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'items': items,
    };
  }
}

class FoodItem {
  final String name;
  final String imageUrl;
  FoodItem({required this.imageUrl, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
