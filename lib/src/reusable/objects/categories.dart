class Category {
  late int id;
  late String name;
  late String description;

  Category(this.id, this.name, this.description);

  int getId(){
    return id;
  }

  String getName(){
    return name;
  }

  String getDescription(){
    return description;
  }

}