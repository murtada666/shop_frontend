import 'package:get/get.dart';

class LocationModule {
  
  final RxString nameLocation;
  final RxDouble x;
  final RxDouble y;
  final RxString namecity;
  final RxString nametown;
  final RxString namepoint;
  final RxString location;
  bool valid = false;

  LocationModule({
    required String nameLocation,
    required String namecity,
    required String nametown,
    required String namepoint,
    required String location,
    required bool valid,
    required double x,
    required double y,
  })  : nameLocation = nameLocation.obs,
        namecity = namecity.obs,
        nametown = nametown.obs,
        namepoint = namepoint.obs,
        location = location.obs,
        valid = valid ,
        x = x.obs,
        y = y.obs; 

  static add(
      String nameLocation, String namecity, String nametown,String namepoint , String location , bool valid , double x, double y) {
    LocationModule location1 = LocationModule(
        nameLocation: nameLocation,
        namecity: namecity,
        nametown: nametown,
        namepoint: namepoint,
        location: location,
        valid:valid,
        x: x,
        y: y,);
    locations.add(location1);
  }

  static RxList<LocationModule> locations = <LocationModule>[].obs;
}
