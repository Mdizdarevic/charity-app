import 'package:flutter/material.dart';

class MemeTemplateListItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const MemeTemplateListItem({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: MediaQuery.of(context).size.width - 40,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Hero(
                tag: 'meme_image_$name',
                child: Image.network(
                  imageUrl,
                  width: double.maxFinite,
                  height: double.maxFinite,
                  fit: BoxFit.cover,
                ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black87],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                )
              ),
              height: 200,
            )
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
