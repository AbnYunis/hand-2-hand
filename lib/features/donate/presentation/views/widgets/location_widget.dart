import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/constants.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/donate/presentation/manegers/make_donation_cubit.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBoxApp(h: .01),
        Row(
          children: [
            Expanded(
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'location',
                  contentPadding: EdgeInsets.symmetric(horizontal: w * .03),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(w * .02),

                  ),
                ),
                controller: BlocProvider.of<MakeDonationCubit>(context).desController,
              ),
            ),
            BlocBuilder<MakeDonationCubit, MakeDonationState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () async {
                    BlocProvider.of<MakeDonationCubit>(context).changeController();
                  },
                  icon: state is AddLocationLoading
                      ? const CircularProgressIndicator()
                      : Icon(
                          Icons.location_on,
                          color: mainColor1,
                          size: MediaQuery.sizeOf(context).width * 0.1,
                        ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
