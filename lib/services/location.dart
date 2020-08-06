import 'package:geolocator/geolocator.dart';

class Location{
  double latitude;
  double longitude;

  Future<void> getGeoLocation() async{
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.latitude = position.latitude;
      this.longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }

}