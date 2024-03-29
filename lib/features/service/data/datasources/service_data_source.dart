import 'package:prueba_wagon/core/error/exceptions.dart';
import 'package:prueba_wagon/features/service/data/models/serviceModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ServiceRemoteDataSource {
  Future<ServiceModel> createService(ServiceModel serviceModel);
  Future<ServiceModel> updateService(ServiceModel serviceModel);
  Future<ServiceModel> getService();
}

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final SupabaseClient supabaseClient;
  ServiceRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<ServiceModel> createService(ServiceModel servicio) async {
    try {
      final serviceData = await supabaseClient
          .from('service')
          .insert({servicio.toJson()}).select();
      return ServiceModel.fromJson(serviceData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ServiceModel> getService() {
    // TODO: implement getService
    throw UnimplementedError();
  }

  @override
  Future<ServiceModel> updateService(ServiceModel serviceModel) {
    // TODO: implement updateService
    throw UnimplementedError();
  }
}
