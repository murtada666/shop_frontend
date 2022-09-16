import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

import '../../shared/components/components.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({Key? key}) : super(key: key);

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  late Position cl;
  Future getPostion() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
          context: context,
          title: "services",
          body: const Text("services not Enable "))
        .show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {
        getLatAndlong();
      }
    }
  }

  Future<Position> getLatAndlong() async {
    return await Geolocator.getCurrentPosition().then(((value) => value));
  }

  @override
  void initState() {
    getPostion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 20,
            title: TitleName(title: 'الخريطة'),
            leading: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: SafeArea(
              child: Center(
                  child: Container(
            child: Column(
              children: [
                TextButton(
                    onPressed: () async {
                      cl = await getLatAndlong();
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                              cl.latitude, cl.longitude);
                      // لقياس المسافة بين منطقتين
                      // var distancebetween = await Geolcator.distancebetween(startLatitude , startlongitude , end latitude , end longitud );
                      // var distancekm = distancebeetween / 1000;
                      // print(distancekm);
                    },
                    child: Text("show lat and long "))
              ],
            ),
          ))),
        ));
  }
}
