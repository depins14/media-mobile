import 'package:flutter/material.dart';
import 'package:media/cubit/option_cubit.dart';
import 'package:media/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Option extends StatelessWidget {
  final String text;
  final String id;
  Option({Key? key, required this.text, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<OptionCubit>().isSelected(id);
    return GestureDetector(
      onTap: () {
        context.read<OptionCubit>().selectOption(id);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor.withOpacity(0.9) : Color(0xffEEEEEE),
        ),
        margin: EdgeInsets.only(bottom: 10),
        child: Text(
          text,
          style: blackTextStyle.copyWith(fontWeight: regular),
        ),
      ),
    );
  }
}
