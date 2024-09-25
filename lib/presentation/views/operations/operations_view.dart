import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/views/operations/borrowing_view.dart';
import 'package:qarz_daftar/presentation/views/operations/lending_view.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class OperationsView extends StatefulWidget {
  const OperationsView({super.key});

  @override
  State<OperationsView> createState() => _OperationsViewState();
}

class _OperationsViewState extends State<OperationsView> {
  List<File> images = [];
  List<int> indexs = [];

  void imagesFile() async {
    try {
      final image = await ImagePicker().pickMultiImage();
      if (image.isNotEmpty) {
        for (var element in image) {
          images.add(File(element.path));
        }
      }
      setState(() {});
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Operation"),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        decoration: BoxDecoration(
          color: context.color.contColor,
          border: Border(top: BorderSide(color: context.color.borderColor)),
        ),
        child: Row(
          children: [
            Expanded(
              child: WButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BorrowingView(images: images),
                  ));
                },
                height: 48,
                borderRadius: 8,
                color: Colors.transparent,
                border: Border.all(color: red),
                textColor: red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.hand.svg(),
                    const SizedBox(width: 4),
                    const Text("Borrowing")
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: WButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LendingView(images: images),
                  ));
                },
                height: 48,
                borderRadius: 8,
                color: Colors.transparent,
                border: Border.all(color: mainBlue),
                textColor: mainBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.banknote.svg(),
                    const SizedBox(width: 4),
                    const Text("Lending")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.color.contColor,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                title: "Phone number",
                hintText: "+998",
                prefixIcon: AppIcons.phone.svg(),
                suffixIcon: AppIcons.contact.svg(),
                onsuffixIconPressed: () {
                  context.push(AppRouteName.contacts);
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "Loan amount",
                hintText: "0.00",
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("UZS"),
                    AppIcons.arrowDown.svg(),
                  ],
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "Deadline",
                hintText: "29.02.2024",
                prefixIcon: AppIcons.calendar.svg(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: "1 week / 1 month",
                suffixIcon: AppIcons.arrowDown.svg(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: mainBlue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Add to blacklist",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "The purpose of the loan",
                hintText: "Type description...",
                noHeight: true,
                maxLines: 6,
                minLines: 5,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              WButton(
                onTap: () {
                  imagesFile();
                },
                color: mainBlue.withOpacity(.2),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: mainBlue,
                ),
              ),
              if (images.isNotEmpty) ...[
                GridView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (indexs.isNotEmpty) {
                          if (indexs.contains(index)) {
                            indexs.remove(index);
                          } else {
                            indexs.add(index);
                          }
                          setState(() {});
                        }
                      },
                      onLongPress: () {
                        if (indexs.contains(index)) {
                          indexs.remove(index);
                        } else {
                          indexs.add(index);
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: FileImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: indexs.isEmpty
                            ? null
                            : Align(
                                alignment: Alignment.topRight,
                                child: indexs.contains(index)
                                    ? AppIcons.checkboxRadioActive
                                        .svg(height: 14)
                                    : AppIcons.checkboxRadio.svg(height: 14),
                              ),
                      ),
                    );
                  },
                ),
                if (indexs.isNotEmpty)
                  TextButton(
                    onPressed: () {
                      for (var element in indexs) {
                        images.removeAt(element);
                      }
                      indexs.clear();
                      setState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcons.trash.svg(color: red),
                        const Text(
                          "Delete photo",
                          style: TextStyle(color: red),
                        )
                      ],
                    ),
                  ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
