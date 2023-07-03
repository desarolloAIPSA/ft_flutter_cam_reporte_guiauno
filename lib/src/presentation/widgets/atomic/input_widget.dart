import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/app_theme.dart';

class InputW extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final void Function(String) onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final int? maxLength;
  final int? hintMaxLines;
  final TextStyle? style;
  final FocusNode? focusNode;
  final Color? fillColor;
  final String? suffixText;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;

  const InputW({super.key, required this.labelText, this.hintText, required this.onChanged, this.controller, this.inputFormatters, this.validator, this.keyboardType, this.initialValue, this.maxLength, this.hintMaxLines, this.style, this.focusNode, this.fillColor, this.suffixText, this.contentPadding, this.hintStyle});


  

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Container(
      //height: 90,
      
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
                  cursorColor: AppTheme.primaryColor,
                  textAlign: TextAlign.center,
                  initialValue: initialValue,
                  inputFormatters: inputFormatters,
                  onChanged: onChanged,
                  validator: validator,
                  keyboardType: keyboardType,
                  controller: controller,
                  obscureText: false,
                  maxLength: maxLength,
                  style: style,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: fillColor,
                      floatingLabelStyle: const TextStyle(color: Colors.black, backgroundColor: Colors.white),
                      //labelText: labelText,
                      counterText: '',
                      hintText: hintText,
                      hintStyle: hintStyle,
                      suffixText: suffixText,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
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
                        borderSide: BorderSide(
                          color: AppTheme.primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.withAlpha(150),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.withAlpha(80),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      contentPadding: contentPadding
                      //fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                      //contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 30, 24),
                      ),

                  //style: FlutterFlowTheme.of(context).titleSmall,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
