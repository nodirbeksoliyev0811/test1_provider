import 'package:flutter/foundation.dart';
import '../data/model/status/form_status.dart';
import '../data/model/universal_data.dart';
import '../data/model/user_model.dart';
import '../data/network/user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository userRepository;

  UserProvider({required this.userRepository}){
    // fetchUsersData();
  }

  String errorText = "";

  FormStatus status = FormStatus.pure;

  List<UserModel>? users;

  fetchUsersData() async {
    notify(FormStatus.loading);
    UniversalData universalData = await userRepository.getUser();
    if (universalData.error.isEmpty) {
      notify(FormStatus.success);
      users = universalData.data as List<UserModel>;
    } else {
      errorText = universalData.error;
      notify(FormStatus.failure);
    }
  }

  notify(FormStatus value) {
    status = value;
    notifyListeners();
  }
}