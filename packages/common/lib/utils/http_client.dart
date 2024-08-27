import 'package:common/common.dart';

class HttpClientImpl extends HttpClient {
  HttpClientImpl({required this.environment})
      : super(clientConfig: environment.config);

  final Environment environment;

  /// Headers with api token
  @override
  Map<String, String>? get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${environment.apiToken}',
      };

  @override
  Future<T> decodeData<T>(dynamic data, {Type t = Map<String, dynamic>}) async {
    final result = data is String
        ? data.jsonOrString
        : data is Map<dynamic, dynamic>
            ? data.map((key, value) => MapEntry(key.toString(), value))
            : data;
    return $cast(result) ??
        (throw const NoDataException().copyWith(message: '$result'));
  }

  @override
  String? decodeErrorMessage(dynamic data, int statusCode) {
    if (data is String && data.isNotBlank) return data;

    final message = super.decodeErrorMessage(data, statusCode);
    if (message != null) return message;

    return '$statusCode\nSomething went wrong, please try again later.';
  }
}
