import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ushoez/models/shoe.dart';
import 'package:ushoez/screens/detail_shoe.dart';

class ListShoePage extends StatefulWidget {
  @override
  _ListShoeStatePage createState() => _ListShoeStatePage();
}

class _ListShoeStatePage extends State<ListShoePage> {
  final shoe = shoeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF6ED),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BackButton(
                  //TODO: to be implemented
                  onPressed: null),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: null,
                color: Color(0x00000000),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Row(
              children: <Widget>[
                Text(
                  'Find what suits you',
                  style: GoogleFonts.roboto(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.keyboard_arrow_down),
                    onPressed: null),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Text(
              'Latest best looking shoes on the market',
              style: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 16.0, right: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'What are you looking for',
                hintStyle: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                suffixIcon: Icon(Icons.filter_list),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              primary: false,
              childAspectRatio: 0.67,
              children: <Widget>[
                ...shoe.map((element) {
                  return buildElementsGrid(element);
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildElementsGrid(Shoe element) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailShoePage(selectedShoe: element),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children: <Widget>[
            //Container that holds the image.
            //Container(height: 150, width: 100, color: Colors.transparent),
            Positioned(
              left: 30,
              top: 55,
              child: Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        color: Colors.grey.withOpacity(0.75),
                        offset: Offset(5, 25),
                        spreadRadius: 12)
                  ],
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 15,
              child: Hero(
                tag: element.shoePic,
                child: Container(
                  height: 100,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    image: DecorationImage(
                        image: AssetImage(element.shoePic), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    element.shoeName,
                    style: GoogleFonts.roboto(fontSize: 12),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star,
                          size: 11, color: Colors.grey.withOpacity(0.6)),
                      Text(element.rating),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
