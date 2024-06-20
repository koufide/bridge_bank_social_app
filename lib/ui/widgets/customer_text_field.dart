import 'package:flutter/material.dart';

import '../../configuration/colors.dart';
import '../../configuration/constants.dart';
class DefaultTextField extends StatefulWidget {
  final TextEditingController textController;
  final FocusNode? focusNode;
  final TextInputType inputType;
  final String placeholder;
  final IconData? prefixIcon;
  final bool obscureText;

  const DefaultTextField({
    super.key,
    required this.textController,
    required this.placeholder,
    this.prefixIcon,
    this.inputType = TextInputType.text,
    this.focusNode,
    this.obscureText = false,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  FocusNode _focusNode= FocusNode();
  bool _obscureText = false;


  @override
  void initState() {
    if(widget.focusNode != null){
      _focusNode = widget.focusNode!;
    }
    print( "widget.obscureText ==> ${widget.obscureText}");
    _obscureText = widget.obscureText;
    super.initState();

    _focusNode.addListener((){
      if(mounted) {
        setState(() {
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: _focusNode.hasFocus?AppColors.secondary:Colors.black12,
          )
      ),

      child:  TextField(
        //obscureText: widget.obscureText,
        obscureText: _obscureText,
        controller: widget.textController,
        focusNode: _focusNode,
        // autofocus: true,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
            icon: Icon(widget.prefixIcon??Icons.email, color: _focusNode.hasFocus?AppColors.primary:Colors.black12, ),
            hintText: widget.placeholder,
            border: InputBorder.none,
          // suffix: widget.obscureText?GestureDetector(
          //   onTap: (){
          //     _obscureText = !_obscureText;
          //     setState(() {
          //     });
          //   },
          // ):null,
        ),
      ),

    );
  }
}
