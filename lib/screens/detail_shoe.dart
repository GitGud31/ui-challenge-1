import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ushoez/models/shoe.dart';

class DetailShoePage extends StatefulWidget {
  final Shoe selectedShoe;
  DetailShoePage({this.selectedShoe});

  @override
  _DetailShoePageState createState() => _DetailShoePageState();
}

class _DetailShoePageState extends State<DetailShoePage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          //Container(height: _height, width: _width, color: Colors.transparent),
          Container(
              width: _width,
              height: _height - _height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.selectedShoe.logo),
                      fit: BoxFit.cover))),
          Positioned(
            top: _height - _height / 3 - 25,
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              width: _width,
              height: _height / 3 + 25,
              decoration: BoxDecoration(
                color: Color(0xFFFAF6ED),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    widget.selectedShoe.shoeName,
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: <Widget>[
                      SmoothStarRating(
                          color: Colors.orange,
                          rating: 4,
                          starCount: 5,
                          allowHalfRating: true,
                          borderColor: Colors.grey[300]),
                      SizedBox(width: 5),
                      Text(widget.selectedShoe.rating,
                          style: GoogleFonts.roboto(
                              fontSize: 20, color: Colors.orange)),
                      SizedBox(width: 75),
                      Text(widget.selectedShoe.reviews,
                          style: GoogleFonts.roboto(color: Colors.grey[700])),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 5.0, right: 16),
                    child: Text(
                        'Lorem ipsum dolor sit amet, pri rebum atqui ad, no eum aeque latine, ad eam mucius viderer. Vix ipsum latine fuisset at, duo vulputate constituam et. Vim atqui invidunt intellegebat in.'),
                  ),
                  SizedBox(width: 5),
                  Text('Read more',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, color: Colors.orange)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 5),
                    Flexible(
                      flex: 3,
                      child: Text('Purchase',
                          style: GoogleFonts.roboto(color: Colors.white)),
                    ),
                    Flexible(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {},
                        color: Colors.white,
                        icon: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ],
                ),
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: _height / 2 + 50,
            child: Hero(
              tag: widget.selectedShoe.shoePic,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.selectedShoe.shoePic)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
