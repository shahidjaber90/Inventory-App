import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/Utils/colorPalatte1.dart';
import 'package:inventory/Utils/colorPalatte2.dart';

class CategoryBox extends StatelessWidget {
  String itemText = '';
  int itemCount = 0;
  Color valueColor;
  CategoryBox(
      {super.key,
      required this.itemText,
      required this.itemCount,
      required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: ColorConstant.darkBlue,
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  spreadRadius: -1.0),
              BoxShadow(
                  color: ColorConstant.darkBlue,
                  offset: const Offset(-2.0, -2.0),
                  blurRadius: 8.0,
                  spreadRadius: -1.0),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                'PKR' + itemCount.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: valueColor,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              itemText.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
