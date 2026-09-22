import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/recipe.dart';
import '../providers/recipe_providers.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends ConsumerWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);
    final recipes = ref.watch(recipesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(lang == AppLanguage.en ? "Thel's Kitchen." : 'သဲသဲ Kitchen'),
        actions: [
          IconButton(
            icon: Text(lang == AppLanguage.en ? '🇲🇲 ' : '🇬🇧 ', style: const TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              ref.read(languageProvider.notifier).state =
                  lang == AppLanguage.en ? AppLanguage.mm : AppLanguage.en;
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.all(12),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                ref.read(selectedRecipeProvider.notifier).state = recipe;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RecipeDetailScreen()),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               
Image.asset(
  recipe.imageUrl,
  height: 200,
  width: double.infinity,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) => Container(
    height: 200,
    color: Colors.amber.shade100,
    child: const Center(child: Icon(Icons.broken_image, size: 50)),
  ),
),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(recipe.getTitle(lang), style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        //Text(recipe.getDescription(lang), maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}