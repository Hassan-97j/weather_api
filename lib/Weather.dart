import 'package:flutter/material.dart';
import 'package:weather_api/services.dart';
import 'package:weather_api/themes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<MyData> post;
  @override
  void initState() {
    super.initState();
    post = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildWeatherUI(snapshot.data);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            }));
  }

  Widget _buildWeatherUI(MyData data) {
    String _degreeSymbol = '°';
    String _temperature = data.main.temp.toString();
    String _lowest = (data.main.minTemp - 3).toString();
    String _highest = (data.main.maxTemp + 4).toString();
    String _feelsLike = data.main.feelsLike.toInt().toString();
    String _desc = data.weather.first.toString();

    return Container(
      height: MediaQuery.of(context).size.height,

      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Untitled.jpg'), fit: BoxFit.cover
            ),
      ),
      constraints: BoxConstraints.expand(),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Karachi, PK',
               style:  setTextStyle(size: 22)
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Color(0xFF343334).withOpacity(0.75),
                    ),
                    onPressed: () {
                      setState(() {
                        post = fetchData();
                      });
                    })),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(_lowest,
                  style: setTextStyle(size: 18,)),
              Text(_degreeSymbol,
                  style: setTextStyle(size: 18,)),
              Icon(
                Icons.arrow_downward,
                size: 18,
                color: Colors.blueGrey,
              ),
              Padding(padding: EdgeInsets.only(left: 16)),
              Text(_highest,
                  style: setTextStyle(size: 18,)),
              Text(_degreeSymbol,
                  style: setTextStyle(size: 18,)),
              Icon(
                Icons.arrow_upward,
                size: 18,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    _temperature,
                    style: setTextStyle(size: 60,),
                    textAlign: TextAlign.left,
                  ),
                  Text(_degreeSymbol,
                      style:
                          setTextStyle(size: 60,)),
                  Text('C',
                      style:
                          setTextStyle(size: 30,))
                ],
              ),
            )),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text('Feels Like',
                    style:
                        setTextStyle(size: 20,)),
                Padding(padding: EdgeInsets.all(8)),
                Text(_feelsLike,
                    style:
                        setTextStyle(size: 20,),),
                Text(_degreeSymbol,
                    style:
                        setTextStyle(size: 20,),),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                _desc,
                style: setTextStyle(
                  size: 20,
                  
                ),
                textAlign: TextAlign.right,
              )),
        )
      ]),
      // )
      // ],
      // ),
    );
  }
}
