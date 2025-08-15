import 'package:flutter/material.dart';
import 'package:news_app/utlis/app_colors.dart';
import 'package:news_app/utlis/app_styles.dart';

class DropListItem extends StatelessWidget {
  final List<String> items;
  final String selectedValue;
  final void Function(String?)? onChanged;
  const DropListItem({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.greyColor,
      isExpanded: true,
      decoration: InputDecoration(
        border: outLIneInputBorder(),
        disabledBorder: outLIneInputBorder(),
        focusedBorder: outLIneInputBorder(),
        enabledBorder: outLIneInputBorder(),
      ),
      style: AppStyles.bold20White,
      iconEnabledColor: AppColors.whiteColor,
      items: items.map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: onChanged,
      initialValue: selectedValue,
    );
  }

  OutlineInputBorder outLIneInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: AppColors.whiteColor, width: 2),
    );
  }
}
