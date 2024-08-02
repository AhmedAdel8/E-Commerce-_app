class Item {
  String imgPath;
  double price;
  String location;
  String name;
  Item(
      {required this.imgPath,
      required this.price,
      required this.name,
      this.location = 'Main branch'});
}

final List<Item> items = [
  Item(name:"Product 1", imgPath: 'assets/images/1.webp', price: 12.99, location: 'Ahmed Shop'),
  Item(name:"Product 2",imgPath: 'assets/images/2.webp', price: 12.99),
  Item(name:"Product 3",imgPath: 'assets/images/3.webp', price: 12.99),
  Item(name:"Product 4",imgPath: 'assets/images/4.webp', price: 12.99),
  Item(name:"Product 5",imgPath: 'assets/images/5.webp', price: 12.99),
  Item(name:"Product 6",imgPath: 'assets/images/6.webp', price: 12.99),
  Item(name:"Product 7",imgPath: 'assets/images/7.webp', price: 12.99),
  Item(name:"Product 8",imgPath: 'assets/images/8.webp', price: 12.99),
];
