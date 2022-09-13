import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({Key? key}) : super(key: key);

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final urlImages = [
    'https://images.newindianexpress.com/uploads/user/imagelibrary/2021/10/3/w1200X800/athulya12062938.jpg',
    'https://www.athulyaliving.com/assets/images/Skilled%20nursing.JPG',
    'https://i.ytimg.com/vi/rW5TnL2fiK8/maxresdefault.jpg',
    'https://images.newindianexpress.com/uploads/user/imagelibrary/2022/4/11/w1200X800/Around.jpg'
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                reverse: false,
                autoPlayInterval: Duration(seconds: 2),
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
              itemCount: urlImages.length,
              itemBuilder: ((context, index, realIndex) {
                final urlImage = urlImages[index];
                return buildImage(urlImage, index);
              }),
            ),
            const SizedBox(
              height: 32,
            ),
            buildIndicator(),
          ],
        ),
      );

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.network(
        urlImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: JumpingDotEffect(
            dotColor: Color.fromARGB(255, 222, 52, 128),
            activeDotColor: Color.fromARGB(255, 29, 102, 142)),
      );
}
