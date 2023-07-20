import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:weather/Api/urls.dart';
import 'model_class.dart';

class ApiService{
  Future<WeatherModel> getWeatherData(String searchText)async{
    String url = "$baseUrl&q=$searchText&day=7";

    try{
      Response response = await get(Uri.parse(url));
      log(response.body);
      if(response.statusCode == 200){
        Map<String,dynamic> json = jsonDecode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(json);
        return weatherModel;
      }else{
        throw("No data Found");
      }
    }catch(e){
      throw(e.toString());
    }

  }
}