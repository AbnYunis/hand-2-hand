import 'package:flutter/material.dart';
import 'package:hand2hand/core/utils/functions/assets_service.dart';
import 'package:hand2hand/core/utils/media_query.dart';
import 'package:hand2hand/features/profile/presentation/views/widgets/custom_text_field.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SizeApp(context).width;
    final h = SizeApp(context).height;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(w * .05),
        child: Column(
          children: [
            const SizedBoxApp(
              h: .1,
            ),
            CircleAvatar(
              radius: w * .12,
              backgroundImage: const AssetImage(AssetsService.onBoard1),
            ),
            const SizedBoxApp(
              h: .05,
            ),
            const CustomTextField(hint: 'name', icon: Icons.person),
            const SizedBoxApp(
              h: .035,
            ),
            const CustomTextField(hint: 'password', icon: Icons.lock),
            const SizedBoxApp(
              h: .035,
            ),
            const CustomTextField(hint: 'email', icon: Icons.email_outlined),
            const SizedBoxApp(
              h: .035,
            ),
            const CustomTextField(hint: 'phone', icon: Icons.phone),
          ],
        ),
      ),
    );
  }
}
