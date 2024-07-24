
class DataHelper {
  static T parseJson<T>(dynamic json, T Function(Map<String, dynamic>) fromJson) {
    if (json is Map<String, dynamic>) {
      return fromJson(json);
    } else {
      throw FormatException("Unexpected JSON format");
    }
  }

  static List<T> parseJsonList<T>(dynamic jsonList, T Function(Map<String, dynamic>) fromJson) {
    if (jsonList is List) {
      return jsonList.map((e) => fromJson(e)).toList();
    } else {
      throw FormatException("Unexpected JSON format - expected List");
    }
  }

  static int? parseInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else {
      return null;
    }
  }

  static double? parseDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else {
      return null;
    }
  }

  static String? parseString(dynamic value) {
    if (value is String) {
      return value;
    } else {
      return null;
    }
  }

  static bool? parseBool(dynamic value) {
    if (value is bool) {
      return value;
    } else {
      return null;
    }
  }
}
