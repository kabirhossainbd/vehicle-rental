import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/data/model/custom_dropdown_model.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class CustomDropdown extends StatefulWidget {
  final CustomDropdownModel? selectedItem;
  final List<CustomDropdownModel> items;
  final String title,hintText;
  final Function(CustomDropdownModel? selectItem)? onChanged;
  const CustomDropdown({super.key, required this.selectedItem, this.items = const [], this.title = '', this.hintText = 'Select Item', this.onChanged});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Theme.of(context).primaryColor)),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Text(widget.title, style: poppinsRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeExtraSmall),),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<CustomDropdownModel>(
                isExpanded: true,
                hint: Text(widget.hintText, style: poppinsBold.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeExtraSmall),),
                items: widget.items.map((CustomDropdownModel item) => DropdownMenuItem<CustomDropdownModel>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                    child: Text(
                      item.name ?? '',
                      style: poppinsBold.copyWith(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )).toList(),
                value: widget.selectedItem,
                onChanged: widget.onChanged,
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  elevation: 0,
                ),
                iconStyleData:  IconStyleData(
                  icon: Icon(CupertinoIcons.chevron_down, color: Theme.of(context).primaryColor, size: 20),
                  iconSize: 14,
                  iconEnabledColor: Theme.of(context).primaryColor,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  offset: Offset.zero,
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(8),
                    thickness: WidgetStateProperty.all<double>(6),
                    thumbVisibility: WidgetStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 0, right: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


