// // Fetch all products
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import '../../models/products.dart';
// import 'dbProvider.dart';
// import '../../Constants/url.dart';

// //Base Url
// final requestBaseUrl = ApiUrl.baseUrl;

// class FetchDataProvider extends ChangeNotifier {
//   Future<AllProducts> fetchAllProducts() async {
//     String url = "$requestBaseUrl/api/v1/findall";
//     String accessToken = await DatabaseProvider().getToken();
//     print("This is the gotten token: $accessToken");
//     final headers = {
//       "Content-type": "application/json; charset=utf-8",
//       "Accept": "/",
//       "Authorization": "Bearer $accessToken",
//     };
//     return http
//         .get(
//       Uri.parse(url),
//       headers: headers,
//     )
//         .then((data) {
//       if (data.statusCode == 200) {
//         final jsonData = json.decode(data.body);

//         return AllProducts.fromJson(jsonData);
//       }
//       throw Exception("Something is wrong");
//     });
//   }
// }
