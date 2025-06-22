import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flix_id/config/network/dio_client.dart';

part 'dio_client_provider.g.dart';

@riverpod
DioClient dioClient(ref) => DioClient();
