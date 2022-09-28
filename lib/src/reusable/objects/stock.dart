import 'package:aco/src/reusable/objects/product.dart';
import 'package:aco/src/reusable/objects/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, utf8;

class Stock {
  late User user;
  List<Product> products =[];

  Stock(this.user){
    fillStock();
  }
  

  Future<void> callSpecificProduct(int index) async{
    String token = 'Bearer ' + user.getToken();

    var headers = {
      'Authorization': token,
      'Cookie': 'XSRF-TOKEN=eyJpdiI6Ims5TUhOajB2VlV4Q000QXlXSTMyVFE9PSIsInZhbHVlIjoiV1pmZ2pyZmpzRXBSaUx0MHZJZWloY3VJTUNUK0djQmNOY1ZwbWptSHF4c291WFhkUGthREpSTEFoMXcxdzhNaEpidGdWUzVqeTJ4am5uT0l0c0lEc1FKOTdoc2VXSVU2N0ptUVBVQ3N0bHZ3N0hsaW1aWWh1ZGdhUkQ1V1hMeHoiLCJtYWMiOiIzNWEzZTE0MGZlZTQ1MTJlMTY4M2NhM2ZmZjg5MzZjMjFiYzA1YzcxYmIzYmMwYmMzMDBhNDE2ZmRhMDFkOTA2IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IndJNThxSUNLUkg1VmttRlh1bkRtY1E9PSIsInZhbHVlIjoiUU80QmkzYjN6M1NFdlYrdVE5a1VKOGhzY3ZENFk2K0dCaXpQdWJsWWoyeDBReTZuR3c3bUh0N2VuWGZrM1FhM2pEVDRoREdzeWczc0creHdJWlo4N3BzQnArNEZKTFY5VWNwVndVd0lnbFMzSGxTQll3VzYxbUN3RUkwMm4zRTEiLCJtYWMiOiI3MGU5MGQ2YzZkYTlkNjk5NzRkYzc2OGEyZmQ5ZWVjMzcyNDA4ZTlkZGVkNWFjNDM1MTg1ZGQ3NTFkYjdhOWQ0IiwidGFnIjoiIn0%3D'
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
      
      products.add(product);

    }
    else {
      print(response.reasonPhrase);
      throw Exception('Someting went wrong');
    }

  }
  
  void fillStock() {
    for(int i = 1; i < 4; i ++){
      callSpecificProduct(i);
    }

    print("CANTIDAD ${products.length}");
    for(int i = 0; i < products.length; i++){
      print(products[i].getName());
    }
  }

  Product getProduct(int index){
    return products[index];
  }
  
  

}