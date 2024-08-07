import 'package:flutter/material.dart';


class CustomSelectionDialog extends StatefulWidget {
  final String title;
  final List<String> options;
  final ValueChanged<String> onSelected;

  const CustomSelectionDialog({
    required this.title,
    required this.options,
    required this.onSelected,
    super.key,
  });

  @override
  _CustomSelectionDialogState createState() => _CustomSelectionDialogState();
}

class _CustomSelectionDialogState extends State<CustomSelectionDialog> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: double.minPositive,
        height: double.minPositive,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.options[index]),
              onTap: () {
                setState(() {
                  selectedOption = widget.options[index];
                });
              },
              selected: selectedOption == widget.options[index],
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (selectedOption != null) {
              widget.onSelected(selectedOption!);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Select'),
        ),
      ],
    );
  }
}
