import 'package:stsj/core/cleanArc/ServiceInput/Data/model/Service.dart';
import 'package:stsj/core/cleanArc/ServiceInput/Domain/DTO/DTOServicePost.dart';
import 'package:stsj/core/cleanArc/ServiceInput/Domain/DTO/DTOlistReport.dart';

abstract class ServiceInterface {
  Future<List<Map<String, dynamic>>> fetchServiceReport(
      ServiceReportDTO serviceReportDTO);

  Future<bool> postReport(List<Map<String, dynamic>> serviceReport);
}