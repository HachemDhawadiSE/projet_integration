import 'package:login_page/auth/login.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/strings/failures.dart';
class Login_Bloc  {

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}