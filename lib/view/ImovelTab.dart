import 'dart:async';

import 'package:app_tcc/model/ImoveisData.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ImovelTab extends StatefulWidget {
  ImoveisData imovelData;

  ImovelTab(this.imovelData);

  @override
  _ImovelTabState createState() => _ImovelTabState();
}

class _ImovelTabState extends State<ImovelTab> {
  var _scroolViewController = ScrollController();
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(-20.95896495, -48.4846884);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  final Set<Marker> _markers = {
    Marker(
        markerId: MarkerId("0101011"),
        position: LatLng(-20.95896495, -48.4846884),
        infoWindow: InfoWindow(
          title: 'Aqui está a casa',
        ),
        icon: BitmapDescriptor.defaultMarker
    ),
  };

  Geolocator _geolocator;

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) { print('status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationAlways).then((status) { print('always status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationWhenInUse)..then((status) { print('whenInUse status: $status'); });
  }

  @override
  void initState() {
    _geolocator = Geolocator();

    checkPermission();
    super.initState();
  }

  _abreMaps(String lat, String long)async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var minhaLat = position.latitude.toString();
    var minhalong = position.longitude.toString();

    final url = 'http://www.google.com.br/maps/dir/$minhaLat,$minhalong/$lat,$long';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scroolViewController,
        headerSliverBuilder: (context, innerBoxIsCrolled){
          return <Widget>[
            SliverAppBar(
              actions: <Widget>[],
              elevation: 0,
              backgroundColor: Color(0xfff2ede4),
              floating: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: CarouselSlider(
                  autoPlay: true,
                  viewportFraction: 1.0,
                  aspectRatio: MediaQuery.of(context).size.aspectRatio,
                  items: widget.imovelData.fotos.map<Widget>(
                        (url) {
                      return Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                )
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text(widget.imovelData.tipo, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, ),),
                subtitle: Text(widget.imovelData.tipoVenda, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, ),),
                trailing: Text("R\$ 450,00"),
              ),
              Divider(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                child: Text("Detalhes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: <Widget>[
                    meusChips("2 Suites"),
                    meusChips("Cozinha"),
                    meusChips("Banheiro"),
                    meusChips("Sala de estar"),
                    meusChips("Copa"),
                    meusChips("Garegem"),

                  ],
                ),
              ),
              Divider(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Localização", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                    IconButton(
                      onPressed: (){_abreMaps("${-20.95896495}", "${-48.4846884}");},
                      icon: Icon(Icons.directions),
                    )
                  ],
                )
              ),
              Container(
                height: 300,
                child: GoogleMap(
                  markers: _markers,
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 17,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                child: Text("Anunciante", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
              ),
              ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    maxRadius: 25,
                    child: Center(
                      child: Icon(Icons.person, color: Colors.white,),
                    ),
                  ),
                  title: Text("Imobiliaria Nossa Casa"),
                  subtitle: Text("(17) 91234-5678"),
                  trailing: Icon(Icons.call, color: Colors.green,)
              ),
            ],
          ),
        )
      ),
      backgroundColor:  Color(0xfff2ede4),
    );
  }

  Widget meusChips(String text){
    return Chip(
      label: Text(text, style: TextStyle(color: Colors.white),),
      backgroundColor: Color(0xff195073),
    );
  }
}
