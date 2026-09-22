enum AppLanguage { en, mm }

class RecipeStep {
  final int stepNumber;
  final String instructionEn;
  final String instructionMm;
  final String audioPathEn;
  final String audioPathMm;

  const RecipeStep({
    required this.stepNumber,
    required this.instructionEn,
    required this.instructionMm,
    required this.audioPathEn,
    required this.audioPathMm,
  });
}

class Recipe {
  final String id;
  final String titleEn;
  final String titleMm;
  final String descriptionEn;
  final String descriptionMm;
  final String imageUrl;
  final List<String> ingredientsEn;
  final List<String> ingredientsMm;
  final List<RecipeStep> steps;

  const Recipe({
    required this.id,
    required this.titleEn,
    required this.titleMm,
    required this.descriptionEn,
    required this.descriptionMm,
    required this.imageUrl,
    required this.ingredientsEn,
    required this.ingredientsMm,
    required this.steps,
  });

  String getTitle(AppLanguage lang) => lang == AppLanguage.en ? titleEn : titleMm;
  String getDescription(AppLanguage lang) => lang == AppLanguage.en ? descriptionEn : descriptionMm;
}

const mockRecipes = [
  Recipe(
    id: 'r2',
    titleEn: 'Sausage Curry',
    titleMm: 'ကြက်အူချောင်းဆီပြန်ဟင်း',
    descriptionEn: 'Quick and savory sausage curry with tomatoes and onions.',
    descriptionMm: 'ကြက်အူချောင်းခရမ်းချဉ်သီးဆီပြန်ဟင်း',
    imageUrl: 'assets/images/img_recipe2.png',
    ingredientsEn: [
      'Sausages',
      'Onions (2)',
      'Cooking oil',
      'Turmeric powder',
      'Spice powder (1 small tea spoon)',
      'Tomatoes (2)',
      'Salt & MSG (half spoon)',
      'Green chilies',
      'Water'
    ],
    ingredientsMm: [
      'ကြက်အူချောင်း',
      'ကြက်သွန်နီ (၂) လုံး',
      'ဆီ',
      'ဆနွင်းနည်းနည်း',
      'အမွှေးအကြိုင်မှုန့် (ဇွန်းသေး ၁ ဇွန်း)',
      'ခရမ်းချဉ်သီး (၂) လုံး',
      'ဆား / အချိုမှုန့် (ဇွန်းဝက်စီ)',
      'ငရုတ်သီးစိမ်း',
      'ရေအနည်းငယ်'
    ],
    steps: [
      RecipeStep(
        stepNumber: 1,
        instructionEn: 'Slice the sausages and fry them,Mg Mg',
        instructionMm: 'ကြက်အူချောင်းကိုရေဆေးပြီး လှီးပြီးကြော်မောင်မောင်',
        audioPathEn: 'assets/audios/nh_8_3.m4a',
        audioPathMm: 'assets/audios/nh_8_3.m4a',
      ),
      RecipeStep(
        stepNumber: 2,
        instructionEn: 'Add 2 sliced onions to the oil with a pinch of turmeric and sauté. Once they soften, add a little spice powder and stir until the raw smell disappears. Add 2 sliced tomatoes, mash them down, pour in a little water, season with a little salt and MSG, and cover with a lid, Mg Mg.',
        instructionMm: 'ကြက်သွန်နီ၂လုံးလှီးထားပြီးဆီအိုးထဲထည့် ဆနွင်းမှုန့်နဲနဲထည့်ပြီးဆီသပ် အရောင်ငြှိးလာရင် အစိမ်းမှုန့်နဲနဲထည့်ပြီးမွှေ အစိမ်းနံ့ပျောက်လာရင် ခရမ်းချဉ်သီး၂လုံးလှီးထားတာကိုထည့် ကျေအောင်မွှေပြီးရေထည့် အချိုမှုန့် ဆားနဲနဲထည့်ပြီးမောင်မောင်အဖုံးအုပ်ထား',
        audioPathEn: 'assets/audios/nh_8_3.m4a',
        audioPathMm: 'assets/audios/nh_8_3.m4a',
      ),
      RecipeStep(
        stepNumber: 3,
        instructionEn: 'Add the fried sausages, sliced green chilies, and a little more water,Mg Mg',
        instructionMm: 'ကြော်ထားတဲ့ကြက်အူချောင်းထည့်၊ ငရုတ်သီးစိမ်းနည်းနည်းလှီးထည့်၊ ရေနဲနဲထပ်ထည့်မောင်မောင်',
        audioPathEn: 'assets/audios/nh_8_4.m4a',
        audioPathMm: 'assets/audios/nh_8_4.m4a',
      ),
      RecipeStep(
        stepNumber: 4,
        instructionEn: 'Simmer until the water dries up and the oil separates. Ready, Mg Mg!',
        instructionMm: 'ရေခမ်း ဆီပြန်ရင်  ရပြီမောင်မောင်',
        audioPathEn: 'assets/audios/nh_8_4.m4a',
        audioPathMm: 'assets/audios/nh_8_4.m4a',
      ),
    ],
  ),
];