import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:vehicle_rental_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final bool isbBorderColor;
  final bool isError;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Color? fillColor;
  final int? maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool? isPassword;
  final bool? isCountryPicker;
  final bool? isShowBorder;
  final bool? isIcon;
  final bool? isShowSuffixIcon;
  final bool? isShowPrefixIcon;
  final Function? onTap;
  final Function(String text)? onChanged;
  final Function? onSuffixTap;
  final String? suffixActiveIconUrl;
  final String? suffixInactiveIconUrl;
  final String? prefixIconUrl;
  final Widget prefixWidget;
  final bool? isSearch;
  final Function? onSubmit;
  final bool? isEnabled;
  final TextCapitalization? capitalization;

  const CustomTextField(
      {super.key,
        this.hintText = 'Write something...',
        this.controller,
        this.borderRadius,
        this.backgroundColor,
        this.isbBorderColor = false,
        this.isError = false,
        this.focusNode,
        this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        this.maxLength,
        this.maxLengthEnforcement,
        this.onSuffixTap,
        this.fillColor,
        this.onSubmit,
        this.onChanged,
        this.capitalization = TextCapitalization.none,
        this.isCountryPicker = false,
        this.isShowBorder = false,
        this.isShowSuffixIcon = false,
        this.isShowPrefixIcon = false,
        this.prefixWidget = const SizedBox(),
        this.onTap,
        this.isIcon = false,
        this.isPassword = false,
        this.suffixActiveIconUrl,
        this.suffixInactiveIconUrl,
        this.prefixIconUrl,
        this.isSearch = false,});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        //color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
        border: Border.all(color: widget.isError ? Theme.of(context).colorScheme.redColor : Colors.grey.shade300),
      ),
      child: TextField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).colorScheme.textColor),
        textInputAction: widget.inputAction,
        keyboardType: widget.inputType,
        cursorColor: Theme.of(context).primaryColor,
        textCapitalization: widget.capitalization!,
        enabled: widget.isEnabled,
        autofocus: false,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        maxLength: widget.maxLength,
        //onChanged: page.isSearch ? page.languageProvider.searchLanguage : null,
        obscureText: widget.isIcon! ? _obscureText : false,
        inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9+]'))] : null,
        decoration: InputDecoration(
          //contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
          contentPadding: const EdgeInsets.only(left: 12,right: 12,top: 17),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(8),left: Radius.circular(8)),
            borderSide: BorderSide(style: BorderStyle.none, width: 0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(8),left: Radius.circular(8)),
            borderSide: BorderSide(style: BorderStyle.none, width: 0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(8),left: Radius.circular(8)),
            borderSide: BorderSide(style: BorderStyle.none, width: 0),
          ),
          isDense: true,
          hintText: widget.hintText,
          fillColor: widget.fillColor,
          hintStyle: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).colorScheme.crossColor),
          //filled: true,
          prefix: widget.prefixWidget,
          prefixIcon: widget.isShowPrefixIcon! ? Padding(
            padding: const EdgeInsets.only(left: Dimensions.paddingSizeLarge, right: Dimensions.paddingSizeDefault),
            child: SvgPicture.asset(widget.prefixIconUrl!),
          ) : const SizedBox.shrink(),
          prefixIconConstraints: const BoxConstraints(minWidth: 8, maxHeight: 20),
          suffixIcon: widget.isError ? IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            onPressed: (){},
            icon: SvgPicture.asset(
              AllImages.home,
              width: 18,
              height: 13,
              color: Theme.of(context).colorScheme.redColor,
            ),
          ) : widget.isShowSuffixIcon!
              ? widget.isPassword! ? IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Theme.of(context).colorScheme.crossColor),
              onPressed: _toggle)
              : widget.isIcon!
              ? IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            onPressed:_toggle,
            icon: SvgPicture.asset(
              _obscureText ? widget.suffixInactiveIconUrl! : widget.suffixActiveIconUrl!,
              width: 18,
              height: 13,
            ),
          ) : null
              : null,
        ),
        onTap: () => widget.onTap,
        onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus) : widget.onSubmit != null ? widget.onSubmit!(text) : null,
        onChanged: (text) {
          widget.onChanged != null ? widget.onChanged!(text) : {};
        },
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}