
import 'package:attendance_app/apis/api_models/user_model.dart';

class GlobalData{

  static Map<int,UserModel> userModel={};

   static void setUserModel(UserModel model){
    userModel[0]=model;
  }



   static UserModel? getUserModel(){
    return userModel[0];
  }
}