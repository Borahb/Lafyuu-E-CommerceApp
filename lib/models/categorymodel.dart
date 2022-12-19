class CategoryItem {

static final category = [
  Category(id: 1, name: 'Man Shirt', image: 'images/shirt.png'),
  Category(id: 2, name: 'Dress', image: 'images/dress.png'),
  Category(id: 3, name: 'Man Work\nEquipment', image: 'images/man bag.png'),
  Category(id: 4, name: 'Woman Bag', image: 'images/woman bag.png'),
  Category(id: 5, name: 'Shoe', image: 'images/shirt.png'),
];


}


class Category {
  final int id;
  final String name;
  final String image;
  Category({required this.id, required this.name, required this.image});

}