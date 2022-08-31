import 'package:flutter/foundation.dart';

void printException(error, stackStrace) {
  debugPrint(error.toString());
  debugPrintStack(stackTrace: stackStrace);
}
