class Menu {
  final String day;
  final List items;
  Menu({required this.day, required this.items});

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'items': items,
    };
  }

  Menu.fromSnapshot(Map<String, dynamic> snapshot)
      : day = snapshot['day'],
        items = snapshot['items'].toList();
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
      'docId': docId,
    };
  }
}
