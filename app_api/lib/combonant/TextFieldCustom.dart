import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      this.isPassword = false,
      this.controller,
      this.onChanged,
      this.obscureText = false,
      this.minLines = 1,
      this.maxLines = 1});

  final String hint;
  final String label;
  final IconData icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final int minLines;
  final int maxLines;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  var iconpasson = const Icon(Icons.visibility);

  var iconpassof = const Icon(Icons.visibility_off);

  var sper;

  var eyeicon;

  int eyepass = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.isPassword == null) {
    } else if (widget.isPassword == true) {
      eyeicon = InkWell(
        child: iconpasson,
        onTap: () {
          sper = iconpasson;
          iconpasson = iconpassof;
          iconpassof = sper;
          eyepass++;

          setState(() {});
        },
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        enabled: true,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: eyepass % 2 == 0 && widget.isPassword == true,
        obscuringCharacter: "*",
        cursorColor: Colors.black,
        cursorWidth: 2,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hint,
            labelText: widget.label,
            prefixIcon: Icon(
              widget.icon,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            suffixIcon: eyeicon,
            suffixIconColor: Colors.grey,
            labelStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            border: const OutlineInputBorder(),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyanAccent))),
      ),
    );
  }
}
