import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:test_dio/src/api/httpService.dart';
import 'package:test_dio/src/models/submitCase.dart';
import 'package:test_dio/src/models/user.dart';

class UserController extends GetxController {
  HttpService _httpService;
  @override
  void onInit() {
    super.onInit();
    _httpService = HttpService();
  }

  var user = User().obs;
  var userDataList = <UserData>[].obs;
  var userData = UserData().obs;
  var isloading = false.obs;

  Future<UserData> getUserFunc() async {
    isloading(true);
    try {
      var _response = await _httpService.getRequest('users/2');
      if (_response.statusCode == 200) {
        userData.value = UserData.fromJson(_response.data['data']);
      } else if (_response.statusCode == 401) {
        //UnAuthorization
      } else if (_response.statusCode == 404) {
        //Page Not Found
      }
    } catch (e) {
      throw Exception("Error In Catch Execption: " + e.message);
    } finally {
      isloading(false);
    }
    print("dataUser:${userData.value.firstName}");
    return userData.value;
  }

  var submitCase = SubmitCase().obs;
  var submitCaseData = <SubmitCaseData>[].obs;
  var page = 1.obs;
  Future<void> getListingOfSubmitCases() async {
    isloading(true);
    try {
      var _response = await _httpService.getRequest(
          'submit_cases/list_all_case_by_user_login',
          queryParameters: {
            'page': page.value,
            // 'per_page': '20'
          },
          headers: {
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiMzRlOTc3NTM4NzAyNDA3ODUxMWI4YWIzZTU5N2QwNjRjYjExYThkZjBiZWI5OGUwNWJiYTU1NDA1ZjM5ZDAxOTU1MTUyYjg2OGFkNzY1NjQiLCJpYXQiOjE2MjA4OTIwNzIuOTM5MDkyLCJuYmYiOjE2MjA4OTIwNzIuOTM5MDk4LCJleHAiOjE2NTI0MjgwNzIuODg3MDQsInN1YiI6IjI0Iiwic2NvcGVzIjpbXX0.xihpsZUoqkH_QPz6oPh-e5Z02dFaXYRkfn4Ir630RMovTKJqrXvfmyVbgc6w3to6btOloWmZypL2HniHAcBEQEZo94UIQG_JxNrq88BviGIf1qKSchfGMit_e-n5YvaOrbcneerkMwrechDybNCkI5zEnz_Q44Xc8E7mEWZyrnAQkU6v9rImOxJJ67W3lOkP4AcyazpsNGBGO-zSfcRCptKuhTSKZTyBJyK7MnUuQ0Cr2F0RnNEHcmpg8-Ao0III32fc9cTGDdOhipeJBrN9veupDas1fA9QVxz2PuuKLL4-dAwEUlJPItgL-sOwW6CpHB7tUwsos0VJa3RTRIj5pe_BILOUT3hoMVDbPL3wxHF-c8ZC_fbV_u4AdNKi3xekPS26nFvyPqXijcSbwZqdQ1agcVpgDU0Ln1L74kofNVOkEF0QH3U_AG61RGMWEk1UzuOM7qGnca3auA2xxThHACetKwBlflzqAbBi3FKyG38FgHVeuIv2jTpNa1KQgZzl-zFIF22U1yhadstjv1Sp17hWUgQVXZn9ARYwwbNLLRFyUCFTHtZba7wSlrVnVp3MxgzSxRuva9yub7QihkkfcfAMspPsyyAu6zE2i9PHE6AG14qZPaEBoVswYxUOBICimjlfDiGTBq0AilFLOnUGkMfkzWGAMprSWnNtnS_Lo4M'
          });
      if (_response.statusCode == 200) {
        //Get data add to Model
        submitCase.value = SubmitCase.fromMap(_response.data);
        if (page.value <= submitCase.value.meta.lastPage) {
          if (page.value == 1) {
            //add Data frist page
            submitCaseData.value = submitCase.value.data;
          } else {
            //add Data by page
            submitCaseData.addAll(submitCase.value.data);
          }
          page.value = page.value + 1;
        }
      } else if (_response.statusCode == 401) {
        //UnAuthorization
      } else if (_response.statusCode == 404) {
        //Page Not Found
      }
    } catch (e) {
      throw Exception("Error In Catch Execption: " + e.message);
    } finally {
      isloading(false);
    }
  }

  Future<void> postLoginFunc() async {
    isloading(true);
    try {
      var data = {
        'phone': '+85586466584',
        'password': '1234',
        'file': await dio.MultipartFile.fromFile('')
      };
      var _response = await _httpService.postRequest("login", data);
      if (_response.statusCode == 200) {
        //success status 200
      } else if (_response.statusCode == 201) {
        //create success
      } else if (_response.statusCode == 422) {
        //validation
      }
    } catch (e) {
      throw Exception("Error In Catch Execption: " + e.message);
    } finally {
      isloading(false);
    }
  }
}
