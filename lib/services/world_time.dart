import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  String location;//location name for the UI
  String time;//the time in that location
  String flag;//url to an asset flag icon
  String url;//locatuon url for api endpoints

  WorldTime({ this.location,this.flag,this.url});

  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset =data['utc_offset'].substring(1,3);

//    print(datetime);
//    print(offset);

      //create a date time Object
      DateTime now = DateTime.parse(datetime);
      now=now.add(Duration(hours:int.parse(offset)));

      time= now.toString();
    }catch(e){
      print('Caught Error :$e');
      time = 'Could not get the time ';
    }
  }

}