import 'package:artacode_challenge_app/main.dart';
import 'package:artacode_challenge_app/repository/api.dart';
import 'package:artacode_challenge_app/repository/consts.dart';
import 'package:artacode_challenge_app/repository/enums.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  ValueNotifier<AppApiRequestState> requestState = ValueNotifier(AppApiRequestState.NOT_SENT_YET);
  ValueNotifier<String?> errorText = ValueNotifier(null);
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  RegisterViewModel() {
    requestState.addListener(notifyListeners);
    errorText.addListener(notifyListeners);
  }

  @override
  void dispose() {
    requestState.dispose();
    errorText.dispose();
    super.dispose();
  }

  doRegister() async {
    requestState.value = AppApiRequestState.SENDING;
    errorText.value = null;
    try {
      var response = await AppApi.register(emailCtrl.text, passCtrl.text);
      requestState.value = AppApiRequestState.SUCCESS;
      //TODO: Save token and navigate to home
      Consts.navigatorKey.currentState?.pushNamedAndRemoveUntil(AppRoutes.home, (_) => false);
    } on ApiErrorException catch (e) {
      errorText.value = e.errorMessage;
      requestState.value = AppApiRequestState.FAILED;
    } catch (e) {
      errorText.value = 'متأسفانه ارتباط با سرور ناموفق بود.';
      requestState.value = AppApiRequestState.FAILED;
    }
  }
}
