import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/app_router.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/functions/load_image.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/core/widgets/custom_rounded_button.dart';
import 'package:hand2hand/core/widgets/custom_snack_bar.dart';
import 'package:hand2hand/features/donate/presentation/manegers/make_donation_cubit.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/charity_widget.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/description_widget.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/dropdown_widget.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/item_count_widget.dart';
import 'package:hand2hand/features/donate/presentation/views/widgets/location_widget.dart';
import 'package:image_picker/image_picker.dart';

class DonateBody extends StatelessWidget {
  final String charityName;
  final String id;

  const DonateBody({super.key, required this.charityName, required this.id});

  @override
  Widget build(BuildContext context) {
    File? imageFile;
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CharityWidget(
              name: charityName,
            ),
            const SizedBoxApp(h: .01),
            const ItemCountWidget(),
            const SizedBoxApp(h: .01),
            const DescriptionWidget(),
            const SizedBoxApp(h: .01),
            const Text(
              'Donation type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBoxApp(h: .01),
            const DropDownWidget(),
            const SizedBoxApp(h: .01),
            const LocationWidget(),
            const SizedBoxApp(h: .01),
            BlocConsumer<MakeDonationCubit, MakeDonationState>(
              listener: (context, state) {
                if (state is MakeDonationFailure) {
                  snackBar(state.message, context, Colors.red);
                } else if (state is MakeDonationSuccess) {
                  BlocProvider.of<MakeDonationCubit>(context)
                      .changeIsImage(false);
                  snackBar(state.message, context, mainColor1);
                  GoRouter.of(context).push(AppRouter.congratulation);
                }
              },
              builder: (context, state) {
                String locationController =
                    BlocProvider.of<MakeDonationCubit>(context)
                        .desController
                        .text;
                bool isImage =
                    BlocProvider.of<MakeDonationCubit>(context).isImage;

                return Column(
                  children: [
                    isImage == false
                        ? Container(
                            height: h * .25,
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side:
                                    const BorderSide(color: Color(0xff9A9A9A)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Image.asset(
                                    AssetsService.camera,
                                    height: h * .2,
                                  ),
                                  onTap: () async {
                                    final nav = Navigator.of(context);
                                    await showDialog(
                                        context: context,
                                        builder: (context1) {
                                          return AlertDialog(
                                            title: const Text(
                                                "Choose image from:"),
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ListTile(
                                                  title: const Text("Camera"),
                                                  onTap: () {
                                                    pickImage(
                                                            ImageSource.camera,
                                                            imageFile)
                                                        .then((value) {
                                                      imageFile = value;
                                                      BlocProvider.of<
                                                                  MakeDonationCubit>(
                                                              context)
                                                          .changeIsImage(true);
                                                      nav.pop();
                                                    });
                                                  },
                                                  trailing: Icon(
                                                    Icons.camera_alt_outlined,
                                                    color: mainColor1,
                                                  ),
                                                ),
                                                ListTile(
                                                  title: const Text("Gallery"),
                                                  onTap: () {
                                                    pickImage(
                                                            ImageSource.gallery,
                                                            imageFile)
                                                        .then((value) {
                                                      imageFile = value;
                                                      BlocProvider.of<
                                                                  MakeDonationCubit>(
                                                              context)
                                                          .changeIsImage(true);

                                                      nav.pop();
                                                    });
                                                  },
                                                  trailing: Icon(
                                                    Icons.image,
                                                    color: mainColor1,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                ),
                                const SizedBoxApp(
                                  h: .015,
                                ),
                                const Text(
                                  'Take a photo',
                                  style: TextStyle(color: Color(0xff9A9A9A)),
                                ),
                              ],
                            ),
                          )
                        : Image.file(imageFile!),
                    const SizedBoxApp(h: .01),
                    state is MakeDonationLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: CustomRoundedButton(
                            text: 'Donate',
                            onPressed: () {
                              if (descController.text.isEmpty ||
                                  locationController.isEmpty ||
                                  countController.text.isEmpty ||
                                  imageFile == null) {
                                snackBar('Please enter all date!', context,
                                    mainColor2);
                              } else {
                                BlocProvider.of<MakeDonationCubit>(context)
                                    .makeDonation({
                                  'image': imageFile!.path,
                                  'desc': descController.text,
                                  'location': locationController,
                                  'id': id,
                                  'amount': countController.text,
                                  'donationType': selectedItem,
                                });
                              }
                            },
                          )),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
