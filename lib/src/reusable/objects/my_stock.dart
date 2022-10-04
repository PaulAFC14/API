import 'package:aco/src/reusable/objects/categories.dart';
import 'package:aco/src/reusable/objects/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, utf8;

import 'product.dart';

class MyStock {
  late User user;

  MyStock(this.user);

  Future<List<Product>> getAllProducts() async {
    String token = 'Bearer ' + user.getToken();

    var headers = {
      'Authorization': token
    };
    var request = http.Request('GET', Uri.parse('https://crud.jonathansoto.mx/api/products'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> answer = json.decode(await response.stream.bytesToString());
      List<dynamic> data = answer['data'];
      List<Product> products = [];
      
      for(int i = 0; i < data.length; i++){
        Map<String, dynamic> item = data[i];

        int id;
        String name;
        String description;
        String features;
        String cover;

        dynamic brand;


        List<dynamic> category;
        int idCategory;
        String nameCategory;
        String descriptionCategory;

        dynamic presentations;



        id = item['id'] ?? 0;
        name= item['name'] ?? 'No-name';
        description = item['description'] ?? 'No-description';
        features = item['features'] ?? 'No-features';
        cover = item['cover'] ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMdp9MQCrqZ8PZAdc-3I7XjAjFdDzFJgd0q1eg1Ac7VosB-GCr_prmyEJrveiAE-pu34E&usqp=CAU';
        
        category = item['categories'];

        idCategory = category[0]['id'];
        nameCategory = category[0]['name'];
        descriptionCategory = category[0]['description'];

        print(nameCategory);



      }

      return products;
    }
          
    else {
      print(response.reasonPhrase);
      throw Exception('Diego tonto');
    }

  }

  /*Future<List<Category>> getCategories() async {
    List<Product> products = await getAllProducts();
    List<Category> categories = [];
    Category aux;

    for (int i = 0; i < products.length; i++) {
      int id = products[i].getCategoryId();
      String name = products[i].getCategoryName();
      String description = products[i].getCategoryDescription();

      Category category = Category(id, name, description);

      categories.add(category);
      
    }

    for (int i = 0; i <= categories.length - 2; i++) {
      for (int j = 0; j <= categories.length - i - 2; j++) {
        if (categories[j].getId() > categories[j + 1].getId()) {
          aux = categories[j];
          categories[j] = categories[j + 1];
          categories[j + 1] = aux;
        }
      }
    }

    print('<<<<<<<<<<CON REPETIDOS>>>>>>>>>>');

    for (int i = 0; i < categories.length; i++) {
      print('${(i + 1)} -> ${categories[i].getId()}');
    }

    print('Con repetidos ${categories.length}');

    for (int i = 1; i < categories.length; i++) {
      if (categories[i].getId() == categories[i - 1].getId()) {
        categories.removeAt(i - 1);
        i--;
      }
    }

    print('<<<<<<<<<<SIN REPETIDOS>>>>>>>>>>');

    for (int i = 0; i < categories.length; i++) {
      print('${(i + 1)} -> ${categories[i].getId()}');
    }

    print('Sin repetidos ${categories.length}');

    return categories;
  }*/

}