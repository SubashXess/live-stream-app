// ignore_for_file: avoid_print

import 'dart:io';
import 'package:live_stream_app/pages/homepage.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;

  late FocusNode _titleNode;
  late FocusNode _descNode;

  File? image;
  String? loadImage;
  bool autovalidateMode = false;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController()..addListener(onListen);
    _descController = TextEditingController()..addListener(onListen);
    _titleNode = FocusNode();
    _descNode = FocusNode();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _titleController.removeListener(onListen);
    _descController.dispose();
    _descController.removeListener(onListen);
    _titleNode.dispose();
    _descNode.dispose();
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.grey.shade50,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              titleSpacing: 16.0,
              leadingWidth: 0.0,
              floating: true,
              centerTitle: true,
              title: const Text(
                'Edit Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormWidget(
                        hint: 'Add a title that describes your stream',
                        controller: _titleController,
                        node: _titleNode,
                        autovalidateMode: autovalidateMode
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        maxLength: _titleController.text.isEmpty
                            ? null
                            : _titleNode.hasFocus
                                ? 100
                                : null,
                        maxLines: 1,
                        fillColor: _titleNode.hasFocus
                            ? Colors.grey.shade300
                            : Colors.grey.shade200,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Your video needs a title';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextFormWidget(
                        hint: 'Tell viewers more about your stream',
                        controller: _descController,
                        node: _descNode,
                        autovalidateMode: autovalidateMode
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        maxLength: _descController.text.isEmpty
                            ? null
                            : _descNode.hasFocus
                                ? 1000
                                : null,
                        maxLines: 5,
                        fillColor: _descNode.hasFocus
                            ? Colors.grey.shade300
                            : Colors.grey.shade200,
                        validator: null,
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Thumbnail',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "Upload a picture that represents your stream",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        width: size.width,
                        height: size.height / 5.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                            )
                          ],
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            image != null
                                ? Image.file(
                                    image!,
                                    fit: BoxFit.fill,
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_photo_alternate_rounded,
                                        size: 56.0,
                                        color: Colors.grey.shade500,
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        'Upload thumbnail',
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                            Positioned(
                              right: 16.0,
                              top: 16.0,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isDismissible: true,
                                      enableDrag: true,
                                      context: context,
                                      builder: (context) {
                                        return bottomSheet(context, size);
                                      });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white60,
                                  ),
                                  child: const Icon(
                                    Icons.image_rounded,
                                    size: 18.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: 0.36,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16.0),
                            const Text(
                              'Schedule',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "Select the date and time you want to go live",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Jan 1, 2023',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Icon(
                                          Icons.calendar_month,
                                          size: 18.0,
                                          color: Colors.grey.shade500,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          '4:30 PM',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Icon(
                                          Icons.access_time_filled_rounded,
                                          size: 18.0,
                                          color: Colors.grey.shade500,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              autovalidateMode = false;
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const HomePage()));
                          } else {
                            setState(() {
                              autovalidateMode = true;
                            });
                            print('Please fill all the required fileds');
                          }
                        },
                        child: Container(
                          width: size.width,
                          height: 46.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.deepPurple,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                              )
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(context, Size size) {
    return Container(
      width: size.width,
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Choose profile photo',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(height: 32.0),
          InkWell(
            onTap: () => pickImage(ImageSource.camera, context),
            child: Row(
              children: [
                CircleAvatar(
                  radius: size.height * 0.024,
                  backgroundColor: Colors.deepPurple,
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Camera',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () => pickImage(ImageSource.gallery, context),
            child: Row(
              children: [
                CircleAvatar(
                  radius: size.height * 0.024,
                  backgroundColor: Colors.deepPurple,
                  child: const Icon(
                    Icons.image_rounded,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future pickImage(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      // temporary image
      // final imageTemporary = File(image.path);

      // permanent image
      final imagePermanent = await saveImagePermanently(image.path);

      setState(() {
        // this.image = imageTemporary;
        this.image = imagePermanent;
        loadImage = imagePermanent.toString();

        print("Load Image : $loadImage");
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = path.basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    required this.hint,
    required this.controller,
    required this.node,
    this.maxLength,
    required this.maxLines,
    this.validator,
    required this.fillColor,
    required this.autovalidateMode,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final FocusNode node;
  final int? maxLength;
  final int maxLines;
  final String? Function(String?)? validator;
  final Color fillColor;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: node,
      maxLength: maxLength,
      maxLines: maxLines,
      validator: validator,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 15.0,
        ),
        filled: true,
        fillColor: fillColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red.shade600),
        ),
      ),
    );
  }
}
