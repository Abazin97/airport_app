import 'package:flutter/material.dart';

class SkypierFerry extends StatefulWidget {
  const SkypierFerry({super.key});

  @override
  State<SkypierFerry> createState() => _SkypierFerryState();
}

class _SkypierFerryState extends State<SkypierFerry> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: isSearching
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                
              )
            ],
          )
        ],
      ),
    );
  }
}