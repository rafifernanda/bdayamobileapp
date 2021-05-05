import 'package:flutter/material.dart';
import 'package:thesisproject/Pages/Home.dart';
import 'package:thesisproject/Pages/News/TestNews.dart';
import 'package:thesisproject/Pages/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:thesisproject/Maps/models/place.dart';
import 'package:thesisproject/Maps/screens/search.dart';
import 'package:thesisproject/Maps/services/geolocator_service.dart';
import 'package:thesisproject/Maps/services/place_service.dart';
import 'package:thesisproject/Maps/models/place.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thesisproject/Search/Search_Screen.dart';
import 'package:thesisproject/Test/Detail.dart';

void main() =>
    runApp(MaterialApp(home: SplashScreen(), title: 'B-Daya',),
    );



class MyApp extends StatelessWidget {
    final locatorService = GeoLocatorService();
    final placesService = PlacesService();

    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: [
                FutureProvider(create: (context) => locatorService.getLocation()),
                ProxyProvider<Position,Future<List<Place>>>(
                    update: (context,position,places){
                        return (position !=null) ? placesService.getPlaces(position.latitude, position.longitude) :null;
                    },
                )
            ],
            child: MaterialApp(
                title: 'B-Daya',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                ),
                home: NearbyMap(),
            ),
        );
    }
}