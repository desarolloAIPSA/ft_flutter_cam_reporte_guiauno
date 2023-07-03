import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/app_theme.dart';

class InputButtonW extends StatelessWidget {
  final Function(String)? onChanged;
  final void Function()? onTap;
  final bool? obscureText;
  final String? initialValue;
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? hintMaxLines;
  final TextStyle? style;
  final FocusNode? focusNode;
  final Color? fillColor;
  final IconData? prefixIcon;
  final TextAlign? textAlign;
  final double? height;
  final Widget? suffixIcon;

  const InputButtonW({super.key, this.onChanged, this.onTap, this.obscureText, this.initialValue, required this.labelText, this.hintText, this.controller, this.inputFormatters, this.validator, this.keyboardType, this.maxLength, this.hintMaxLines, this.style, this.focusNode, this.fillColor, this.prefixIcon, this.textAlign, this.height, this.suffixIcon});



  @override
  Widget build(BuildContext context) {
    return Container(
      //height: height ?? 60,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Text(
              labelText,
              style: AppTheme.labelTitle,
            )
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  textAlignVertical:TextAlignVertical.top ,
                  cursorColor: AppTheme.primaryColor,
                  obscureText: obscureText??false,
                  textAlign: textAlign ?? TextAlign.start,
                  initialValue: initialValue,
                  inputFormatters: inputFormatters,
                  onChanged: onChanged,
                  validator: validator,
                  keyboardType: keyboardType,
                  controller: controller,
                  maxLength: maxLength,
                  style: style,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: Icon(
                      prefixIcon,
                      color: Colors.black54,
                    ),
                    fillColor: fillColor,
                    floatingLabelStyle: const TextStyle(color: Colors.black, backgroundColor: Colors.white),
                    labelText: labelText,
                    counterText: '',
                    hintText: hintText,
                    floatingLabelAlignment:FloatingLabelAlignment.start,
                    /* suffixIcon: GestureDetector(
                      onTap: onTap,
                      child:  Icon(obscureText ? Icons.visibility_off : Icons.visibility,size: 23.0,color: obscureText ? Colors.black45: AppTheme.primaryColor,),
                    ), */
                    suffixIcon:suffixIcon,
                    labelStyle: const TextStyle(fontSize: 15.0),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.yellow,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      //fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                      //contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                  ),
                  
                  
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}