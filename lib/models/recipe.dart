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
    id: 'r1',
    titleEn: 'Sausage Curry',
    titleMm: 'ကြက်အူချောင်းဆီပြန်ဟင်း',
    descriptionEn: 'Quick and savory sausage curry with tomatoes and onions.',
    descriptionMm: 'ကြက်အူချောင်းခရမ်းချဉ်သီးဆီပြန်ဟင်း',
    imageUrl: 'assets/images/img_recipe1.png',
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
  Recipe(
    id: 'r2',
    titleEn: 'Duck Egg Sour Rosella Curry',
    titleMm: 'ဘဲဥချဉ်ပေါင်ဆီပြန်ဟင်း',
    descriptionEn: 'Tangy sour rosella leaves cooked with semi-fried boiled duck eggs.',
    descriptionMm: 'ဘဲဥကြော်နှင့် ချဉ်ပေါင်ရွက်ဆီပြန်ဟင်း',
    imageUrl: 'assets/images/img_recipe2.png',
    ingredientsEn: [
      'Boiled duck eggs',
      'Sour rosella leaves',
      'Dry red chilies (4)',
      'Garlic cloves (6)',
      'Onions (2)',
      'Fish paste (1 finger joint)',
      'Turmeric powder (half tsp)',
      'Salt & MSG (half tsp each)',
      'Green chilies'
    ],
    ingredientsMm: [
      'ဘဲဥပြုတ်',
      'ချဉ်ပေါင်ရွက်',
      'ငရုတ်သီးအနီခြောက် (၄) လုံး',
      'ကြက်သွန်ဖြူ (၆) မွှာ',
      'ကြက်သွန်နီ (၂) လုံး',
      'ငါးပိ (လက်တစ်ဆစ်)',
      'ဆနွင်း (ဇွန်းသေး ၁/၂)',
      'ဆား / အချိုမှုန့် (ဇွန်း ၁/၂ စီ)',
      'ငရုတ်သီးစိမ်း'
    ],
    steps: [
      RecipeStep(
        stepNumber: 1,
        instructionEn: 'Boil duck eggs, halve them, and fry the outer surface slightly until firm, Mg Mg.',
        instructionMm: 'ဘဲဥပြုတ်ပြီးခြမ်းပြီးဆီထဲအပေါ်ကြောမာအောင်နဲနဲကြော်မောင်မောင်',
        audioPathEn: 'assets/audios/nh_8_5.m4a',
        audioPathMm: 'assets/audios/nh_8_5.m4a',
      ),
      RecipeStep(
        stepNumber: 2,
        instructionEn: 'Pound dry red chilies, 6 garlic cloves, 2 onions, and fish paste until fine, Mg Mg.',
        instructionMm: 'ငရုတ်သီးအနီခြောက်လေးတောင့် ကြက်သွန်ဖြူခြောက်မွှာ ကြက်နီနှစ်လုံးငါးပိလက်တစ်ဆစ်ညက်အောင်ထောင်းမောင်မောင်',
        audioPathEn: 'assets/audios/nh_8_5.m4a',
        audioPathMm: 'assets/audios/nh_8_5.m4a',
      ),
      RecipeStep(
        stepNumber: 3,
        instructionEn: 'Add half a small spoon of turmeric and sauté the pounded mix. Add rosella leaves, mash until tender, pour a little water, add half a spoon each of salt/MSG, simmer until oil separates, add duck eggs, and add green chilies shortly after, Mg Mg.',
        instructionMm: 'ဆနွင်းဇွန်းအသေးတစ်ဝက်ထည့်ပြီးဆီသပ် ချဉ်ပေါင်ချွေထားတာထည့်ပြီး ချဉ်ပေါင်ကြေရင်ရေနဲနဲထည့် အချိုမှုန့်/ဆား ဇွန်းတစ်ဝက်ဆီထည့် ဆီပြန်လာရင်ဘဲဥထည့် ခနနေရင် ငရုတ်သီးစိမ်းထည့်မောင်မောင်',
        audioPathEn: 'assets/audios/nh_8_5.m4a',
        audioPathMm: 'assets/audios/nh_8_5.m4a',
      ),
    ],
  ),
  
Recipe(
  id: 'r3',
  titleEn: ' Spicy Pork',
  titleMm: 'ဝက်သားစပ်ချက်',
  descriptionEn: 'Crispy fried marinated pork stir-fried with Shan spices and herbs.',
  descriptionMm: 'အကြော်မှုန့်နယ်ကြော်ပြီး ရှမ်းမွှေးကြိုင်အနှစ်ဖြင့်ချက်ထားသော ဝက်သားစပ်',
  imageUrl: 'assets/images/img_recipe3.png',
  ingredientsEn: [
    'Pork',
    'Turmeric, salt, MSG, black pepper, oyster sauce (half tsp each)',
    'Crispy flour (1.5 tbsp) & water',
    'Ginger (2 finger joints)',
    'Onions & garlic',
    'Coarse red chili flakes & green powder',
    'Lemongrass (1 stalk)',
    'Fish paste (little)',
    'Green chilies (4-5)',
    'Shan coriander'
  ],
  ingredientsMm: [
    'ဝက်သား',
    'ဆနွင်း၊ ဆား၊ အချိုမှုန့်၊ ငရုတ်ကောင်း၊ ခရုဆီ (ဇွန်း ၁/၂ စီ)',
    'အကြော်မှုန့် (၁.၅ ဇွန်း) နှင့် ရေ',
    'ဂျင်း (လက်နှစ်ဆစ်)',
    'ကြက်သွန်နီ၊ ကြက်သွန်ဖြူ',
    'ငရုတ်သီးအကြမ်းဖတ်၊ အစိမ်းမှုန့်',
    'စပါးလင် (၁) တံ',
    'ငပိနဲနဲ',
    'ငရုတ်သီးစိမ်း (၄-၅ တောင့်)',
    'ရှမ်းနံနံ'
  ],
  steps: [
    RecipeStep(
      stepNumber: 1,
      instructionEn: 'Cut pork, marinate with turmeric, salt, MSG, black pepper, and oyster sauce. Mix with crispy flour and water. Fry until golden brown with turmeric in hot oil, then set aside, Mg Mg.',
      instructionMm: 'ဝက်သားကိုအနေတော်လှီး ဆနွင်း ဆား အချိုမှုန့် ငရုတ်ကောင်း ခရုဆီဇွန်းတစ်ဝက်ဆီရောနယ်ပြီး အကြော်မှုန့် ထမင်းစားဇွန်းတစ်ဇွန်းခွဲ ရေနဲနဲထပ်ရောနယ်ပြီး ဆီအိုးထဲ ဆနွင်းမှုန့်နဲနဲထည့်ပြီး ရွှေရောင်သမ်းတဲ့ထိကြော်ပြီးဆယ်ထားမောင်မောင်',
      audioPathEn: 'assets/audios/nh_8_2.m4a',
      audioPathMm: 'assets/audios/nh_8_2.m4a',
    ),
    RecipeStep(
      stepNumber: 2,
      instructionEn: 'Pound ginger, onions, garlic, coarse red chili flakes, and green powder. Sauté in oil with sliced lemongrass, little fish paste, and green chilies, Mg Mg.',
      instructionMm: 'ဂျင်းလက်နှစ်ဆစ် ကြက်နီ ကြက်ဖြူ ငရုတ်သီးအကြမ်းဖတ် အစိမ်းမှုန့်ရောထောင်းပြီး ဆီထဲထည့် စပါးလင်လက်နှစ်တစ်ပါလှီးထည့် ငပိနဲနဲထည့် ငရုတ်သီးစိမ်းလေးငါးတောင့်လှီးထည့်မောင်မောင်',
      audioPathEn: 'assets/audios/nh_8_3.m4a',
      audioPathMm: 'assets/audios/nh_8_3.m4a',
    ),
    RecipeStep(
      stepNumber: 3,
      instructionEn: 'Add fried pork, and if you like Shan coriander, add a little more, Mg Mg.',
      instructionMm: 'ဝက်သားကြော်ထားတာထည့် ရှမ်းနံနံပါမောင်မောင်စားတတ်ရင်နဲနဲထပ်ထည့်မောင်မောင်',
      audioPathEn: 'assets/audios/nh_8_4.m4a',
      audioPathMm: 'assets/audios/nh_8_4.m4a',
    ),
  ],
),
Recipe(
  id: 'r4',
  titleEn: 'Prawn & Bell Pepper Stir-fry',
  titleMm: 'ပုစွန်ပန်းငရုတ်ပွ',
  descriptionEn: 'Juicy prawns stir-fried with colorful bell peppers and tomatoes.',
  descriptionMm: 'ပုစွန်နှင့် ငရုတ်ပွ၊ ခရမ်းချဉ်သီးတို့ တွဲဖက်ချက်ပြုတ်ထားသော ဟင်းလျာ',
  imageUrl: 'assets/images/img_recipe4.png',
  ingredientsEn: [
    'Prawns (peeled)',
    'Salt, turmeric, MSG (half tsp each)',
    'Bell peppers (2)',
    'Tomatoes (2)',
    'Onions (2)',
    'Cooking oil',
    'Green chilies'
  ],
  ingredientsMm: [
    'ပုစွန် (အခွံခွါပြီး)',
    'ဆား၊ ဆနွင်း၊ အချိုမှုန့် (ဇွန်း ၁/၂ စီ)',
    'ငရုတ်ပွ (၂) လုံး',
    'ခရမ်းချဉ်သီး (၂) လုံး',
    'ကြက်သွန်နီ (၂) လုံး',
    'ဆီ',
    'ငရုတ်သီးစိမ်း'
  ],
  steps: [
    RecipeStep(
      stepNumber: 1,
      instructionEn: 'Peel prawns, marinate with salt, turmeric, and MSG. Slice bell peppers, cut 2 tomatoes into 4 pieces each, and chop 2 onions, Mg Mg.',
      instructionMm: 'ပုစွန်အခွံခွါပြီး ဆား ဆနွင်း အချိုမှုန့်လက်ဖက်ရည်ဇွန်းတစ်ဝက်ဆီနယ်ထား ငရုတ်ပွ၂လုံးရရလှီး ခရမ်းချဉ်သီးနှစ်လုံးကို လေးစိတ်ဆီစိပ် ကြက်နီ၂လုံးမောင်မောင်',
      audioPathEn: 'assets/audios/nh_8_5.m4a',
      audioPathMm: 'assets/audios/nh_8_5.m4a',
    ),
    RecipeStep(
      stepNumber: 2,
      instructionEn: 'Add oil, when hot add sliced onions. Once slightly soft, add prawns and stir until curved, Mg Mg.',
      instructionMm: 'ဆီထည့်ပြီးပူလာရင်ကြက်နီလှီးထားတာထည့် နဲနဲနွမ်းလာရင်ပုစွန်ထည့်မွှေ ပုစွန်ကွေးရင်မောင်မောင်',
      audioPathEn: 'assets/audios/nh_8_5.m4a',
      audioPathMm: 'assets/audios/nh_8_5.m4a',
    ),
    RecipeStep(
      stepNumber: 3,
      instructionEn: 'Add bell peppers, then top with green chilies, Mg Mg.',
      instructionMm: 'ငရုတ်ပွထည့်ပြီးရင် ငရုတ်သီးစိမ်းလေးအုပ်မောင်မောင်',
      audioPathEn: 'assets/audios/nh_8_5.m4a',
      audioPathMm: 'assets/audios/nh_8_5.m4a',
    ),
  ],
),
];