import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';

class AnniversaryUnlockScreen extends StatefulWidget {
  const AnniversaryUnlockScreen({super.key});

  @override
  State<AnniversaryUnlockScreen> createState() => _AnniversaryUnlockScreenState();
}

class _AnniversaryUnlockScreenState extends State<AnniversaryUnlockScreen> {
  final DateTime targetDate = DateTime(2026, 4, 22);
  
  DateTime? selectedDate;
  String errorMessage = '';

  void _verifyDate() {
    if (selectedDate == null) {
      setState(() => errorMessage = 'Pick our special day first, Mg Mg! 📅');
      return;
    }

    final isMatch = selectedDate!.year == targetDate.year &&
                    selectedDate!.month == targetDate.month &&
                    selectedDate!.day == targetDate.day;

    if (isMatch) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RecipeListScreen()),
      );
    } else {
      setState(() {
        errorMessage = 'Wrong date! Do you want me to be mad, Mg Mg? 🩵';
      });
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2023, 1, 1),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        errorMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const accentAmber = Color(0xFFFFB300);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: accentAmber.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.favorite_rounded, size: 48, color: Color(0xFFE53935)),
              ),
              const SizedBox(height: 24),
              const Text(
                'Unlock Thel\'s Kitchen.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter our special anni date, Mg Mg 🤍',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 36),

              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: errorMessage.isNotEmpty ? Colors.red.shade300 : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                     Text(
                        selectedDate == null
                            ? 'Tap to select our anni date'
                            : '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: selectedDate == null ? FontWeight.normal : FontWeight.bold,
                          color: selectedDate == null ? Colors.grey.shade600 : Colors.black87,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down_rounded, color: Colors.grey),
                    ],
                  ),
                ),
              ),

              if (errorMessage.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: accentAmber,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: _verifyDate,
                  child: const Text(
                    'Unlock & Cook 🍳',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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