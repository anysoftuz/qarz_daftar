import 'package:flutter/material.dart';

class LendingView extends StatefulWidget {
  const LendingView({super.key});

  @override
  State<LendingView> createState() => _LendingViewState();
}

class _LendingViewState extends State<LendingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lending"),
      ),
    );
  }
}
