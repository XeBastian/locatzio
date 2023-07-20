import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../home_models/lat_lng.dart';

class LocationActions extends GetxController {
  var locationEditingController = TextEditingController().obs;
  // PermissionHandler? permission;
  @override
  void onClose() {
    removeLocation();
    super.onClose();
  }

  Location location = Location();
  final locale = LatLng(lat: 0, lng: 0).obs;
  bool isLoading = false;
  getGeoPoint() {
    location.getLocation().then((locationData) {
      isLoading = !isLoading;
      locale.value = LatLng(lat: locationData.latitude!, lng: locationData.longitude!);
      locationEditingController.value.text = "${locale.value.lat}, ${locale.value.lng}";
    });
    // startCountdown();
  }

  startCountdown() {
    Stream<LocationData> changedLocation = location.onLocationChanged;
    changedLocation.listen((value) {
      locale.value = LatLng(lat: value.latitude!, lng: value.longitude!);
    });
  }

  removeLocation() {
    locale.value = LatLng(lat: 0, lng: 0);
    locationEditingController.value.text = "${locale.value.lat}, ${locale.value.lng}";
  }

  // askLocation() {
  //   PermissionHandler.askLocationPermission();
  // }
}
