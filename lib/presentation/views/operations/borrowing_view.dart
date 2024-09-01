import 'package:flutter/material.dart';

class BorrowingView extends StatefulWidget {
  const BorrowingView({super.key});

  @override
  State<BorrowingView> createState() => _BorrowingViewState();
}

class _BorrowingViewState extends State<BorrowingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Borrowing")),
    );
  }
}
