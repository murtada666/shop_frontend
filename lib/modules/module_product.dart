import 'package:get/get.dart';

class Product {
  final RxString nameProduct;
  final RxString imageProduct;
  final RxString descriptionProduct;
  final RxString categoryProduct;
  final RxString priceProduct;
  final RxDouble weightProduct = 0.5.obs;
  final RxBool isFavorite = false.obs;
  final RxBool isCart = false.obs;
  final RxBool isEdit = false.obs;
  static final RxBool isSearch = false.obs;

  Product({
    required String nameProduct,
    required String imageProduct,
    required String descriptionProduct,
    required String categoryProduct,
    required String priceProduct,
  })  : nameProduct = nameProduct.obs,
        imageProduct = imageProduct.obs,
        descriptionProduct = descriptionProduct.obs,
        categoryProduct = categoryProduct.obs,
        priceProduct = priceProduct.obs;

  isFavoriteChanged() {
    isFavorite.value = true;
  }

  static isSearchChanged() {
    isSearch.value = true;
  }

  isCartChanged() {
    isCart.value = true;
  }

  isEditItemCart() {
    isEdit.value = true;
  }

  static RxString search = ''.obs;

  static RxList<Product> products = <Product>[
    Product(
      nameProduct: 'موز',
      imageProduct:
          'https://w7.pngwing.com/pngs/332/204/png-transparent-banana-banana-natural-foods-food-fitness-thumbnail.png',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'برتقال',
      imageProduct:
          'https://w7.pngwing.com/pngs/332/204/png-transparent-banana-banana-natural-foods-food-fitness-thumbnail.png',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'موز',
      imageProduct:
          'https://w7.pngwing.com/pngs/332/204/png-transparent-banana-banana-natural-foods-food-fitness-thumbnail.png',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'موز',
      imageProduct:
          'https://w7.pngwing.com/pngs/332/204/png-transparent-banana-banana-natural-foods-food-fitness-thumbnail.png',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'موز',
      imageProduct:
          'https://w7.pngwing.com/pngs/332/204/png-transparent-banana-banana-natural-foods-food-fitness-thumbnail.png',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
  ].obs;
}
