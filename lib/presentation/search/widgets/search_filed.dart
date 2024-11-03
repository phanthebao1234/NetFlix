import 'package:flutter/material.dart';

class SearchFiledWidget extends StatelessWidget {
  const SearchFiledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: 'Search ...'),
    );
  }
}
