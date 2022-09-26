import 'package:get/get.dart';

import 'module_product.dart';

class CartModule {
  final RxString nameProduct;
  final RxString imageProduct;
  final RxString priceProduct;
  final RxDouble weightProduct;
  final Product product;

  CartModule({
    required String nameProduct,
    required String imageProduct,
    required double weightProduct,
    required String priceProduct,
  })  : nameProduct = nameProduct.obs,
        imageProduct = imageProduct.obs,
        priceProduct = priceProduct.obs,
        weightProduct = weightProduct.obs,
        product =
            Product.products.firstWhere((e) => e.name.value == nameProduct);

  static add(String nameProduct, String imageProduct, double weightProduct,
      String priceProduct) {
    CartModule product = CartModule(
      nameProduct: nameProduct,
      imageProduct: imageProduct,
      weightProduct: weightProduct,
      priceProduct: priceProduct,
    );
    products.add(product);
  }

  static update(String nameProduct, String imageProduct, double weightProduct,
      String priceProduct) {
    CartModule product = CartModule(
      nameProduct: nameProduct,
      imageProduct: imageProduct,
      weightProduct: weightProduct,
      priceProduct: priceProduct,
    );
    products[products.indexWhere((e) => e.nameProduct.value == nameProduct)] =
        product;
  }

  static totalPrice() {
    double sum = 0.0;
    for (var e in products) {
      sum = sum + (int.parse(e.priceProduct.value) * e.weightProduct.value);
    }
    return sum;
  }

  static RxList<CartModule> products = <CartModule>[].obs;
}
