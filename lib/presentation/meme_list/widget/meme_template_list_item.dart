import 'package:flutter/material.dart';

class MemeTemplateListItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const MemeTemplateListItem({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: 'meme_image_$name',
          child: Image.network(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,),
        ),
        const SizedBox(width: 20),
        Expanded(child: Text(name, overflow: TextOverflow.visible)),
      ],
    );
  }
}
