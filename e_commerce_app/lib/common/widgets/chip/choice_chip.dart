import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key, required this.selected, required this.text, this.onSelected,

  });
  final bool selected;
  final String text;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final iscolor=THelpersFunction.getColor(text)!=null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label:iscolor ? const SizedBox(): Text (text),
         selected: selected,
         onSelected: onSelected,
      labelStyle: TextStyle(color: selected ?TColors.textwhite:null),
      avatar: iscolor? TcirularContainer(width: 50,height: 50,backgroundColor:THelpersFunction.getColor(text)!)
      :null,
      shape:iscolor?const CircleBorder():null,
      labelPadding:iscolor?const EdgeInsets.all(0):null,
      padding: iscolor? const EdgeInsets.all(0):null,
     // selectedColor:iscolor? Colors.green:null,
      backgroundColor: iscolor?THelpersFunction.getColor(text)!:null,
      ),
    );
  }
}