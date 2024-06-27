

import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class Dialogs{


  static showConfirmDialog({
    required BuildContext context,
    required String message,
    String? cancelTitle,
    String? confirmTitle,
    required Function() onCancel,
    required Function() onConfirm
  } ){
    return  showDialog(
        context: context, builder: (ctxt){
      return Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(10),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 2.h,),
                  Text(message, style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      CustomButton(
                          color:AppColors.primary,
                          width: 190,
                          title: cancelTitle??"Annuler",
                          onTap: (){
                            onCancel();
                            Navigator.pop(ctxt);
                          }),
                      CustomButton(
                          width: 200,
                          title: confirmTitle??"Confirmer",
                          onTap: (){

                            onConfirm();
                            Navigator.pop(ctxt);
                          }),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

}