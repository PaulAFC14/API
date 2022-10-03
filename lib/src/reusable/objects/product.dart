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
    return brand[0]['id'];
  }

  dynamic getBrand(){
    return brand;
  }

  String getBrandName(){
    return brand[0]['name'];
  }

  String getBrandDescription(){
    return brand[0]['description'];
  }

  dynamic getCategory(){
    return category;
  }

  int getCategoryId(){
    return category[0]['id'];
  }

  String getCategoryName(){
    return category[0]['name'];
  }

  String getCategoryDescription(){
    return category[0]['description'];
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



