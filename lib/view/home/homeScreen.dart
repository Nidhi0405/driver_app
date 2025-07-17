import 'package:driver_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/textStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List categories = [
    ['assets/images/categories/alcohol.png','Alcohol'],
    ['assets/images/categories/conveniece.png','Conveniece'],
    ['assets/images/categories/petSupplies.png','Pet Supplies'],
    ['assets/images/categories/iceCream.png','Ice cream'],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 2.h),
          children: [
            SizedBox(height: 2.h,),

            Text("Current Location", style: AppTextStyles.body16bold,),
            SizedBox(height: 2.h,),
            Row(
              children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:3.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: greyShade3,),

                  alignment: Alignment.center,

                  child:
                  Row(children: [
                    Text(
                      "American", 
                      style: AppTextStyles.body14bold,
                    ),
                    SizedBox(width: 5.w,),
                    const Image(image: AssetImage('assets/images/categories/american.png'), height:65, width:65 )],
                  ),
                ),
              ),

              SizedBox(width: 5.w,),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal:3.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: greyShade3,),

                    alignment: Alignment.center,

                    child:
                    Row(children: [
                      Text(
                        "Grocery",
                        style: AppTextStyles.body14bold,
                      ),
                      SizedBox(width: 5.w,),
                      const Image(image: AssetImage('assets/images/categories/grocery.png'), height:65, width:65)],
                    ),
                  ),
                )

            ],),

            SizedBox(height: 1.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories.map((e) => Column(
                children: [
                  Container(
                    height: 12.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                      color: greyShade3,
                      borderRadius: BorderRadius.circular(10.sp,),
                      ),
                    child: Image(image: AssetImage(e[0]),),
                    ),
                  SizedBox(height: 0.5.h,),
                  Text(e[1], style: AppTextStyles.body14bold,)
                ],
              )).toList(),
            ),

            SizedBox(height: 2.h,),
            Divider(thickness: 1.h, color: greyShade3,),
            SizedBox(height: 2.h,),
            ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:10,
                itemBuilder: (context,index){
              return Container(
                height: 18.h,
                width: 94.w,
                margin: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: greyShade3),
              );
            })
            
        ],)
      ),
    );
  }
}
