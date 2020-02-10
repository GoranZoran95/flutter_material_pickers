// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// This helper widget manages a scrollable checkbox list inside a picker widget.
class RadioPicker extends StatefulWidget {
  RadioPicker({
    Key key,
    @required this.items,
    @required this.initialItem,
    @required this.onChanged,
  })  : assert(items != null),
        super(key: key);

  // Constants
  static const double defaultItemHeight = 40.0;

  // Events
  final ValueChanged<String> onChanged;

  // Variables
  final List<String> items;
  final String initialItem;

  @override
  RadioPickerState createState() {
    return RadioPickerState(initialItem);
  }
}

class RadioPickerState extends State<RadioPicker> {
  RadioPickerState(this.selectedValue);

  String selectedValue;

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.items.length;

    return Container(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile<String>(
              groupValue: selectedValue,
              title: Text(
                widget.items[index],
              ),
              value: widget.items[index],
              onChanged: (String value) {
                setState(() {
                  selectedValue = value;
                  widget.onChanged(selectedValue);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
