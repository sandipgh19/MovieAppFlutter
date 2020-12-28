import 'package:flutter/material.dart';

class Resource<T> {
  
  final Status status;
  final T data;
  final String message;
  final Exception error;

  const Resource({this.data, @required this.status, this.message, this.error});

  static Resource<T> loading<T>({T data}) =>
      Resource<T>(data: data, status: Status.loading);

  static Resource<T> failed<T>({Exception error, T data}) => Resource<T>(
      error: error, data: data, status: Status.failed);

  static Resource<T> success<T>({T data}) =>
      Resource<T>(data: data, status: Status.success);
  
}

enum Status{
  loading, success, failed
}