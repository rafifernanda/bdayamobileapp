import 'package:thesisproject/Maps/models/place.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert' as convert;

//class PlacesService {
//  final key = 'AIzaSyBkOWeySYL1LLnosPnsvpfRgq34dDCXqns';
//
//  Future<List<Place>> getPlaces(double lat, double lng, BitmapDescriptor icon) async {
//    var response = await
////    http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=parking&rankby=distance&key=$key');
//    http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&name=budaya&rankby=distance&key=$key');
//    var json = convert.jsonDecode(response.body);
//    var jsonResults = json['results'] as List;
//    return jsonResults.map((place) => Place.fromJson(place,icon)).toList();
//  }
//
//}

class PlacesService {
  final key = 'AIzaSyBkOWeySYL1LLnosPnsvpfRgq34dDCXqns';

  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&name=tempat+kebudayaan+terdekat&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }

}