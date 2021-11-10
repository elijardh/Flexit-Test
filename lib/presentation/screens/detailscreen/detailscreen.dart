import 'package:flexittest/commons/navigator.dart';
import 'package:flexittest/commons/size_config.dart';
import 'package:flexittest/domain/productmodel.dart';
import 'package:flexittest/presentation/reusables/y_margin.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel? model;
  DetailScreen({this.model});

  final SizeConfig config = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  leading: GestureDetector(
                      onTap: () {
                        popView(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.black.withOpacity(0.5),
                        size: 16,
                      )),
                  pinned: false,
                  expandedHeight: config.sh(250) as double?,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      model!.image!,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Text(exception.toString());
                      },
                    ),
                  ),
                )
              ];
            },
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model!.title!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  YMargin(10),
                  Text(
                    model!.description!,
                    maxLines: 50,
                    textAlign: TextAlign.left,
                  ),
                  YMargin(20),
                  Text(
                    "PRICE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  YMargin(5),
                  Text(
                    "\$ ${model!.price}",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            )));
  }
}
