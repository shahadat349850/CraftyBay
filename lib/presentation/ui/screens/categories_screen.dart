import 'package:crafty_bay/presentation/State_Holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/bottom_nav_base_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_coustomize/constraints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.find<MainButtonNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: appBackgroundColor,
          title: Text('Categories', style: appBarStyle),
          leading: IconButton(
      color: iconColor,
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        Get.find<MainButtonNavController>().backToHome();
      },
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: GridView.builder(
            itemCount: 16,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(
                child: CategoryCard(),
              );
            },
          ),
        ),
      ),
    );
  }
}