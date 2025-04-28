import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: search,
      decoration: InputDecoration(
        hintText: "Enter your location",
        prefixIcon: Icon(Icons.location_on_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
