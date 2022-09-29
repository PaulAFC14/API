class Product {
  late int id;
  late String name;
  late String description;
  late String features;
  late String cover;

  late dynamic brand;

  late dynamic category;

  late dynamic presentations;


  
  

  Product({
    required this.id,
    required this.name,
    required this.cover,
    required this.description,
    required this.features,
    required this.brand,
    required this.category,
    required this.presentations
  });

  int getId(){
    return id;
  }

  String getName() {
    return name;
  }

  String getDescription() {
    return description;
  }

  String getFeatures() {
    return features;
  }

  String getCover() {
    return cover;
  }

  int getBrandId(){
    return brand['id'];
  }

  dynamic getBrand(){
    return brand;
  }

  String getBrandName(){
    return brand['name'];
  }

  String getBrandDescription(){
    return brand['description'];
  }

  dynamic getCategory(){
    return category;
  }

  int getCategoryId(){
    return category['id'];
  }

  String getCategoryName(){
    return category['name'];
  }

  String getCategoryDescription(){
    return category['description'];
  }

  int getStock(){
    return presentations['stock'];
  }

  int getStockMin(){
    return presentations['stock_min'];
  }

  int getStockMax(){
    return presentations['stock_max'];
  }

  String getAmount(){
    return presentations['amount'];
  }
  
}



