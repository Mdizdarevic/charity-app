import 'package:charity_app/domain/model/meme_template.dart';
import 'package:flutter/material.dart';

class CreateMemeScreen extends StatefulWidget {
  final MemeTemplate memeTemplate;
  const CreateMemeScreen({super.key, required this.memeTemplate});

  @override
  State<CreateMemeScreen> createState() => _CreateMemeScreenState();
}

class _CreateMemeScreenState extends State<CreateMemeScreen> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create new meme",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Hero(
                  tag: 'meme_image_${widget.memeTemplate.name}',
                  child: Image.network(widget.memeTemplate.url)
              ),
              const SizedBox(height: 20),
              TextField(
                controller: firstController,
                decoration: InputDecoration(
                  labelText: 'Text 1',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: secondController,
                decoration: InputDecoration(
                  labelText: 'Text 2',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                    ),
                    onPressed: () {},
                    child: Text('Create new meme')
                  ),
              )
            ],
          ),
        ),
      ),),
    );
  }
}
