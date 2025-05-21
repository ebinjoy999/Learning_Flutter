import 'package:flutter/material.dart';
import 'package:flutter_app/recipe.dart';
import 'package:flutter_app/recipe_card.dart';
import 'package:flutter_app/recipe_detail.dart';

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
        title: 'Recipe Calculator',
        theme: theme.copyWith(
        colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.greenAccent),
        ),
      home: const MyHomePage(
        title: 'Recipe Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
// TODO: Replace child: Container()
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return recipeItem(index);
          },)
      ),
    );
  }

  Widget recipeItem(int index) {
    return GestureDetector(
// 8
      onTap: () {
// 9
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
// 10
// TODO: Replace return with return RecipeDetail()
//               return Text('Detail page');
              return RecipeDetails(recipe: Recipe.samples[index]);
            },
          ),
        );
      },
// 11
      child: buildRecipeCard(Recipe.samples[index]),
    );
  }
}