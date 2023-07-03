// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../../../config/app_theme.dart';
import '../../../data/models/option_model.dart';

class DropDownButtonLabelW extends StatelessWidget {
  final List<Option> items;
  final String title;
  final void Function(Option?) onChanged;
  final Option value;
  final String vacio;
  final Color color;
  final double? height;
  final bool? showLabel;

  const DropDownButtonLabelW({super.key, required this.items, required this.title, required this.onChanged, required this.value, required this.vacio, required this.color, this.height, this.showLabel});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Text(
                title,
                style: AppTheme.labelTitle,
              )),
          Container(
            height: height ?? 60,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white70.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(color: color, style: BorderStyle.solid, width: 1.0),
            ),
            child: DropdownButtonHideUnderline(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownButton<Option>(
                        //dropdownColor: color.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                        //iconDisabledColor: Colors.red,
                        focusColor: Colors.white,
                        //iconEnabledColor: color,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                          color: AppTheme.primaryColor,
                        ),
                        elevation: 8,
                        iconSize: 24.0,
                        isDense: false,
                        items: [
                          DropdownMenuItem<Option>(
                            value: null,
                            child: Center(
                                child: Text(
                              vacio,
                              style: const TextStyle(color: Colors.grey),
                            )),
                          ),
                          ...items.map(
                            (value) => DropdownMenuItem<Option>(
                              value: value,
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    /* if (showLabel ?? false)
                                      Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(
                                            value.label,
                                            style: const TextStyle(fontWeight: FontWeight.w600),
                                          )), */
                                    /* Expanded(
                                      child: Text(
                                        value.value,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      )
                                    ), */
                                    Expanded(
                                      child: RichText(
                                        overflow:TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,

                                        text: TextSpan(
                                          style: AppTheme.body1,
                                          children: <TextSpan>[
                                            if (showLabel ?? false) TextSpan(text: '(${value.label})  ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(text: value.value),
                                          ],
                                        ),
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        onChanged: onChanged,
                        isExpanded: true,
                        value: items.contains(value) ? value : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
