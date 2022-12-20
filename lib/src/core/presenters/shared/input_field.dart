// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';

class InputField extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? hintText;
  final TextEditingController controller;
  final double? fontSize;
  final double? borderRadius;
  final validator;
  final TextInputType? keyboardType;
  final bool? digitsOnly;
  final String? prefixText;
  final String? label;
  final EdgeInsets padding;
  final bool? passwordMode;
  final Function()? suffixIconFunction;
  final Function()? prefixIconFunction;
  final autovalidateMode = AutovalidateMode.disabled;
  final Function(String)? onChanged;
  const InputField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.fontSize = SizeOutlet.textSizeMicro1,
    this.borderRadius = SizeOutlet.borderRadiusSizeNormal,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.digitsOnly = false,
    this.prefixText = '',
    this.label = '',
    this.padding = const EdgeInsets.all(0),
    this.passwordMode = false,
    this.suffixIconFunction,
    this.prefixIconFunction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(true);

    return ValueListenableBuilder(
      valueListenable: passwordVisible,
      builder: (context, value, child) => Padding(
        padding: padding,
        child: TextFormField(
          controller: controller,
          obscureText: passwordMode! ? passwordVisible.value : false,
          inputFormatters: digitsOnly! ? [FilteringTextInputFormatter.digitsOnly] : [],
          keyboardType: keyboardType ?? TextInputType.text,
          validator: (validator == null) ? (value) => (value!.isEmpty) ? 'Campo obrigatório' : null : validator,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: InkWell(
              borderRadius: BorderRadius.circular(SizeOutlet.borderRadiusSizePattern),
              onTap: prefixIconFunction ?? () {},
              child: Icon(
                prefixIcon,
                color: ColorOutlet.colorGrey,
              ),
            ),
            suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(SizeOutlet.borderRadiusSizePattern),
              onTap: passwordMode! ? () => passwordVisible.value = !passwordVisible.value : suffixIconFunction ?? () {},
              child: Icon(
                passwordMode! ? (passwordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined) : suffixIcon,
                color: ColorOutlet.colorGrey,
              ),
            ),
            hintText: label,
            prefixText: prefixText,
            labelStyle: TextStyle(
              color: ColorOutlet.colorGrey,
              fontSize: fontSize,
            ),
            hintStyle: TextStyle(
              fontSize: fontSize,
              color: ColorOutlet.colorGrey,
              fontFamily: 'TTNorms_Regular',
            ),
            filled: true,
            fillColor: ColorOutlet.colorWhite,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius!),
              ),
              borderSide: const BorderSide(
                color: ColorOutlet.colorTransparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius!),
              ),
              borderSide: const BorderSide(
                color: ColorOutlet.colorTransparent,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius!),
              ),
              borderSide: const BorderSide(
                color: ColorOutlet.colorPrimary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius!),
              ),
              borderSide: const BorderSide(
                color: ColorOutlet.colorPrimary,
              ),
            ),
            errorStyle: const TextStyle(
              fontSize: 12,
              color: ColorOutlet.colorPrimary,
              fontFamily: 'TTNorms_Medium',
            ),
          ),
        ),
      ),
    );
  }
}
