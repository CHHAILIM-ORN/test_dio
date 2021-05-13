import 'dart:collection';

import 'package:flutter/material.dart';

class Api {
  bool isloading;
  dynamic responseJson;
  int statusCode;
  HashMap<String, String> hashMap;
  Api({
    @required this.isloading,
    @required this.responseJson,
    @required this.statusCode,
    this.hashMap,
  });
}
