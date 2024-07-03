


import 'package:dio/dio.dart';
import '../../view/theme/constants.dart';



class DioClient {

  // String baseUrl = "http://64.227.145.76/kabayan-rewards/public/api/";
  String baseUrl = StringConstants.apiBaseUrl;
  // String baseUrl = "https://staging.kabayanhypermarkets.com/api/";

  post(String endpoint, Map<String, dynamic> dt, String? token) async {
    String url = "${baseUrl}${endpoint}";
    FormData fmdt = FormData.fromMap(dt);
    var dio = Dio();
    try {
      if (token == null) {
        Response response = await dio.post(url, data: fmdt);
        print("response.data");
        print(response.data);
        if (response.statusCode == 200) {
          return response.data;
        }
        else if(response.statusCode == 422) {
          return null;
        }else{
          return null;
        }
      }
      if (token != null) {
        Response response = await dio.post(url,
            // data: {"username": username, "password": password, "email": email},
            data: fmdt,
            options: Options(headers: {'Authorization': 'Bearer $token'}));

        if (response.statusCode == 200) {
          return response.data;
        }
        else {
          return null;
        }
      }
    }
    catch (e) {
      print(e);
    }
  }

  put(String endpoint, Map<String, dynamic> data, String? token) async {
    String url = "${baseUrl}${endpoint}";
    var dio = Dio();
    try {
      if (token == null) {
        Response response = await dio.put(url, data: data);

        if (response.statusCode == 200) {
          return response.data;
        }
        else {
          return null;
        }
      }
      if (token != null) {
        Response response = await dio.put(url,
            // data: {"username": username, "password": password, "email": email},
            data: data,
            options: Options(headers: {'Authorization': 'Bearer $token'}));

        if (response.statusCode == 200) {
          return response.data;
        }
        else {
          return null;
        }
      }
    }
    catch (e) {
      print(e);
    }
  }


  get(String endpoint, String? token) async {
    String url = "${baseUrl}${endpoint}";
    var dio = Dio();

      if (token == null) {
        Response response = await dio.get(url);

        if (response.statusCode == 200) {
          return response.data;
        }if (response.data["status"]==101) {
        }
        else {
          return null;
        }
      }
      if (token != null) {
        var response = await dio.get(url,
            options: Options(headers: {'Authorization': 'Bearer $token'}));

        print(response.statusCode);

        if (response.statusCode == 200) {
          return response.data;
        }
        else {
          return null;
        }
      }

  }

  getWithParameter(String endpoint, String token,
      Map<String, dynamic> data) async {
    String url = "${baseUrl}${endpoint}";
    var dio = Dio();
    Response response = await dio.get(url, queryParameters: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    if (response.statusCode == 200) {
      return response.data;
    }
    else {
      return null;
    }
  }

  postWithFormdata(String endpoint, String token, FormData formData) async {
    String url = "${baseUrl}${endpoint}";

    var dio = Dio();

    final response = await dio.post(
        url,
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'})
    );




    if (response.statusCode == 200) {
      return response.data;
    }
    else {
      return null;
    }
  }


  // postWithFormdata()async{
  //   Dio dio = new Dio();
  //   dio.options.headers["Content-Type"] = "multipart/form-data";
  //   FormData formData = new FormData.fromMap({
  //     'file':await MultipartFile.fromFile(filePath,
  //         filename: fileName, contentType: MediaType(mimee, type))
  //   });
  //   Response response = await dio
  //       .post('http://192.168.18.25:8080/test', data: formData)
  //       .catchError((e) => print(e.response.toString()));
  // }




    // Future <List<Map<String,dynamic>>> get(url)async{
    // Future <dynamic> get( String url)async{
    //   var dio = Dio();
    //   try{
    //     Response response = await dio.get(
    //      url,
    //
    //     );
    //     return response.data;
    //   }
    //   catch(e){
    //     print(e);
    //   }
    //
    // }


 }











































//
//
// import 'package:dio/dio.dart';
// import 'package:finprov/models/core/auth_model.dart';
// import 'package:finprov/models/core/posts_model.dart';
//
//
// class DioClient{
//   final String baseUrl="http://staging.finprov.com/wp-json";
//
//
//   Future<User?> authUser({required String email,required String password}) async{
//     User? retrievedUser;
//
//     try{
//       var dio = Dio();
//       final _baseUrl = baseUrl;
//        Response response = await dio.post(
//         _baseUrl + "/jwt-auth/v1/token/",
//         data: {"username":email ,"password":password},
//       );
//       // data: {"username":"finprov_admin","password":"Finprov_admin@2022"}
//       print(response.data);
//
//       Map<String,dynamic> jsonData = response.data;//jsonDecode(response.data);
//
//       retrievedUser = User.fromJson(jsonData);
//
//       return retrievedUser;
//       // if(retrievedUser!=null) {
//       //
//       //
//       //   print('User created: ${response.data}');
//       // }
//
//
//     }
//     catch(e){
//       print('Error creating user: $e');
//     }
//   }
//
//
//   registerUser({required String email,required String username,required String password})async{
//
//     try{
//       var dio = Dio();
//       final _baseUrl = baseUrl;
//       String token ="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9zdGFnaW5nLmZpbnByb3YuY29tIiwiaWF0IjoxNjUwNDQzOTgyLCJuYmYiOjE2NTA0NDM5ODIsImV4cCI6MTY1MTA0ODc4MiwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMSJ9fX0.vu0-A5AODc6OM6P58H1i25zXLLKlQAXNQtYhRQUXVFw";
//       Response response = await dio.post(
//         _baseUrl + "/wp/v2/users",
//         data: {"username":username ,"password":password,"email":email},
//         options:Options(headers: {'Authorization': 'Bearer $token'})
//       );
//
//       print(response.data);
//
//       Map<String,dynamic> jsonData = response.data;//jsonDecode(response.data);
//
//
//
//
//
//     }
//     catch(e){
//       print('Error creating user: $e');
//     }
//   }
//
//
//
//
//
//
//   Future <List<Posts>?> getPosts() async{
//     try{
//       var dio = Dio();
//       final _baseUrl = baseUrl;
//       Response response = await dio.get(
//         _baseUrl + "/wp/v2/posts?_fields=author,id,excerpt,title,link",
//       );
//
//       List<Posts> record = [];
//       for (var element in response.data) {
//         record.add(Posts.fromJson(element));
//       }
//
//       return record;
//     }
//     catch(e){
//       print('error $e');
//     }
//
//
//   }
//
//
// }
//
