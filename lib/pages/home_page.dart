// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_flutter/util/smart_device_box.dart';
import 'package:flutter/src/services/asset_manifest.dart'; // or


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

    // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];


    // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: <Widget>[
            // custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  
                  ),
                  
                  // account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // welcome home MITCH KOKO
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal:40.0,
                vertical: 25,
                ),
              child: Column(children: [
                Text("Welcome Home,"),
                 Text(
                  "Al Habsi",
                  style: TextStyle(fontSize: 40),
                  ),
              ],),
            ),

            const SizedBox(height: 28),

            // smart device + grid
              Padding(
                padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 25),
                child: Text("Smart Devices")
              ),

              Expanded(
                child: GridView.builder(
                  itemCount: mySmartDevices.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                  ), 
                  itemBuilder: (context, index){
                    return SmartDeviceBox(
                       smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                    );   
                  },
                  ),
                ),
                
          ],
          ),
      ),
    );
  }
}
