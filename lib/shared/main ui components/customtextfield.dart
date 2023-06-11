import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/utils/uiutils.dart';
import '../services/localization/localization.dart';

class CustomTextfield extends StatefulWidget {
  final Widget suffix;
  final Widget priffix;
  final TextEditingController controller;
  final bool isobscure, borderd, enabled;
  final int validator, maxchar, maxlines;
  final Function customvalidator;
  final bool isnumber;
  final String hint, label, errText, password;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final String initvalue;
  final TextInputType inputType;

  CustomTextfield({
    Key key,
    this.hint,
    this.label,
    this.priffix = null,
    this.suffix = null,
    this.controller,
    this.isobscure = false,
    this.validator = 0,
    this.customvalidator,
    this.borderd = true,
    this.enabled = true,
    this.isnumber = false,
    this.maxchar,
    this.maxlines = 1,
    this.onChanged,
    this.errText,
    this.initvalue = null,
    this.onSaved,
    this.inputType = TextInputType.name,
    this.password,
    // this.confirmpassword,
  }) : super(key: key);

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    String translate(String index) {
      if (AppLocalizations.of(context).get(index) == null) {
        print("not found");
      }
      return AppLocalizations.of(context).get(index) ?? index;
    }

    List<MultiValidator> validators = [
      MultiValidator([
        RequiredValidator(errorText: translate("this field is required")),
      ]),
      MultiValidator([
        RequiredValidator(errorText: translate("this field is required")),
        EmailValidator(errorText: translate("this email is not valid"))
      ]),
      MultiValidator([
        RequiredValidator(errorText: translate("this field is required")),
        MinLengthValidator(
          8,
          errorText:
              translate("the password should have at least 8 characters"),
        ),
      ]),
      MultiValidator([
        RequiredValidator(errorText: translate("this field is required")),
        // MinLengthValidator(11,
        //     errorText:
        //         translate("the phone number should consist of 11 numbers")),
        PatternValidator(RegExp(r'^5(5|0|3|6|4|9|1|8|7)([0-9]{7})$').pattern,
            errorText: translate("wrong phone number"))
      ]),
      MultiValidator([
        RequiredValidator(errorText: translate("this field is required")),
        DateValidator("yM", errorText: translate("wrong date format")),
      ]),
      MultiValidator([
        DateValidator("yM", errorText: translate("wrong date format")),
      ]),
      null,
      MultiValidator([
        RequiredValidator(errorText: translate("this field is required")),
        MinLengthValidator(
          8,
          errorText:
              translate("the password should have at least 8 characters"),
        ),
        ConfirmPasswordValidator(widget.password, widget.controller.text)
      ]),
      MultiValidator([
        PatternValidator(RegExp(r'^5(5|0|3|6|4|9|1|8|7)([0-9]{7})$').pattern,
            errorText: translate("wrong phone number"))
      ]),
    ];
    return TextFormField(
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.start,
        initialValue: widget.initvalue,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        maxLength: widget.maxchar ?? null,
        keyboardType: widget.isnumber ? TextInputType.number : widget.inputType,
        inputFormatters: widget.isnumber
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ]
            : [],
        maxLines: widget.maxlines ?? 1,
        enabled: widget.enabled,
        controller: widget.controller,
        obscureText: widget.isobscure,
        decoration: InputDecoration(
          counterText: "",
          errorText: widget.errText,
          focusedBorder: widget.borderd == true
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: accentcolor),
                  borderRadius: BorderRadius.circular(8))
              : InputBorder.none,
          // border: widget.borderd == true
          //     ? OutlineInputBorder(
          //         borderSide: BorderSide(color: warningcolor),
          //         borderRadius: BorderRadius.circular(8))
          //     : InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: customtextfieldbordercolor),
              borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: warningcolor),
              borderRadius: BorderRadius.circular(8)),
          disabledBorder: widget.borderd == true
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: graymedium),
                  borderRadius: BorderRadius.circular(8))
              : InputBorder.none,
          hintText: translate(widget.hint),
          hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          labelText: widget.label,
          labelStyle: TextStyle(
            color: textcolor,
          ),
          prefixIcon: widget.priffix ?? null,
          prefixText: '',

          suffix: widget.suffix,
          suffixStyle: TextStyle(
            color: blackcolor,
          ),
        ),
        validator:
            // widget.customvalidator != null
            //     ? widget.customvalidator
            //     :
            widget.validator != null ? validators[widget.validator] : null);
  }
}

class ConfirmPasswordValidator extends TextFieldValidator {
  final String password;
  final String confirmpassword;
  // pass the error text to the super constructor
  ConfirmPasswordValidator(this.password, this.confirmpassword,
      {String errorText = 'The password dont match'})
      : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String value) {
    UI.logger(password);
    UI.logger(confirmpassword);

    if (password != confirmpassword) {
      return false;
    }
    return true;
    // return true if the value is valid according the your condition
  }
}
