class FoodCategory {
  String name;
  int numberOfRestaurants;
  String imageUrl;

  FoodCategory(
    this.name,
    this.numberOfRestaurants,
    this.imageUrl,
  );
}

List<FoodCategory> categories = [
  FoodCategory('Dessert', 16, 'assets/categories/dessert.jpg'),
  FoodCategory('Vegetarian', 20, 'assets/categories/vegetarian.jpg'),
  FoodCategory('Burger', 21, 'assets/categories/burger.jpg'),
  FoodCategory('Asian', 16, 'assets/categories/asian.jpg'),
  FoodCategory('Italian', 18, 'assets/categories/italian.jpg'),
  FoodCategory('Mexican', 15, 'assets/categories/mexican.jpg'),
  FoodCategory('Seafood', 14, 'assets/categories/seafood.jpg'),
  FoodCategory('Pizza', 19, 'assets/categories/pizza.jpg'),
  FoodCategory('Sushi', 15, 'assets/categories/sushi.jpg'),
  FoodCategory('Coffee', 22, 'assets/categories/coffee.jpg'),
  FoodCategory('Fast Food', 23, 'assets/categories/fast_food.jpg'),
  FoodCategory('Salad', 18, 'assets/categories/salad.jpg'),
];
