import 'package:charity_app/domain/model/meme_template.dart';
import 'package:charity_app/presentation/create_meme/widget/custom_button.dart';
import 'package:charity_app/presentation/create_meme/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreateMemeScreen extends StatefulWidget {
  final MemeTemplate memeTemplate;
  const CreateMemeScreen({super.key, required this.memeTemplate});

  @override
  State<CreateMemeScreen> createState() => _CreateMemeScreenState();
}

class _CreateMemeScreenState extends State<CreateMemeScreen> {

  late final List<TextEditingController> controllers;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
        widget.memeTemplate.box_count,
            (index) => TextEditingController()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create new meme",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Hero(
                    tag: 'meme_image_${widget.memeTemplate.name}',
                    child: Image.network(widget.memeTemplate.url)
                ),
                const SizedBox(height: 20),
                ...List.generate(widget.memeTemplate.box_count, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CustomTextField(controller: controllers[index],
                    label: 'Text ${index + 1}'),
                  );
                }
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Create new meme',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      for (var controller in controllers) {
                        print(controller.text);
                      }
                    } else {
                      print("VALIDATION ERROR");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),),
    );
  }

  @override
  void dispose() {
    controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
}
