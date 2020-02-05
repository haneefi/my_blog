import 'package:flutter/material.dart';
import 'package:myblog/services/api.dart';
import '../model/Product.dart';
class ProductProvider with ChangeNotifier {
  String message;
  bool loading = true;
  List<Product> products;

  getProductData() {
    setLoading(true);
    Api.getProducts(Api.productsUrl).then((products){
        setProucts(products);
                setLoading(false);
            }).catchError((e) {
                  throw (e);
                });
          
              }
            
              void setLoading(value) {
                 loading = value;
                 notifyListeners();
              }
        
          void setProucts(List<Product> products) {
            this.products=products;

          }
}