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
          'assets/images/banana_item.png',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'بتيتة',
      imageProduct:
          'assets/images/Patato_item.png',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'خضروات',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'تفاح',
      imageProduct:
          'assets/images/Apple_item.jpg',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'فراولة',
      imageProduct:
          'assets/images/strawberry_item.jfif',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'باذينجان',
      imageProduct:
          'assets/images/eggplant_item.png',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'خضروات',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'عنب',
      imageProduct:
          'assets/images/grape_item.jfif',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'رمان',
      imageProduct:
          'assets/images/Pomegranate _item.jfif',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'طماطم',
      imageProduct:
          'assets/images/tomato_item.jfif',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'خضروات',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'بطيخ',
      imageProduct:
          'assets/images/watermelon_item.jfif',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'خوخ',
      imageProduct:
          'assets/images/Peach_item.jfif',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
    Product(
      nameProduct: 'برتقال',
      imageProduct:
          'assets/images/Orange_item.jfif ',
      descriptionProduct: 'descriptionProduct',
      categoryProduct: 'فواكه',
      priceProduct: '2000',
    ),
  ].obs;
}
