import 'package:banking_app2/core/common/widgets/custom_button.dart';
import 'package:banking_app2/core/common/widgets/custom_loading_indecator.dart';
import 'package:banking_app2/core/networking/api_service.dart';
import 'package:banking_app2/core/networking/together_repo.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Home/presentation/views/home_view.dart';
import 'package:banking_app2/features/plan/data/customized_plan_quistions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:go_router/go_router.dart';

class CustomizedPlanScreen extends StatefulWidget {
  const CustomizedPlanScreen({super.key});
  static const String route = '/aiChatScreen';

  @override
  CustomizedPlanScreenState createState() => CustomizedPlanScreenState();
}

class CustomizedPlanScreenState extends State<CustomizedPlanScreen> {
  final Dio dio = Dio();
  late TogetherRepository repository;
  int _progress = 0;
  int _currentQuestionIndex = 0;
  Map<String, int> planDetails = {
    "saving": 0,
    "investment": 0,
    "spoiled": 0,
    "needs": 0
  };

  @override
  void initState() {
    super.initState();
    final apiService = ApiService(dio);
    repository = TogetherRepository(apiService);
    // print("Questions List: $questions");
  }

  void _answerQuestion(int weight) {
    if (_currentQuestionIndex < questions.length) {
      _updatePlan(weight);
      setState(() {
        _progress =
            ((_currentQuestionIndex + 1) / questions.length * 100).toInt();
        _currentQuestionIndex++;
      });

      if (_currentQuestionIndex == questions.length) {
        Future.delayed(const Duration(milliseconds: 200), _showPlanPopup);
      }
    }
  }

  void _updatePlan(int weight) {
    setState(() {
      List<String> categories = ["saving", "investment", "spoiled", "needs"];
      String primaryCategory =
          categories[_currentQuestionIndex % categories.length];

      planDetails[primaryCategory] = planDetails[primaryCategory]! + weight;

      int totalPoints = planDetails.values.reduce((sum, value) => sum + value);

      if (totalPoints > 0) {
        planDetails.forEach((key, value) {
          planDetails[key] = ((value * 100) / totalPoints).round();
        });
      }
    });
  }

  void _showPlanPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Personalized Financial Plan 🎯"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDetailRow("💰 Savings", "${planDetails["saving"]}%"),
            _buildDetailRow("📈 Investment", "${planDetails["investment"]}%"),
            _buildDetailRow("🎭 Enjoyment", "${planDetails["spoiled"]}%"),
            _buildDetailRow("📌 Needs", "${planDetails["needs"]}%"),
            const SizedBox(height: 20),
            const Text("🔹 This plan is tailored based on your choices."),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Accept Plan", style: Styles.ktextStyle16),
            onPressed: () {
              Navigator.pop(context);
              GoRouter.of(context).go(HomeView.route);
            },
          ),
          TextButton(
            child: const Text("Not now ", style: Styles.ktextStyle16),
            onPressed: () {
              Navigator.pop(context);
              GoRouter.of(context).go(HomeView.route);
            },
          )
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Styles.ktextStyle18),
        Text(value, style: Styles.ktextStyle16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Financial Assistant", style: Styles.ktextStyle28),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: _progress / 100,
              minHeight: 12,
              backgroundColor: Colors.grey.shade400,
              valueColor: const AlwaysStoppedAnimation<Color>(kBlue),
            ),
            const SizedBox(height: 20),
            _currentQuestionIndex < questions.length
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      spacing: 20,
                      children: [
                        Text(
                          questions[_currentQuestionIndex]["question"],
                          style: Styles.ktextStyle20,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ...List.generate(
                          questions[_currentQuestionIndex]["options"].length,
                          (index) => CustomButton(
                            title: questions[_currentQuestionIndex]["options"]
                                [index],
                            onPressed: () => _answerQuestion(
                                questions[_currentQuestionIndex]["weights"]
                                    [index]),
                            backgroundColor: kBlue,
                            width: MediaQuery.of(context).size.width * .8,
                          ),
                        )
                      ],
                    ),
                  )
                : const Center(child: CustomLoadingIndicator()),
          ],
        ),
      ),
    );
  }
}
