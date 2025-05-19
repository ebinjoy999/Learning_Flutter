
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/recipe.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetails({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
     return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetails> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label)
      ),
      body: SafeArea(child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(widget.recipe.imageUrl,),
          ),
          const SizedBox(height: 4,),
          Text(
            widget.recipe.label,
            style: const TextStyle(fontSize: 18),
          ),

          Expanded(
            // 8
            child: ListView.builder(
              padding: const EdgeInsets.all(7.0),
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final ingredient = widget.recipe.ingredients[index];
                // 9
                return Text('${ingredient.quantity * _sliderVal} '
                    '${ingredient.measure} '
                    '${ingredient.name}');
              },
            ),
          ),

          Slider(
            min: 1,
            max: 10,
            divisions: 9,
// 11
            label: '${_sliderVal * widget.recipe.servings} servings',
// 12
            value: _sliderVal.toDouble(),
// 13
            onChanged: (newValue) {
              setState(() {
                _sliderVal = newValue.round();
              });
            },
// 14
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ),

        ],
      )),
    );
  }
}