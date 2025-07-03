import 'dart:convert';
import 'package:first_class/module_14/utils/urls.dart';
import 'models/productModel.dart';
import 'package:http/http.dart' as http;

class ProductController{
  List<Data> products = [];

  Future<void> getProducts() async{
    final response = await http.get(Uri.parse(Urls.readProduct));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      productModel model = productModel.fromJson(data);
      products = model.data ?? []; // Handle null case
    }
  }

  Future<bool> deleteProduct(productID) async{
    final response = await http.get(Uri.parse(Urls.deleteProduct(productID)));

    if(response.statusCode == 200){
      getProducts();
      return true; // Handle null case
    } else{
      return false; // Handle null case
    }
  }

  Future<bool> createAndUpdateProducts(String productName, String img, int qty, int unitPrice, int totalPrice, String ? productID, bool isUpdate) async{
    final response = await http.post(Uri.parse(isUpdate ? Urls.updateProduct(productID!) : Urls.createProduct),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          {
            "ProductName": productName,
            "ProductCode": DateTime.now().microsecondsSinceEpoch,
            "Img": img,
            "Qty": qty,
            "UnitPrice": unitPrice,
            "TotalPrice": totalPrice
          })
    );

    if(response.statusCode == 201){ // 201 means created successfully
      getProducts();
      return true;
    } else{
      return false;
    }
  }
}