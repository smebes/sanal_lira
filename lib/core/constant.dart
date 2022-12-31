import 'package:flutter/material.dart';

const String appName = "Squarix";
const kPrimaryColor = Color(0xFF9BB1F0);
const kSecondaryColor = Colors.white;
const kBackgroundColor = Color(0xFFF3F8FB);
const kTypicalTextColor = Color(0xFF0C1D42);
const kGrey = Color(0xFFD3D3D3);
Color kGreen = const Color(0x0066cc78).withOpacity(1.0);
const kTitleStyle = TextStyle(fontSize: 30, color: kPrimaryColor);
const khintStyle = TextStyle(color: kPrimaryColor);
const kWhiteStyle = TextStyle(fontSize: 12.0, color: Colors.white);

const kOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);
const kEnabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kSecondaryColor, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);
const kDisabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xfff9845f), width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const kFocusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const kErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kSecondaryColor, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

InputDecoration kTextFieldInputDecoration(String hintText) {
  return InputDecoration(
    errorStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
    errorBorder: kErrorBorder,
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.white38, fontSize: 10.0),
    border: kOutlineInputBorder,
    enabledBorder: kEnabledBorder,
    focusedBorder: kFocusedBorder,
    disabledBorder: kDisabledBorder,
  );
}

const kPaddingTextField = EdgeInsets.only(left: 15.0, right: 15.0);
const kPaddingTextField2 = EdgeInsets.only(left: 15.0, bottom: 5.0, top: 8.0);
// const kPaddingAll = EdgeInsets.all(4.0);

// const borderRadius10 = BorderRadius.all(Radius.circular(10));
const borderRadius40 = BorderRadius.all(Radius.circular(40));

TextStyle loginTextStyle = TextStyle(fontSize: 10, color: const Color(0x00cfd4de).withOpacity(1.0));
