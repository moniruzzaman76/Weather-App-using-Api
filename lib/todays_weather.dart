import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Api/model_class.dart';

class TodayWeather extends StatefulWidget {
  const TodayWeather({Key? key, required this.weatherModel}) : super(key: key);
   final WeatherModel weatherModel;

  @override
  State<TodayWeather> createState() => _TodayWeatherState();
}

class _TodayWeatherState extends State<TodayWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
        body: Stack(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration:  const BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF4F2B94FF),
                      Color(0xFF5704C2FF),
                    ]
                  ),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 80,),
                      Column(
                        children: [
                          Text(widget.weatherModel.location!.name.toString(),style:  const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          ),
                          const SizedBox(height: 10,),
                          Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(
                              widget.weatherModel.current!.lastUpdated.toString())),style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          ),
                          Text(DateFormat.jmv().format(DateTime.parse(
                              widget.weatherModel.current!.lastUpdated.toString())),style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          ),
                         // Expanded(child: WeatherBg(weatherType: WeatherType.sunny, width: double.infinity, height: 1000,)),
                      ],
              ),
                      const SizedBox(height: 80,),
                      Row(
                        children: [
                          const SizedBox(width: 20,),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,color: Colors.white10,
                            ),
                              child: Image.network("https:${widget.weatherModel.current!.condition!.icon?? " "}",height: 90,),
                          ),
                          const SizedBox(width: 60,),
                          Text("${widget.weatherModel.current!.tempC!.round().toString()}°",
                            style: const TextStyle(fontSize: 40,color: Colors.white),),
                          const SizedBox(width: 60,),
                           Column(
                            children: [
                              Text(
                              "Max ${
                              widget.weatherModel.forecast!.forecastday!.first.day!.maxtempC.toString()}°",
                                style: const TextStyle(fontSize: 16,color: Colors.white),),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:const EdgeInsets.only(top: 2),
                                    child: Text( "Min ${
                                        widget.weatherModel.forecast!.forecastday!.first.day!.mintempC.toString()}",
                                      style: const TextStyle(fontSize: 16,color: Colors.white),),
                                  ),
                                  const Text("o",style: TextStyle(fontSize: 10,color:Colors.white ),)
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 70,),

                      Text(widget.weatherModel.current!.condition!.text.toString(),style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white
                      ),)
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
    );
  }
}
