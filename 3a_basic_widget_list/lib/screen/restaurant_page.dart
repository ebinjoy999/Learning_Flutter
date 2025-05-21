import 'package:flutter/material.dart';
import 'package:yummy/screen/restaurant_page_parts.dart';
import '../components/restaurant_item.dart';
import '../models/restaurant.dart';

// 2
class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

// 3
  const RestaurantPage({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

// 4
class _RestaurantPageState extends State<RestaurantPage> {

  static const desktopThreshold = 700;
  static const double largeScreenPercentage = 0.9;
  static const double maxWidth = 1000;

  double _calculateConstrainedWidth(double screenWidth) {
    return (screenWidth > desktopThreshold
        ? screenWidth * largeScreenPercentage //
        : screenWidth)
        .clamp(0.0, maxWidth);
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final constrainedWidth =
    _calculateConstrainedWidth(screenWidth);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: constrainedWidth,
          child: _buildCustomScrollView(widget, context),
        ),
      ),
    );
  }


//   @override
//   Widget build(BuildContext context) {
// // 5
//     return Scaffold(
//       body: Center(
//         child:
//         _buildCustomScrollView(),
//       ),
//     );
//   }


  CustomScrollView _buildCustomScrollView( RestaurantPage widget, BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildSliverAppBar(widget),

        buildInfoSection(context, widget),
        buildGridViewSection('Menu', context, widget),

        SliverFillRemaining(
          child: Container(
            color: Colors.blue,),),
      ],
    );
  }
}
