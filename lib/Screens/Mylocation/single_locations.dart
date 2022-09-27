import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/CheckOutScreen/check_out.dart';
import 'package:stop_and_shop/modules/module_location.dart';
import 'package:stop_and_shop/style/colors.dart';
import 'package:stop_and_shop/modules/module_location.dart';

class BuildSingleLocations extends StatelessWidget {
  const BuildSingleLocations(
      {Key? key,
      required this.nameLocation,
      required this.namecity,
      required this.nametown,
      required this.namepoint,
      required this.location,
      })
      : super(key: key);

  final String nameLocation;
  final String namecity;
  final String nametown;
  final String namepoint;
  final String location;
  // final bool valid; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: greenColor, width: 1, style: BorderStyle.solid)),
        child: ListTile(
          title: Text(
            nameLocation,
            style: TextStyle(
                color: greenColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            location,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: FloatingActionButton(
            onPressed: () {
              LocationModule.locations
                  .removeWhere((e) => e.nameLocation.value == nameLocation);
            },
            mini: true,
            backgroundColor: Colors.red,
            child: const Icon(
              Icons.remove,
            ),
          ),
        ),
      ),
    );
  }
}
