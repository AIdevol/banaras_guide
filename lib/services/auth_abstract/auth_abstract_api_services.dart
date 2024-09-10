import '../../ResponseModels/resgister_response_model.dart';

abstract class AuthenticationApi{
  Future<RegisterResponseModel>registerApicall( {Map<String, dynamic>? dataBody});
}