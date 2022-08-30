import 'package:flutter/foundation.dart';

void printException(error, stackStrace) {
  debugPrint(error);
  debugPrintStack(stackTrace: stackStrace);
}
