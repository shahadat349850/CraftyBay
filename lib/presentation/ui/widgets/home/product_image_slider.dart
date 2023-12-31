import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
 final List<String> imageList;
  const ProductImageSlider({super.key, required this.imageList});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedCarouselSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            viewportFraction: 1,

            autoPlay: true,
          
            enlargeCenterPage: true,
enlargeFactor: 0.2,

            autoPlayInterval:  const Duration(seconds: 3),

            onPageChanged: (index, _) {
              _selectedCarouselSlider.value = index;
            },
          ),
          items: widget.imageList.map(
            (imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        image: DecorationImage(
                          image: NetworkImage(imageUrl)
                        ),
                    ),
                    alignment: Alignment.center,

                  );
                },
              );
            },
          ).toList(),

        ),
        Positioned
          (
          bottom:10,
          left:0,right:0,
          child: ValueListenableBuilder(
            valueListenable: _selectedCarouselSlider,
            builder: (context, value, _) {
              List<Widget> carouselDotList = [];
              for (int i = 0; i < widget.imageList.length; i++) {
                carouselDotList.add(Container(
                  width: value == i ? 30 : 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: value == i ? ColorPalette.primaryColor : Colors.white,
                  ),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: carouselDotList,
              );
            },
          ),
        ),

      ],
    );
  }
}
