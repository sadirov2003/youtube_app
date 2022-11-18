import 'package:flutter/material.dart';

class SearchContainer extends StatefulWidget {
  final searchController;
  SearchContainer({
    required this.searchController,
  });
  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Container(
        child: TextField(
          controller: widget.searchController,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            hintText: 'Поиск',
            hintStyle: TextStyle(color: Colors.black38),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black12,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black12,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
