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
              primary: const Color(0xFFFFB300),
              onPrimary: Colors.black,
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
   
    const unlockImagePath = 'assets/images/img_validation_screen.png'; 

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
               Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  unlockImagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: accentAmber.withOpacity(0.15),
                    child: const Center(
                      child: Icon(Icons.favorite_rounded, size: 48, color: Color(0xFFE53935)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              
              const Text(
                'Unlock Thel\'s Kitchen',
                style: TextStyle(
                  fontSize: 26, 
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter our special anni date, Mg Mg 🤍',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.4),
              ),
              const SizedBox(height: 40),

               GestureDetector(
                onTap: _pickDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: errorMessage.isNotEmpty ? Colors.red.shade300 : Colors.grey.shade300,
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: accentAmber.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.calendar_month_rounded, color: accentAmber, size: 20),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        selectedDate == null
                            ? 'Tap to select our anni date'
                            : '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: selectedDate == null ? FontWeight.w500 : FontWeight.bold,
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
                const SizedBox(height: 14),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],

              const SizedBox(height: 40),

              // Unlock Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: accentAmber,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  onPressed: _verifyDate,
                  child: const Text(
                    'Unlock & Cook 🍳',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}