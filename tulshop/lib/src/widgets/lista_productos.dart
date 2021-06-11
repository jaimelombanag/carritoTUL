import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsList extends StatelessWidget {
  ProductsList({
    Key key,
    @required CollectionReference productss,
  })  : _productss = productss,
        super(key: key);

  final CollectionReference _productss;

  bool isFirst = true;
  String get tag => "${this.key.toString()}-${_productss.id}";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _productss.snapshots(),
      builder: (context, streamSnapshot) {
        if (streamSnapshot.hasData) {
          return ListView.builder(
            itemCount: streamSnapshot.data.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data.docs[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10)
                        .copyWith(left: isFirst ? 15 : 10),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Stack(
                        children: [
                          Hero(
                            tag: this.tag,
                            child: ClipRRect(
                              child: CachedNetworkImage(
                                imageUrl: documentSnapshot["image"],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: -1,
                            child: Container(
                              padding: EdgeInsets.all(10).copyWith(top: 50),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withOpacity(0),
                                    Colors.white.withOpacity(0.3),
                                    Colors.white.withOpacity(0.6),
                                    Colors.white.withOpacity(0.9),
                                    Colors.white,
                                  ],
                                  stops: [
                                    0.1,
                                    0.2,
                                    0.3,
                                    0.5,
                                    1,
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    documentSnapshot['nombre'],
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "\$",
                                          style: TextStyle(
                                            color: Colors.amberAccent,
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: documentSnapshot["costo"],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 7)
                                                .copyWith(left: 4),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            Text(
                                              documentSnapshot["sku"],
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.amberAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
