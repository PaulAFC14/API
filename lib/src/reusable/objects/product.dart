class Product {
  late int id;
  late String name;
  late String description;
  late String features;
  late String cover;



  
  

  Product({
    required this.id,
    required this.name,
    required this.cover,
    required this.description,
    required this.features,

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

  
}



