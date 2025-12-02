import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers.dart';
import 'package:e_commerce_app/common/widgets/curved_edge/curved_edges_widget.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
       
           color: TColors.primaryColour,
                  
      //  padding:const EdgeInsets.all(0),
      //  child: SizedBox(
      //   // height: 350,
      //    child: 
      child:    Stack(
        children: [
        Positioned(top:-150,right: -250, child:  TcirularContainer(backgroundColor: TColors.light.withOpacity(0.1),)),
       Positioned(top:100,right: -300, child:  TcirularContainer(backgroundColor: TColors.light.withOpacity(0.1),)),
       child,
          
          
     ]
     ),
     //
     //  )
     ),
     );
  }
}

