import 'package:driver_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/textStyles.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  List categories = [
    ['assets/images/categories/alcohol.png', 'Alcohol'],
    ['assets/images/categories/american.png', 'American'],
    ['assets/images/categories/asian.png', 'Asian'],
    ['assets/images/categories/burger.png', 'Burger'],
    ['assets/images/categories/caribbean.png', 'Caribbean'],
    ['assets/images/categories/chinese.png', 'Chinese'],
    ['assets/images/categories/conveniece.png', 'Conveniece'],
    ['assets/images/categories/dessert.png', 'dessert'],
    ['assets/images/categories/fastFood.png', 'Fast Food'],
    ['assets/images/categories/flower.png', 'Flower'],
    ['assets/images/categories/grocery.png', 'Grocery'],
    ['assets/images/categories/indian.png', 'Indian'],
    ['assets/images/categories/petSupplies.png', 'Pet Supplies'],
    ['assets/images/categories/retails.png', 'Retails'],
    ['assets/images/categories/ride.png', 'Ride'],
    ['assets/images/categories/speciality.png', 'Speciality'],
    ['assets/images/categories/takeout.png', 'Takeout'],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //bottom: false, is set to remove space at the bottom of the screen.
      bottom: false,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          children: [
            SizedBox(height: 5.h),
            Text(
              "All Categories",
              style: AppTextStyles.body16,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 1.h),
            GridView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: greyShade3,
                          ),
                          child: Image(image: AssetImage(categories[index][0])),
                        ),
                        //color: greyShade3,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(categories[index][1], style: AppTextStyles.small12),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
