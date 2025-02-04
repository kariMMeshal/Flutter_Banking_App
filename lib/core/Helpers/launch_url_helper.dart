
import 'package:banking_app2/core/common/widgets/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlHelper(context, {required String url}) async {
  try {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnackBar(context, title: 'Invalid URL: $url');
    }
  } catch (e) {
    customSnackBar(context, title: 'Cannot launch $url');
  }
}
