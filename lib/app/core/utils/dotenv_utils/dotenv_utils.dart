import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvUtils {
  static Future<void> load(
    String environment, {
    Map<String, String>? mergeWith,
  }) async {
    await dotenv.load(
      fileName: 'env/.env.$environment',
      mergeWith: mergeWith ?? {},
    );
  }
}
