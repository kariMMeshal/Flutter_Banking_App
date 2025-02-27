import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/custom_button.dart';
import 'package:banking_app2/core/common/widgets/custom_snack_bar.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceiptTextExtractor extends StatefulWidget {
  const ReceiptTextExtractor({super.key});
  static const String route = '/receiptTextExtractor';

  @override
  ReceiptTextExtractorState createState() => ReceiptTextExtractorState();
}

class ReceiptTextExtractorState extends State<ReceiptTextExtractor> {
  final ImagePicker _picker = ImagePicker();
  String extractedText = '';
  List<Map<String, String>> parsedItems = [];

  Future<void> pickAndExtractText() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    await textRecognizer.close();

    setState(() {
      extractedText = recognizedText.text;
      parsedItems = _parseReceipt(extractedText);
      // Debug prints:
      print("Extracted text: $extractedText");
      print("Parsed items count: ${parsedItems.length}");
    });
  }

  // Parse the receipt text to extract items with a product title and price.
  List<Map<String, String>> _parseReceipt(String receiptText) {
    List<Map<String, String>> items = [];
    final lines = receiptText.split('\n');
    // Updated regex to match prices like "12", "12.3", or "12.34"
    final priceRegex = RegExp(r'(\d+(?:\.\d{1,2})?)');

    for (var line in lines) {
      line = line.trim();
      if (line.isEmpty) continue;
      final match = priceRegex.firstMatch(line);
      if (match != null) {
        final price = match.group(0)!;
        // Assume the product title is everything before the price.
        final product = line.substring(0, match.start).trim();
        if (product.isNotEmpty) {
          items.add({'product': product, 'price': price});
        }
      }
    }
    return items;
  }

  void _acceptReceipt() {
    double total = 0;
    for (var item in parsedItems) {
      final price = double.tryParse(item['price'] ?? '0') ?? 0.0;
      total += price;
    }

    context.read<WalletCubit>().decreaseAmount(value: total);

    customSnackBar(context,
        title: 'Receipt accepted. \$${total.toStringAsFixed(2)}');

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Extract Receipt Text')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomButton(
              title: "Pick Receipt Image",
              onPressed: pickAndExtractText,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 20),
            // Debug: Show number of parsed items.
            Text("Parsed Items: ${parsedItems.length}",
                style: Styles.ktextStyle18),
            Expanded(
              child: parsedItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: parsedItems.length,
                      itemBuilder: (context, index) {
                        final item = parsedItems[index];
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 100.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${item['product']} : ",
                                  style: Styles.ktextStyle18),
                              Text(item['price'] ?? '',
                                  style: Styles.ktextStyle14),
                            ],
                          ),
                        );
                      },
                    )
                  : SingleChildScrollView(
                      child: Text(
                        extractedText.isNotEmpty
                            ? extractedText
                            : 'No text extracted yet.',
                        style: Styles.ktextStyle18,
                      ),
                    ),
            ),
            // Only show the Accept Receipt button if items were parsed.
            if (parsedItems.isNotEmpty)
              CustomButton(
                title: "Accept Receipt",
                onPressed: _acceptReceipt,
                width: MediaQuery.of(context).size.width,
              ),
          ],
        ),
      ),
    );
  }
}
