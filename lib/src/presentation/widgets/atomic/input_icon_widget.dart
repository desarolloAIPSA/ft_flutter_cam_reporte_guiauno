import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/app_theme.dart';

class InputIconW extends StatelessWidget {
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
  final IconData? prefixIcon;
  final bool? obscureText;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;

  const InputIconW({super.key, required this.labelText, this.hintText, required this.onChanged, this.controller, this.inputFormatters, this.validator, this.keyboardType, this.initialValue, this.maxLength, this.hintMaxLines, this.style, this.focusNode, this.fillColor, this.prefixIcon, this.obscureText, this.textAlign, this.contentPadding, this.height});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Container(
      //height: 50,
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: height??50,
              child: TextFormField(
                cursorColor: AppTheme.primaryColor,
                textAlign: textAlign ?? TextAlign.start,
                initialValue: initialValue,
                inputFormatters: inputFormatters,
                onChanged: onChanged,
                validator: validator,
                keyboardType: keyboardType,
                controller: controller,
                obscureText: obscureText ?? false,
                maxLength: maxLength,
                style: style,
                focusNode: focusNode,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: prefixIcon != null
                        ? Icon(
                            prefixIcon,
                            color: Colors.black54,
                          )
                        : Container(),
                    fillColor: fillColor,
                    floatingLabelStyle: const TextStyle(color: Colors.black, backgroundColor: Colors.white),
                    labelStyle: const TextStyle(fontSize: 15.0),
                    labelText: labelText,
                    counterText: '',
                    hintText: hintText,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.9),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    //fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    //contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                    contentPadding: contentPadding),

                //style: FlutterFlowTheme.of(context).titleSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
