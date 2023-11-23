import 'package:dio/dio.dart';
import 'package:practice_yesno/domain/entities/messages.dart';
import 'package:practice_yesno/infrastructure/models/yes_no_model.dart';
//Aca es donde consumimos la peticion http
class GetYesNoAnswer{
  //Usamos Dio para poder hacer el mapeo de la peticion http de la api
  //*Con Dio resolvemos el problema de la peticion http
  final Dio _dio = Dio();

  Future<Message> getAnswer() async{
    final response = await _dio.get("https://yesno.wtf/api");
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    //!Esto es un mapper
    return yesNoModel.toMessage();
  }
}