import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flexittest/data/apicalls/getproductlist.dart';
import 'package:flexittest/domain/productmodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> getProductListResponse() async {
  try{
      String fileName = "CachedProductList.json";
  var cacheDirectory = await getTemporaryDirectory();
      List<ProductModel> modelList = await getProductList(http.Client());

  if (await File(cacheDirectory.path + "/" + fileName).exists() && modelList == null) {
    //Load data from cache
    log("Loading from cache");
    var response =
        File(cacheDirectory.path + "/" + fileName).readAsStringSync();
    Iterable jsonData = jsonDecode(response);
    List<ProductModel> modelList =
        List<ProductModel>.from(jsonData.map((e) => ProductModel.fromJson(e)));

    return modelList;
  } else {
    //save to cache after laoding from api
    log("saving to cache");
    var jsonBody = jsonEncode(modelList.map((e) => e.toJson()).toList());
    File file = File(cacheDirectory.path + "/" + fileName);
    file.writeAsString(jsonBody, flush: true, mode: FileMode.write);
    return modelList;
  }
  }
  catch(error){
    throw error;
  }

}
