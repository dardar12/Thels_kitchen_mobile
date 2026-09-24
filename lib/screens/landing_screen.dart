import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thels_kitchen/screens/anniversary_unlock_screen.dart';
import '../models/recipe.dart';
import '../providers/recipe_providers.dart';


class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const heroImagePath = 'assets/images/img_validation_screen.png';

    final lang = ref.watch(languageProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Text(
              lang == AppLanguage.en ? '🇲🇲 ' : '🇬🇧 ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              ref.read(languageProvider.notifier).state =
                  lang == AppLanguage.en ? AppLanguage.mm : AppLanguage.en;
            },
          ),
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  heroImagePath,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 320,
                    color: Colors.amber.shade100,
                    child: const Center(child: Icon(Icons.broken_image, size: 50)),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Thel Thel Lyy's Kitchen.",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                lang == AppLanguage.en
                    ? 'This app is made for you by Thel Thel, Mg Mg. Check out the recipes, there are audio files too, hehe 😂! Thel carefully took notes and wrote this just for my sweet heart.'
                    : 'ဒီ app က မောင်မောင့်အတွက် သဲသဲရေးထားပေးတာကွာ။ မောင်မောင် ဟင်းချက်နည်းတွေ ကြည့်ကြည့်။ သဲသဲ audio file လဲပါတယ်မောင်မောင် ။ ဟဲဟဲ 😂 သဲသဲသေချာ note ထုတ်ပြီး ချစ်ဆုံးလေးအတွက် ရေးထားတာ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isDark ? Colors.white : Colors.black,
                      height: 1.5,
                    ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // Changed to AnniversaryUnlockScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AnniversaryUnlockScreen(),
                      ),
                    );
                  },
                  child: Text(
                    lang == AppLanguage.en ? 'Get Started' : 'စတင်ရန်',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}