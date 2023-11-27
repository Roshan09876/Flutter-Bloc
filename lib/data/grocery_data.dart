class GroceryData {
  static List<Map<String, dynamic>> groceryProducts = [
    {
      'id': '1',
      'name': 'Apple',
      'description': 'Fresh and juicy apple',
      'price': 25.0,
      'imageUrl':'https://cdn.britannica.com/22/187222-050-07B17FB6/apples-on-a-tree-branch.jpg',
    },
    {
      'id': '2',
      'name': 'Banana',
      'description': 'Ripe banana',
      'price': 10.0,
      'imageUrl':'https://images.everydayhealth.com/images/diet-nutrition/all-about-bananas-nutrition-facts-health-benefits-recipes-and-more-rm-722x406.jpg',
    },
    {
      'id': '3',
      'name': 'Carrot',
      'description': 'Organic carrot',
      'price': 1.75,
      'imageUrl': 'https://extension.usu.edu/nutrition/images/carrot-head.png',
    },
    {
      'id': '4',
      'name': 'Orange',
      'description': 'Sweet and tangy orange',
      'price': 15.0,
      'imageUrl': 'https://www.allrecipes.com/thmb/y_uvjwXWAuD6T0RxaS19jFvZyFU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1205638014-2000-d0fbf9170f2d43eeb046f56eec65319c.jpg',
    },
  ];
}

// // Example of accessing the grocery list outside the class
// void main() {
//   // Access the grocery list using the class
//   for (var item in GroceryData.items) {
//     print('ID: ${item['id']}');
//     print('Name: ${item['name']}');
//     print('Description: ${item['description']}');
//     print('Price: \$${item['price']}');
//     print('Image: ${item['image']}');
//     print('---------------------------');
//   }
// }
