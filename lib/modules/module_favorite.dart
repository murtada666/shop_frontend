import 'package:get/get.dart';

import 'module_category.dart';
import 'module_product.dart';

class FavoriteModule {
  final RxString nameProduct;
  final RxString imageProduct;
  final RxInt priceProduct;
  final Rx<Category> categoryProduct;
  final Product product;

  FavoriteModule({
    required String nameProduct,
    required String imageProduct,
    required Category categoryProduct,
    required int priceProduct,
  })  : nameProduct = nameProduct.obs,
        imageProduct = imageProduct.obs,
        priceProduct = priceProduct.obs,
        categoryProduct = categoryProduct.obs,
        product =
            Product.products.firstWhere((e) => e.name.value == nameProduct);

  static add(String nameProduct, String imageProduct, Category categoryProduct,
      int priceProduct) {
    FavoriteModule favorite = FavoriteModule(
      nameProduct: nameProduct,
      imageProduct: imageProduct,
      categoryProduct: categoryProduct,
      priceProduct: priceProduct,
    );
    favorites.add(favorite);
  }

  static RxList<FavoriteModule> favorites = <FavoriteModule>[].obs;
}
