import 'package:flexittest/commons/navigator.dart';
import 'package:flexittest/domain/productmodel.dart';
import 'package:flexittest/presentation/screens/detailscreen/detailscreen.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel? model;
  ProductWidget({this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () {
          navigate(
              context,
              DetailScreen(
                model: model,
              ));
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(model!.image!),
        ),
        title: Text(model!.title!,style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(model!.description!),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black.withOpacity(0.5),
          size: 16,
        ),
      ),
    );
  }
}
