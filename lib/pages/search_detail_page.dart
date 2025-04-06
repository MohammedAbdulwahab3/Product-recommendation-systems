import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchDetailPage extends StatelessWidget {
  const SearchDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          title: Text(
            'Products ',
            style: GoogleFonts.majorMonoDisplay(
                fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
