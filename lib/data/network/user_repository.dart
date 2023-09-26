import '../model/universal_data.dart';
import 'api_provider.dart';

class UserRepository {
  UserRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<UniversalData> getUser() =>
      apiProvider.getUsers();
}