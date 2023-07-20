import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locatzio/app/screens/home/home_controllers/add_location.dart';

import 'second_page.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final LocationActions locationActions = Get.put(LocationActions());
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
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(.09),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomMaterialButton(
                        textData: "Add Location",
                        color: Colors.blue,
                        onTap: () {
                          locationActions.getGeoPoint();
                        },
                      ),
                      const SizedBox(width: 2),
                      CustomMaterialButton(
                        textData: "Remove Location",
                        color: Colors.red,
                        onTap: () {
                          locationActions.removeLocation();
                        },
                      ),
                      const SizedBox(width: 2),
                      CustomMaterialButton(
                        textData: "Access OnInit",
                        color: Colors.black,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: ((_) => const Home2())));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    this.color,
    this.onTap,
    required this.textData,
  });
  final Color? color;
  final VoidCallback? onTap;
  final String textData;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color!.withOpacity(.17),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: SizedBox(
          height: 160,
          width: 85,
          child: Center(
            child: Text(
              textData,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
