import 'package:banking_app2/core/networking/api_service.dart';
import 'package:banking_app2/core/networking/chat_request.dart';
import 'package:banking_app2/core/networking/chat_response.dart';

class TogetherRepository {
  final ApiService _apiService;

  TogetherRepository(this._apiService);

  Future<ChatResponse> getChatResponse(String userMessage) async {
    final request = ChatRequest(
      model: "deepseek-ai/DeepSeek-V3",
      messages: [
        {"role": "user", "content": userMessage},
      ],
    );
    return _apiService.sendMessage(request);
  }
}

// // ✅ Test function moved **outside** the class
// Future<void> main() async {
//   final Dio dio = Dio(); // 🔹 Initialize Dio properly
//   final apiService = ApiService(dio);
//   final repository = TogetherRepository(apiService);

//   String testMessage = "Hello, AI! My name is kareem ";

//   try {
//     ChatResponse response = await repository.getChatResponse(testMessage);
//     print("Response: ${response.toString()}");
//   } catch (error) {
//     print("Error: $error");
//   }
// }

// // Call `test()` somewhere in `main()` to execute it
