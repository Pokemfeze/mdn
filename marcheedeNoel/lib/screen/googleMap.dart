import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;
import 'package:marcheedenoel/screen/post_screen.dart';
import 'package:marcheedenoel/widget/home_app_bar.dart';
import 'package:marcheedenoel/widget/homebottombar.dart';

import '../services/googlePossition.dart';
class GoogleMapscreen extends StatefulWidget {
  const GoogleMapscreen({super.key});

  @override
  State<GoogleMapscreen> createState() => _GoogleMapscreenState();
}

class _GoogleMapscreenState extends State<GoogleMapscreen> {
  @override

  Future<void> _getUserLocationAndDrawRoute() async {
    try {
      // Récupérer la position actuelle de l'utilisateur
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Récupérer les coordonnées actuelles de l'utilisateur
      LatLng userLatLng = LatLng(position.latitude, position.longitude);

      // Définir la position de destination (exemple: Paris)
      LatLng destinationLatLng = LatLng(4.060269, 9.725321);

      // Créer un objet Direction avec votre clé d'API Google Maps
      directions.GoogleMapsDirections directionsApi = directions.GoogleMapsDirections(apiKey: "VOTRE_CLE_API_GOOGLE_MAPS");

      // Effectuer une requête de direction pour récupérer l'itinéraire
      directions.DirectionsResponse response = await directionsApi.directionsWithLocation(
          '${userLatLng.latitude},${userLatLng.longitude}' as directions.Location, // Coordonnées de départ
          '${destinationLatLng.latitude},${destinationLatLng.longitude}' as directions.Location // Coordonnées de destination
      );

      // Vérifier si la requête a réussi et obtenir le chemin
      if (response.status == "OK") {
        directions.Route route = response.routes[0];
        print('Durée du trajet : ${route.legs[0].duration.text}');
        print('Distance du trajet : ${route.legs[0].distance.text}');

        // Tracer l'itinéraire sur la carte
        List<LatLng> routeCoordinates = [];
        for (var step in route.legs[0].steps) {
          routeCoordinates.add(LatLng(
              step.startLocation.lat, step.startLocation.lng));
          routeCoordinates.add(
              LatLng(step.endLocation.lat, step.endLocation.lng));
        }

        // Afficher la carte avec l'itinéraire et la position actuelle de l'utilisateur
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: userLatLng,
            zoom: 12,
          ),
          markers: Set<Marker>.from([
            Marker(
              markerId: MarkerId('userLocation'),
              position: userLatLng,
              infoWindow: InfoWindow(
                title: 'Votre position',
              ),
            ),
            Marker(
              markerId: MarkerId('destinationLocation'),
              position: destinationLatLng,
              infoWindow: InfoWindow(
                title: 'Destination',
              ),
            ),
          ]),
          polylines: Set<Polyline>.from([
            Polyline(
              polylineId: PolylineId('route'),
              points: routeCoordinates,
              color: Colors.blue,
              width: 4,
            ),
          ]),
        );
      } else {
        print('Erreur de récupération du trajet.');
      }
    } catch (e) {
      print(e);
    }
  }

  String? _mapStyle;
  void initState(){
    super.initState();

    rootBundle.loadString('assets/map_style.text').then((String){
      _mapStyle=String;

    });
  }

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(CamerounDoualaLatitude, CamerounDoualaLongitude),


    zoom: 14.4746,
  );

  GoogleMapController? myMapController;
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Localisation',style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 15,),),
          centerTitle: true,
          elevation: 2,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),


            )
          ],
        ) ,

        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),

              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: 500,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],

                ),
                child:Stack(
                  children: [
                    GoogleMap(
                      zoomControlsEnabled: false,

                      onMapCreated: (GoogleMapController controller){

                        myMapController=controller;
                        myMapController!.setMapStyle(_mapStyle);
                      },initialCameraPosition: _kGooglePlex,
                    ),
                    builCurrentLocation(),

                  ],
                ),

              ),



            ],
          ),
        ),

      );
  }




  Widget  builCurrentLocation(){
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8,right: 8),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.indigo,
          child: InkWell(
            onTap:(){
              _getUserLocationAndDrawRoute();
            },
            child: Icon(Icons.my_location,color: Colors.white,
            ),
          ),),

      ),

    );
  }
  Widget builTextField(){
    return    Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.only(left: 10),
        // height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),

      ),
    );


  }

  Widget MyDrawerList1(){
    return Container();
  }
}

