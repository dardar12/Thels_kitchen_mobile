import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/recipe.dart';
import '../providers/recipe_providers.dart';
import '../widgets/voice_audio_mini_player.dart';

class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.watch(selectedRecipeProvider);
    final lang = ref.watch(languageProvider);
    final audioLang = ref.watch(audioLanguageProvider);

    if (recipe == null) return const Scaffold(body: Center(child: Text('No recipe selected')));

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.getTitle(lang)),
        actions: [
         
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
Image.asset(
  recipe.imageUrl,
  height: 220,
  width: double.infinity,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) => Container(
    height: 220,
    color: Colors.amber.shade100,
    child: const Center(child: Icon(Icons.broken_image, size: 50)),
  ),
),
            const SizedBox(height: 16),
            Text(recipe.getDescription(lang), style: Theme.of(context).textTheme.bodyLarge),
            const Divider(height: 32),
            Text(lang == AppLanguage.en ? 'Ingredients' : 'ပါဝင်ပစ္စည်းများ', style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: 8),
            ... (lang == AppLanguage.en ? recipe.ingredientsEn : recipe.ingredientsMm)
                .map((i) => Padding(padding: const EdgeInsets.symmetric(vertical: 2), child: Text('• $i'))),
            const Divider(height: 32),
            Text(lang == AppLanguage.en ? 'Cooking Steps & Thel Voice ' : 'ချက်ပြုတ်ရန်နှင့် သဲသဲအသံfile', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            ...recipe.steps.map((step) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(child: Text('${step.stepNumber}')),
                title: Text(lang == AppLanguage.en ? step.instructionEn : step.instructionMm),
                subtitle: VoiceAudioMiniPlayer(
                  assetPath: audioLang == AppLanguage.en ? step.audioPathEn : step.audioPathMm,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}