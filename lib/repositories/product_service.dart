import 'package:project_ecommerce/repositories/productCart.dart';
import 'package:project_ecommerce/repositories/repository.dart';

class ProductService{
  Repository _repository;

  ProductService(){
    _repository=Repository();
  }

  saveProduct(ProductoCart productoCart) async {
    print('-----------------------------------------el pinche guardado--------------------------------------------');
    print(productoCart);
    return await _repository.insertData('PRODUCT', productoCart.productoMap());

  }

   readCategories() async {
    return await _repository.readData('PRODUCT');
  }

}