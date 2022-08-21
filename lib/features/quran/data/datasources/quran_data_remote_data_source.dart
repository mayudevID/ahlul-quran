import 'dart:convert';

import 'package:alquran_mobile_apps/core/error/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/quran_data_model.dart';

abstract class QuranDataRemoteDataSource {
  Future<List<QuranDataModel>> getQuranData();
}

class QuranDataRemoteDataSourceImpl implements QuranDataRemoteDataSource {
  QuranDataRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<QuranDataModel>> getQuranData() async {
    var response =
        await dio.get("https://al-quran-8d642.firebaseio.com/data.json");

    if (response.statusCode == 200) {
      List<QuranDataModel> listData = [];

      for (var element in response.data) {
        listData.add(QuranDataModel.fromJson(element));
      }

      return listData;
    } else {
      throw ServerException();
    }
  }
}
