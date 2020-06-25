class ProductoCart{
  String id;
  String nombre;
  String image;
  String price;
  ProductoCart(this.id, this.nombre, this.image, this.price);
  //hola
  productoMap(){
    var mapping=Map<String, dynamic>();
    print('------------------------------------------el pinche productoMap--------------------------------------');
    mapping['id']=id;
    mapping['NAME']=nombre;
    mapping['IMAGE']=image;
    mapping['PRICE']=price;

    return mapping;
  }
}

/* no se este pasando de verga que si le ando metiendo unos perros besos en el cicirisco al chile */