import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Api/model_class.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key, required this.weatherModel}) : super(key: key);
   final WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 80,),
                    Column(
                      children: [
                        Text(weatherModel!.location!.name.toString(),style:  const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        ),
                        Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(
                            weatherModel!.current!.lastUpdated.toString())),style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        ),

                        //Expanded(child: WeatherBg(weatherType: WeatherType.sunny, width: double.infinity, height: 1000,)),
                    ],
              ),
                    const SizedBox(height: 80,),
                    Row(
                      children: [
                        const SizedBox(height: 30,),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,color: Colors.white10,
                          ),
                            child: Image.network("https:${weatherModel!.current!.condition!.icon?? " "}",height: 90,),
                        ),
                        const SizedBox(width: 60,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:const EdgeInsets.only(top: 2),
                              child: Text(weatherModel!.current!.tempC!.round().toString(),
                                style: const TextStyle(fontSize: 40,color: Colors.white),),
                            ),
                            const Text("o",style: TextStyle(fontSize: 15,color:Colors.white ),)
                          ],
                        ),
                        const SizedBox(width: 60,),
                         Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:const EdgeInsets.only(top: 2),
                                  child: Text(
                                "Max ${
                                  weatherModel!.forecast!.forecastday!.first.day!.maxtempC.toString()}",
                                    style: const TextStyle(fontSize: 16,color: Colors.white),),
                                ),
                                const Text("o",style: TextStyle(fontSize: 10,color:Colors.white ),)
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:const EdgeInsets.only(top: 2),
                                  child: Text( "Min ${
                                      weatherModel!.forecast!.forecastday!.first.day!.mintempC.toString()}",
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

                    Text(weatherModel!.current!.condition!.text.toString(),style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white
                    ),)
                  ],
                ),
            )
            ),
          ],
        ),
    );
  }
}
