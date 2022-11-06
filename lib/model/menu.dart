class Menu {
  final String day;
  final List<String> items;
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
  final String docId;
  FoodItem({required this.imageUrl, required this.name, required this.docId});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
