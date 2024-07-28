String listToString(dynamic data) {
  String message = '';

  if (data is List<dynamic>) {
    //message = data.map((item) => item.toString()).join(', ');
    message = (data as List<dynamic>).join(" ");
  } else if (data is String) {
    message = data;
  }

  return message;
}
