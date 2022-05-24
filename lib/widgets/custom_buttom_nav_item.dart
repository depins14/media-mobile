import 'package:flutter/material.dart';
import 'package:media/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubit/page_cubit.dart';

class CustomButtomNavigation extends StatelessWidget {
  final int index;
  final String imageUrl;

  const CustomButtomNavigation({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 25,
            height: 25,
            color: context.read<PageCubit>().state == index
                ? primaryColor
                : grayColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
          )
        ],
      ),
    );
  }
}
