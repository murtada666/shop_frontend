import 'package:flutter/material.dart';
import 'package:stop_and_shop/Screens/CheckScreens/contents.dart';
import 'package:stop_and_shop/modules/module_location.dart';
import '../../shared/components/components.dart';
import 'single_locations.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/style/colors.dart';

class Locations extends StatelessWidget {
  Locations({Key? key}) : super(key: key);

  final TextEditingController nameLocation = TextEditingController();
  final TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
          title: const Text(
            "المواقع الخاصة بي ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "اختر احد مواقعك ",
                style: TextStyle(
                    color: greenColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Expanded(child: Obx(() {
                return ListView(
                  children: LocationModule.locations
                      .map((e) => BuildSingleLocations(
                            nameLocation: e.nameLocation.value,
                            location: e.location.value,
                          ))
                      .toList(),
                );
              })),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "__________________________ او  ________________________",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(130)),
                    child: TextButton(
                        onPressed: () {
                          final alertAddName = Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                title: const Text('اضافة موقع جديد'),
                                content: SizedBox(
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Divider(
                                        color: Colors.black,
                                        height: 5,
                                      ),
                                      ContainerDesgin(
                                        color: Colors.white,
                                        child: MyTextField(
                                            label: 'اسم الموقع',
                                            controller: nameLocation),
                                      ),
                                      ContainerDesgin(
                                        color: Colors.white,
                                        child: MyTextField(
                                            label: 'الموقع',
                                            controller: location),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          LocationModule.add(
                                              nameLocation.text, location.text);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              Text(
                                                'حفظ الموقع',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Icon(
                                                Icons.save,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                          showDialog(
                              context: context,
                              builder: (BuildContext ctx) {
                                return alertAddName;
                              });
                        },
                        child: const Text(
                          "اضف الموقع جديد",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
