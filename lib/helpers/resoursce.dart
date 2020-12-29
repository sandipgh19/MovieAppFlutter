import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app_flutter/helpers/error_mapper.dart';
import 'package:movie_app_flutter/networking/custom_exception.dart';

@immutable
class Resource<T> {
  final Status status;
  final T data;
  final String message;
  final CustomException error;

  const Resource({this.data, @required this.status, this.message, this.error});

  static Resource<T> loading<T>({T data}) =>
      Resource<T>(data: data, status: Status.LOADING);

  static Resource<T> failed<T>({Exception error, T data}) => Resource<T>(
      error: ErrorMapper.from(error), data: data, status: Status.ERROR);

  static Resource<T> success<T>({T data}) =>
      Resource<T>(data: data, status: Status.SUCCESS);

  static FutureOr<Resource<T>> asFuture<T>(FutureOr<T> Function() req) async {
    try {
      final res = await req();
      return success<T>(data: res);
    } on Exception catch (e) {
      return Future.error(failed(error: ErrorMapper.from(e), data: null));
    }
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Resource<T> &&
      o.status == status &&
      o.data == data &&
      o.message == message &&
      o.error == error;
  }

  @override
  int get hashCode {
    return status.hashCode ^
      data.hashCode ^
      message.hashCode ^
      error.hashCode;
  }
}

enum Status{
  LOADING, SUCCESS, ERROR
}