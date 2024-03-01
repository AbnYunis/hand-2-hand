import 'package:flutter/material.dart';
import 'package:hand2hand/features/history/presentation/views/widgets/history_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          centerTitle: true,
        ),
        body: const HistoryBody(),
      ),
    );
  }
}
