import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locatzio/app/screens/home/home_controllers/add_location.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final LocationActions locationActions = Get.put(LocationActions());

  @override
  void initState() {
    locationActions.getGeoPoint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
        // actions: [IconButton.filled(onPressed: () {}, icon: const Icon(Icons.more_vert))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Obx(() => TextFormField(
                          enableSuggestions: true,
                          keyboardType: TextInputType.number,
                          enabled: false,
                          autocorrect: true,
                          controller: locationActions.locationEditingController.value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            hintText: locationActions.locale.value.lat.toString(),
                            // labelText: "Cordinates",
                          ),
                        )),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
