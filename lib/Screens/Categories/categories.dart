import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/HomeScreen/build_containers.dart';
import 'package:stop_and_shop/Screens/HomeScreen/search.dart';
import 'package:stop_and_shop/modules/module_product.dart';

import '../../modules/module_category.dart';
import '../Details/details.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            category.nameCategory,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          titleSpacing: 10,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          // padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(category.desc),
              ),
              const SizedBox(
                height: 15,
              ),
              Search(),
              const SizedBox(
                height: 15,
              ),
              // ------------------------------- List the product ---------------------------------
              Expanded(
               
                child:  Container(
                  width: double.infinity,
                  child: Obx(() {
                  return (Product.products.where((e) =>e.categoryProduct.value ==category.nameCategory).isEmpty ==false)
                      ? GridView.count(
                        crossAxisCount: 2,
                          children: (Product.isSearch.value == false)
                              ? [
                                GridView.count(
                                    crossAxisCount: 2,
                                    children: Product.products
                                        .where((e) =>
                                            e.categoryProduct.value ==
                                            category.nameCategory)
                                        .map((e) => GestureDetector(
                                            onTap: () {
                                              Get.to(Details(
                                                product: e,
                                              ));
                                            },
                                            child: BuildItem(
                                              imageUrl: e.imageProduct.value,
                                              nameProduct: e.nameProduct.value,
                                              categoryProduct:
                                                  e.categoryProduct.value,
                                              price: e.priceProduct.value,
                                              product: e,
                                            )))
                                        .toList(),
                                  )
                                ]
                              : [GridView.count(
                                    crossAxisCount:2,
                                    children: Product.products
                                        .where((e) =>
                                            e.categoryProduct.value ==
                                                category.nameCategory &&
                                            e.nameProduct.value
                                                    .contains(Product.search) ==
                                                true)
                                        .map((e) => GestureDetector(
                                            onTap: () {
                                              Get.to(Details(
                                                product: e,
                                              ));
                                            },
                                            child: BuildItem(
                                              imageUrl: e.imageProduct.value,
                                              nameProduct: e.nameProduct.value,
                                              categoryProduct:
                                                  e.categoryProduct.value,
                                              price: e.priceProduct.value,
                                              product: e,
                                            )))
                                        .toList(),
                                  )
                                ],
                        )
                      
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.hourglass_empty,
                                color: Colors.grey,
                                size: 100,
                              ),
                              Text(
                                '???????????? ???????????? ???? ?????? ??????????',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 30),
                              )
                            ],
                          ),
                        );
                }),
              
                )
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
