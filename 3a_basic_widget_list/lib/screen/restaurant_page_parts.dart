


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yummy/screen/restaurant_page.dart';

import '../components/restaurant_item.dart';


GridView _buildGridView(int columns,  RestaurantPage widget) {
  return GridView.builder(
    padding: const EdgeInsets.all(0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 3.5,
      crossAxisCount: columns,
    ),
    itemBuilder: (context, index) => _buildGridItem(index, widget),
    itemCount: widget.restaurant.items.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
  );
}

SliverToBoxAdapter buildGridViewSection(String title, BuildContext context,  RestaurantPage widget) {
// 2
  final columns =
    calculateColumnCount(MediaQuery.of(context).size.width);
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(title),
          _buildGridView(columns, widget),
        ],
      ),
    ),
  );
}




SliverAppBar buildSliverAppBar( RestaurantPage widget) {
  return SliverAppBar(
    pinned: true,
    expandedHeight: 300.0,
    flexibleSpace: FlexibleSpaceBar(
      background: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 64.0,
          ),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image:
                    AssetImage(widget.restaurant.imageUrl),
                    fit: BoxFit.cover,),),
              ),
              const Positioned(
                bottom:0.0,
                left: 16.0,
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.store, color:
                  Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


SliverToBoxAdapter buildInfoSection(BuildContext context, RestaurantPage widget) {
  final textTheme = Theme.of(context).textTheme;
  final restaurant = widget.restaurant;
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(restaurant.name, style:
          textTheme.headlineLarge,),
          Text(restaurant.address, style: textTheme.bodySmall,),
          Text(
            restaurant.getRatingAndDistance(),
            style: textTheme.bodySmall,),
          Text(restaurant.attributes, style:
          textTheme.labelSmall,),
        ],
      ),
    ),
  );
}


Widget _buildGridItem(int index,  RestaurantPage widget) {
  final item = widget.restaurant.items[index];
  return InkWell(
    onTap: () {
// Present Bottom Sheet in the future.
    },
    child: RestaurantItem(item: item),
  );
}


Widget _sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,),
    ),
  );
}

int calculateColumnCount(double screenWidth) {
   const desktopThreshold = 700;
  return screenWidth > desktopThreshold ? 2 : 1;
}