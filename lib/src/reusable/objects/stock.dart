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

      int id = data['id'];
      String name = data['name'];
      String description = data['description'];
      String features = data['features'];
      String cover = data['cover'];

      dynamic brand = data['brand'];
      dynamic category = data['categories'];
      dynamic presentations = data['presentations'];

      Product product = Product(id: id, name: name, cover: cover, description: description, features: features, brand: brand, category: category, presentations: presentations);
      
      return product;

    }
    else {
      print(response.reasonPhrase);
      throw Exception('Someting went wrong');
    }

  }


  Future<String> getCategories() async{
    List<Product> products = [];

    for(int i = 1; i < 31; i++){
      if(i != 25){
        Product product = await getSpecificProduct(i);
        products.add(product);
    
      }
    }

    for(int i = 0; i < products.length; i++){
      
    }



    return '${products.length} ';
    

    

  }

  test(){
    getCategories();
  }
  
  

  

}