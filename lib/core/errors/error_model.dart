// دا  موديل او شكل الايرور اللى بيرجع من الباك ودا لازم التنسيق مع الباك اند فى شكله
class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData["Message"],
      status: jsonData["status"],
    );
  }
}
