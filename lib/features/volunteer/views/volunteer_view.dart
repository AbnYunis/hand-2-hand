import 'package:flutter/material.dart';
import 'package:hand2hand/features/volunteer/views/widgets/volunteer_body.dart';

class VolunteerView extends StatelessWidget {
  const VolunteerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Volunteer'),
        ),
        body: const VolunteerBody(),
      ),
    );
  }
}
