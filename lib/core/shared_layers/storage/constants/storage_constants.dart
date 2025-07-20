abstract class StorageConstants {
  static const String storedMessage = "Stored";
  static const String successMessage = "success";
  static const String loginModelKey = "loginModelKey";

  static String errorStoringMessage(String error) {
    return "Error Storing Value: $error";
  }

  static String errorReadingMessage(String error) {
    return "Error Reading Value: $error";
  }

  static String errorDeletingMessage(String error) {
    return "Error Deleting Value: $error";
  }
}
