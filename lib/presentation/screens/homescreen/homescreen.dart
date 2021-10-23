import 'package:flexittest/commons/size_config.dart';
import 'package:flexittest/data/cache/cachedata.dart';
import 'package:flexittest/domain/productmodel.dart';
import 'package:flexittest/presentation/reusables/productwidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexit Test"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<ProductModel>>(
          future: getProductListResponse(),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                height:SizeConfig.screenHeightDp,
                width: SizeConfig.screenWidthDp,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) {
                    return ProductWidget(
                      model: snapshot.data[index],
                    );
                  });
            } else {
              return Container(
                height: SizeConfig.screenHeightDp,
                width: SizeConfig.screenWidthDp,
              );
            }
          },
        ),
      ),
    );
  }
}
