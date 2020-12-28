import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app_flutter/networking/Repsonse.dart';

class NetworkBoundResource<ResultType, RequestType> {

  StreamController<Resource<ResultType>> _result;

  Stream<Resource<ResultType>> asStream({
    @required Stream<ResultType> loadFromDb(),
    @required bool shouldFetch(ResultType data),
    @required Future<RequestType> createCall(),
    @required ResultType processResponse(RequestType result),
    @required Future saveCallResult(RequestType item),
  }) {

    _result = StreamController<Resource<ResultType>>();

    print("Call loading...");

    _result.sink.add(Resource.loading());

    _result.addStream(loadFromDb().transform(StreamTransformer<ResultType,Resource<ResultType>>.fromHandlers(
      
          handleData: (event, sink) async{
            
            if(shouldFetch(event)){
              
              print("Fetch data and call loading");
              
              sink.add(Resource.loading(data: event));
              
              try{
                var result = await _fetchFromNetwork(createCall, saveCallResult);
                print("Fetching success");
                await saveCallResult(result);
                sink.add(Resource.success(data: event));
              }on Exception catch(e){
                print("Fetching failed");
                sink.addError(Resource.failed(data: null, error: e));
              }
              
            }else {
              print("Fetching data its not necessary");
              sink.add(Resource.success(data: event));
            }
          }
    )));

    return _result.stream;
  }

  Future<RequestType> _fetchFromNetwork(
    Future<RequestType> Function() createCall,
    Future processResponse(RequestType result)
  ) async {
    
    return await createCall().then((value) async {
      return processResponse(value);
    });
    
  }
}