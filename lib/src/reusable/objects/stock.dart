/*import 'package:aco/src/reusable/objects/product.dart';
import 'package:aco/src/reusable/objects/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, utf8;

class Stock {
  late User user;

  Stock(this.user);

  Future<Product> getSpecificProduct(int index) async {
    String token = 'Bearer ' + user.getToken();

    var headers = {
      'Authorization': token,
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://crud.jonathansoto.mx/api/products/' + index.toString()));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> answer =
          json.decode(await response.stream.bytesToString());
      Map<String, dynamic> data = answer['data'];

      int id;
      String name;
      String description;
      String features;
      String cover;

      dynamic brand;
      dynamic category;
      dynamic presentations;

      if (data['id'] != null) {
        id = data['id'];
      } else {
        id = 0;
      }

      if (data['name'] != null) {
        name = data['name'];
      } else {
        name = 'No-name';
      }

      if (data['description'] != null) {
        description = data['description'];
      } else {
        description = 'No description';
      }

      if (data['features'] != null) {
        features = data['features'];
      } else {
        features = 'No features';
      }

      if (data['cover'] != null) {
        cover = data['cover'];
      } else {
        cover =
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMdp9MQCrqZ8PZAdc-3I7XjAjFdDzFJgd0q1eg1Ac7VosB-GCr_prmyEJrveiAE-pu34E&usqp=CAU';
      }

      if (data['brand'] != null) {
        brand = data['brand'];
      } else {
        brand = {
          'id': 0,
          'name': 'Unknown brand',
          'description': 'No description'
        };
      }

      if (data['categories'] != null) {
        category = data['categories'];
      } else {
        category = {
          'id': 0,
          'name': 'Unknown category',
          'description': 'No description'
        };
      }

      if (data['presentations'] != null) {
        presentations = data['presentations'];
      } else {
        presentations = {'amount': 0.0};
      }

      Product product = Product(
          id: id,
          name: name,
          cover: cover,
          description: description,
          features: features,
          brand: brand,
          category: category,
          presentations: presentations);

      return product;
    } else {
      print(response.reasonPhrase);
      return Product(
          id: 0,
          name: 'No name',
          cover:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMdp9MQCrqZ8PZAdc-3I7XjAjFdDzFJgd0q1eg1Ac7VosB-GCr_prmyEJrveiAE-pu34E&usqp=CAU',
          description: 'No description',
          features: 'No features',
          brand: {
            'id': 0,
            'name': 'Unknown brand',
            'description': 'No description'
          },
          category: {
            'id': 0,
            'name': 'Unknown category',
            'description': 'No description'
          },
          presentations: {});
    }
  }

  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];

    for (int i = 1; i < 31; i++) {
      Product product = await getSpecificProduct(i);
      products.add(product);
    }

    return products;
  }

  Future<List<dynamic>> getCategories() async {
    List<Product> products = await getAllProducts();
    List<dynamic> categories = [];
    bool repeated = false;

    for (int i = 0; i < products.length; i++) {
      repeated = false;

      if (i > 0) {
        for (int j = 0; j < categories.length; j++) {
          if (products[i].getCategory()[0]['id'] == categories[j]['id']) {
            repeated = true;
          }

          if (!repeated) {
            categories.add(products[i].getCategory()[0]);
          }
        }
      } else {
        categories.add(products[i].getCategory()[0]);
        print('Added: ${products[i].getCategory()[0]['name']}');
      }
    }

    return categories;
  }

  Future<List<dynamic>> getCats() async {
    List<Product> products = await getAllProducts();
    List<dynamic> categories = [];
    dynamic aux;

    for (int i = 0; i < products.length; i++) {
      categories.add(products[i].getCategory()[0]);
    }

    for (int i = 0; i <= categories.length - 2; i++) {
      for (int j = 0; j <= categories.length - i - 2; j++) {
        if (categories[j]['id'] > categories[j + 1]['id']) {
          aux = categories[j];
          categories[j] = categories[j + 1];
          categories[j + 1] = aux;
        }
      }
    }

    print('<<<<<<<<<<CON REPETIDOS>>>>>>>>>>');

    for (int i = 0; i < categories.length; i++) {
      print('${(i + 1)} -> ${categories[i]['id']}');
    }

    print('Con repetidos ${categories.length}');

    for (int i = 1; i < categories.length; i++) {
      if (categories[i]['id'] == categories[i - 1]['id']) {
        categories.removeAt(i - 1);
        i--;
      }
    }

    print('<<<<<<<<<<SIN REPETIDOS>>>>>>>>>>');

    for (int i = 0; i < categories.length; i++) {
      print('${(i + 1)} -> ${categories[i]['id']}');
    }

    print('Sin repetidos ${categories.length}');

    return categories;
  }

  /*Future<List<dynamic>> getCategories() async {
    List<Product> products = await getAllProducts();
    List<dynamic> categories = [];
    dynamic aux;

    for (int i = 0; i < products.length; i++) {
      categories.add(products[i].getCategory()[0]);
    }

    for (int i = 0; i < categories.length; i++) {
      int idA = categories[i]['id'];

      if (i < categories.length - 1) {
        for (int j = i + 1; j < categories.length; j++) {
          int idB = categories[j]['id'];

          if (idA == idB) {
            categories.removeAt(i);
          }
        }
      }
    }

    for (int i = 0; i < categories.length; i++) {
      int idA = categories[i]['id'];

      if (i < categories.length - 1) {
        for (int j = i + 1; j < categories.length; j++) {
          int idB = categories[j]['id'];

          if (idA == idB) {
            categories.removeAt(i);
          }
        }
      }
    }

    for (int i = 0; i < categories.length; i++) {
      print('${categories[i]['id']} : ${categories[i]['name']}');
      print('----------');
    }

    return categories;
  }*/
}*/
