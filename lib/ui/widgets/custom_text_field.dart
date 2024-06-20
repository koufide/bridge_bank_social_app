import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  final TextEditingController textController;
  final FocusNode? focusNode;
  final TextInputType inputType;
  final String placeholder;
  final IconData? prefixIcon;
  const DefaultTextField({super.key,
    required this.textController,
    required this.placeholder,
    this.prefixIcon,
    this.inputType = TextInputType.text,
    this.focusNode});

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {

   FocusNode _focusNode = FocusNode();

   @override
  void initState() {
    //If widget.focusNode is not null then return his value
     if(widget.focusNode != null){
       _focusNode = widget.focusNode!;
     }
    super.initState();

     _focusNode.addListener((){
       setState(() {

       });
     });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
      padding: const EdgeInsets.only(left: Constants.defaultPadding),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: _focusNode.hasFocus?AppColors.secondary:Colors.black26
          ),
          borderRadius: BorderRadius.circular(8)
      ),
      child: TextField(
        controller: widget.textController,
        keyboardType: widget.inputType,
        focusNode: _focusNode,
        decoration: InputDecoration(
            icon: Icon(widget.prefixIcon??Icons.email, color: _focusNode.hasFocus?AppColors.primary
                :AppColors.secondary,),
            hintText: widget.placeholder,
            border: InputBorder.none,
        ),
      ),
    );
  }
}
