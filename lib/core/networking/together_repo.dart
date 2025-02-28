import 'package:banking_app2/core/networking/api_service.dart';
import 'package:banking_app2/core/networking/chat_request.dart';
import 'package:banking_app2/core/networking/chat_response.dart';

class TogetherRepository {
  final ApiService _apiService;

  TogetherRepository(this._apiService);

  Future<ChatResponse> getChatResponse(String userMessage) async {
    final request = ChatRequest(
      contents: [
        Content(parts: [Part(text: userMessage)])
      ],
    );

    final json = request.toJson();

    final response = await _apiService.sendRequest(json);

    return ChatResponse.fromJson(response);
  }
}

