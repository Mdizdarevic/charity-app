import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationDetailsScreen extends StatelessWidget {
  const LocationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Upper Town',
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                Text('10 000 Zagreb',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                SizedBox(height: 10),
                Text('Rating: 3/5'),
                SizedBox(height: 20),
                Text(''
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed sem et est ullamcorper posuere eget ut sapien. '
                    'Donec ultricies suscipit consectetur. Nam at ex auctor, sagittis felis id, lobortis massa. Integer malesuada varius turpis eget '
                    'cursus. Vivamus tellus neque, scelerisque a aliquam sed, dignissim eget dui. Vivamus viverra nisl.',
                  textAlign: TextAlign.justify,
                ),
                Spacer(),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () => openInMaps(45.815996, 15.973510, 'Upper Town'),
                      child: Text("Show on Maps")),
                )

              ],
            ),
          ),
        )
    );
  }

  void openInMaps(double latitude, double longitude, String label) async {
    try {
      Uri url;
      if (Platform.isIOS) {
        url = Uri.parse('geo:$latitude,$longitude?q=$latitude,$longitude');
      } else {
        url = Uri.parse('geo:$latitude,$longitude?q=$latitude,$longitude($label)');
      }
      await launchUrl(url);
    } catch (e) {
      print("Error happened: $e");
    }
  }

}

