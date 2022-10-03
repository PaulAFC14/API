

import 'package:aco/src/reusable/objects/product.dart';
import 'package:aco/src/reusable/objects/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, utf8;

class Stock {
  late User user;

  Stock(this.user){
  }
  

  Future<Product> getSpecificProduct(int index) async{
    String token = 'Bearer ' + user.getToken();

    var headers = {
      'Authorization': token,
    };
    var request = http.Request('GET', Uri.parse('https://crud.jonathansoto.mx/api/products/' + index.toString()));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> answer = json.decode(await response.stream.bytesToString());
      Map<String, dynamic> data = answer['data'];

      int id;
      String name;
      String description;
      String features;
      String cover;

      dynamic brand;
      dynamic category;
      dynamic presentations;

      if(data['id'] != null){
        id = data['id'];
      }else{
        id = 0;
      }

      if(data['name'] != null){
        name = data['name'];
      }else{
        name = 'No-name';
      }

      if(data['description'] != null){
        description = data['description'];
      }else{
        description = 'No description';
      }

      if(data['features'] != null){
        features = data['features'];
      }else{
        features = 'No features';
      }

      if(data['cover'] != null){
        cover = data['cover'];
      }else{
        cover = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMdp9MQCrqZ8PZAdc-3I7XjAjFdDzFJgd0q1eg1Ac7VosB-GCr_prmyEJrveiAE-pu34E&usqp=CAU';
      }

      if(data['brand'] != null){
        brand = data['brand'];
      }else{
        brand = {
          'id' : 0,
          'name' : 'Unknown brand',
          'description' :'No description' 
        };
      }

      if(data['categories'] != null){
        category = data['categories'];
      }else{
        category = {
          'id' : 0,
          'name' : 'Unknown category',
          'description' :'No description' 
        };
      }

      if(data['presentations'] != null){
        presentations = data['presentations'];
      }else{
        presentations = {
          'amount' : 0.0
        };
      }

      Product product = Product(id: id, name: name, cover: cover, description: description, features: features, brand: brand, category: category, presentations: presentations);
      
      return product;

    }
    else {
      print(response.reasonPhrase);
      throw Exception('Someting went wrong');
    }

  }


  Future<List<Product>> getAllProducts() async{
    List<Product> products = [];

    for(int i = 1; i < 31; i++){
      Product product = await getSpecificProduct(i);
      products.add(product);
    }

    return products;
  }

  Future<List<dynamic>> getCategories() async {
    List<Product> products = await getAllProducts();
    List<dynamic> categories = [];
    dynamic aux;
    int idAux;
    bool repeat = false;

    for(int i = 0; i < products.length; i++){
      aux = products[i].getCategory()[0];
      idAux = aux['id'];
      repeat = false;

      if(categories.length > 0){
        for(int r = 0; r < categories.length; i++){
          if(idAux == categories[r]['id']){
            repeat = true;
          }
        }
      }
      
      if(!repeat){
        categories.add(aux);
      }
    }

    return categories;

  }

  
  

  

}