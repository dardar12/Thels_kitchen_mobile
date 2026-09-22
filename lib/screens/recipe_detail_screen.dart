
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/recipe.dart';
import '../providers/recipe_providers.dart';
import '../widgets/voice_audio_mini_player.dart';

class RecipeDetailScreen extends ConsumerStatefulWidget {
  const RecipeDetailScreen({super.key});

  @override
  ConsumerState<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends ConsumerState<RecipeDetailScreen> {
  bool isInstructionTab = true;

  @override
  Widget build(BuildContext context) {
    final recipe = ref.watch(selectedRecipeProvider);
    final lang = ref.watch(languageProvider);
    final audioLang = ref.watch(audioLanguageProvider);
    final theme = Theme.of(context);

    const accentAmber = Color(0xFFFFB300);

    if (recipe == null) {
      return const Scaffold(
        body: Center(child: Text('No recipe selected')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Image.asset(
                  recipe.imageUrl,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 320,
                    color: Colors.amber.shade100,
                    child: const Center(child: Icon(Icons.broken_image, size: 50)),
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.transparent,
                          Colors.black.withOpacity(0.55),
                        ],
                      ),
                    ),
                  ),
                ),
               SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.3),
                          foregroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios, size: 20),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
 SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => isInstructionTab = true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: isInstructionTab ? accentAmber : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              lang == AppLanguage.en ? "Thel's Instruction" : 'သဲသဲလေးရဲ့ချက်နည်း',
                              style: TextStyle(
                                color: isInstructionTab ? Colors.black : Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                     
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.language_rounded, size: 20),
                          onPressed: () {
                            ref.read(languageProvider.notifier).state =
                                lang == AppLanguage.en ? AppLanguage.mm : AppLanguage.en;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
 ListView.builder(
                      itemCount: recipe.steps.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final step = recipe.steps[index];
                        final isLast = index == recipe.steps.length - 1;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Column(
                              children: [
                                Container(
                                  width: 14,
                                  height: 14,
                                  decoration: const BoxDecoration(
                                    color: accentAmber,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                if (!isLast)
                                  Container(
                                    width: 2.5,
                                    height: 110,
                                    color: accentAmber.withOpacity(0.6),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Step ${step.stepNumber}',
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      lang == AppLanguage.en ? step.instructionEn : step.instructionMm,
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        height: 1.5,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    VoiceAudioMiniPlayer(
                                      assetPath: audioLang == AppLanguage.en
                                          ? step.audioPathEn
                                          : step.audioPathMm,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}