import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class InputSelectorW extends StatelessWidget {
  final FutureOr<Iterable<String>> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, String) itemBuilder;
  final void Function(String) onSuggestionSelected;
  final String? hintText;
  final void Function(String)? onChanged;
  final Color priColor;
  final Color secColor;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final SuggestionsBoxController? suggestionsBoxController;
  final Widget Function(BuildContext, Widget, AnimationController?)? transitionBuilder;
  final String? initialValue;

  const InputSelectorW({super.key, required this.suggestionsCallback, required this.itemBuilder, required this.onSuggestionSelected, this.hintText, this.onChanged, required this.priColor, required this.secColor, this.onSaved, this.validator, this.controller, this.suggestionsBoxController, this.transitionBuilder, this.initialValue});




  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Container(
      //width: size.width*0.9,
      height: 60,
      margin: const EdgeInsets.only( top: 0, bottom: 1),
      //padding: const EdgeInsets.symmetric(horizontal: 5.0),
      /* decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white70.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: color, style: BorderStyle.solid, width: 1.5)), */
      child: Column(
        children: <Widget>[
          TypeAheadFormField(
              suggestionsBoxController: suggestionsBoxController,
              transitionBuilder:transitionBuilder,
              initialValue: initialValue,
              textFieldConfiguration: TextFieldConfiguration(
                controller: controller,
                onChanged: onChanged,
                autofocus: true,
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: priColor,width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: priColor,
                  ),
                  hintText: hintText
                ),
              ),
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 4.0,
                color: Theme.of(context).cardColor,
              ),
              suggestionsCallback: suggestionsCallback,
              itemBuilder: itemBuilder,
              onSuggestionSelected: onSuggestionSelected,
              onSaved: onSaved,
              validator: validator),
        ],
      ),
    );
  }
}
