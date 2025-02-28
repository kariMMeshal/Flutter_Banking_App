import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/plan/data/plan_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String description;
  final String? backgroundImage;

  const PlanCard({
    super.key,
    required this.title,
    required this.description,
    this.backgroundImage,
  });

  void showPlanDetails(BuildContext context) {
    final planDetails = getPlanDetails(title);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.4,
          maxChildSize: 0.8,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: ListView(
                controller: scrollController,
                children: [
                  Text(
                    planDetails["subtitle"]!,
                    style: Styles.ktextStyle24,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    planDetails["details"]!,
                    style: Styles.ktextStyle16,
                  ),
                  const SizedBox(height: 20),
                  _buildDetailRow("💰 Savings", planDetails["saving"]!),
                  _buildDetailRow("📈 Investment", planDetails["investment"]!),
                  _buildDetailRow("🎭 Enjoyment", planDetails["spoiled"]!),
                  _buildDetailRow("📌 Needs", planDetails["needs"]!),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showCongratulationsPopup(context, title);
                    },
                    child: const Text("Start Now!"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showCongratulationsPopup(BuildContext context, String title) {
    String firstWord = title.split(" ").first;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "🎉 Congratulations on Starting!",
            style: Styles.ktextStyle24,
          ),
          content: Text(
              "You've started the $firstWord plan! Stay committed and make it work!",
              style: Styles.ktextStyle18),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  /// Helper method to create a financial detail row
  Widget _buildDetailRow(String label, String percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Text(percentage,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPlanDetails(context),
      child: Stack(
        children: [
          /// Background Image Container
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.85,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(backgroundImage!), // Background Image
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 20,
            left: 20,
            child: SafeArea(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black.withValues(alpha: 0.6),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Bottom Content
          Positioned(
            bottom: 20,
            left: 20,
            right: 0,
            child: Text("Tap to view details",
                style: Styles.ktextStyle18.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
