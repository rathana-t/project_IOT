import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required TextEditingController controller,
    required this.hintText,
    required this.validator,
    this.keyboardType = TextInputType.text,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String hintText;
  final Function validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: ColorConst.grey,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConst.grey,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color: ColorConst.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: ColorConst.grey,
              ),
            ),
          ),
          validator: ((value) => validator(value)),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
