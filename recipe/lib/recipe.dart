class Recipe {
  String label;
  String imageUrl;

  int servings;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imageUrl, this.servings, this.ingredients);

  static List<Recipe> samples = [
    Recipe(
        "Sopa de Tomate",
        "https://th.bing.com/th/id/OIP.2WntBseRlenQurb3r0KpAAHaFj?w=244&h=183&c=7&r=0&o=5&pid=1.7",
        4, [
      Ingredient(1, 'box', 'tomate'),
      Ingredient(4, '', 'água'),
      Ingredient(0.5, 'gramas', 'sauce')
    ]),
    Recipe(
      "Medalhão",
      "https://th.bing.com/th/id/OIP.DWO3Y1O56fnRg-4uPxyx9AHaFn?w=243&h=184&c=7&r=0&o=5&pid=1.7",
      1,
      [
        Ingredient(
          2,
          'slices',
          'Cheese',
        ),
        Ingredient(
          2,
          'slices',
          'Bread',
        ),
      ],
    ),
    Recipe(
      "Bife de Frango Grelhado",
      "https://th.bing.com/th?q=Bife+De+Frango+Grelhado&w=120&h=120&c=1&rs=1&qlt=90&cb=1&pid=InlineBlock&mkt=pt-BR&cc=BR&setlang=pt-br&adlt=strict&t=1&mw=247",
      1,
      [
        Ingredient(
          2,
          'slices',
          'Cheese',
        ),
        Ingredient(
          2,
          'slices',
          'Bread',
        ),
      ],
    ),
    Recipe(
      "Cookies de Chocolate",
      "https://th.bing.com/th/id/OIP.b__3WhhRKogrNmik9rP3ngHaHa?w=189&h=189&c=7&r=0&o=5&pid=1.7",
      1,
      [
        Ingredient(
          2,
          'slices',
          'Cheese',
        ),
        Ingredient(
          2,
          'slices',
          'Bread',
        ),
      ],
    ),
    Recipe(
      "Bolo de Leite Condensado",
      "https://th.bing.com/th/id/OIP.oXJ14oazjCd1heSxUF557gHaFj?w=235&h=180&c=7&r=0&o=5&pid=1.7",
      1,
      [
        Ingredient(
          2,
          'slices',
          'Cheese',
        ),
        Ingredient(
          2,
          'slices',
          'Bread',
        ),
      ],
    ),
    Recipe(
      "Sorvete de Limão",
      "https://th.bing.com/th/id/OIP.xEwWQLMM_r1oUG_2kUp-IAHaD5?w=283&h=180&c=7&r=0&o=5&pid=1.7",
      1,
      [
        Ingredient(
          2,
          'slices',
          'Cheese',
        ),
        Ingredient(
          2,
          'slices',
          'Bread',
        ),
      ],
    ),
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}
