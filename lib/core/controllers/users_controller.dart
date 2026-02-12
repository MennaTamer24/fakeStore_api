// import 'package:fake_api_app/features/users/data/userModel.dart';
// import 'package:fake_api_app/features/users/data/user_repo.dart';
// import 'package:get/get.dart';

// class UsersController extends GetxController {
//   final UserRepo userRepo = UserRepo();

//   // Loading states
//   RxBool isLoading = false.obs;
//   RxBool addLoading = false.obs;
//   RxBool updateLoading = false.obs;
//   RxBool deleteLoading = false.obs;
//   RxBool getLoading = false.obs;

//   RxList<UserModel> allUsers = <UserModel>[].obs;

//   @override
//   void onInit() {
//     fetchUsers();
//     super.onInit();
//   }

//   // Fetch all users
//   Future<void> fetchUsers() async {
//     try {
//       isLoading(true);
//       final response = await userRepo.getAllUsers();

//       if (response.isEmpty) {
//         allUsers.addAll([
//           UserModel(
//             id: 1,
//             username: "Ali",
//             email: "ali@example.com",
//             password: "1234",
//           ),
//           UserModel(
//             id: 2,
//             username: "Sara",
//             email: "sara@example.com",
//             password: "abcd",
//           ),
//           UserModel(
//             id: 3,
//             username: "Omar",
//             email: "omar@example.com",
//             password: "xyz",
//           ),
//         ]);
//       } else {
//         allUsers.addAll(response);
//       }

//       isLoading(false);
//     } catch (e) {
//       isLoading(false);

//       // Silent fallback without SnackBar
//       allUsers.addAll([
//         UserModel(
//           id: 1,
//           username: "Ali",
//           email: "ali@example.com",
//           password: "1234",
//         ),
//         UserModel(
//           id: 2,
//           username: "Sara",
//           email: "sara@example.com",
//           password: "abcd",
//         ),
//         UserModel(
//           id: 3,
//           username: "Omar",
//           email: "omar@example.com",
//           password: "xyz",
//         ),
//       ]);
//     }
//   }

//   // Add new user
//   Future<UserModel?> addUser(UserModel user) async {
//     try {
//       addLoading(true);
//       final response = await userRepo.addNewUser(user);
//       allUsers.add(response);
//       allUsers.refresh(); // مهم لتحديث الـ UI
//       addLoading(false);
//       return response;
//     } catch (e) {
//       addLoading(false);
//       return null;
//     }
//   }

//   // Get single user
//   Future<UserModel?> getUser(int id) async {
//     try {
//       getLoading(true);
//       final response = await userRepo.getSingleUser(id);
//       getLoading(false);
//       return response;
//     } catch (e) {
//       getLoading(false);
//       return null;
//     }
//   }

//   // Update user
//   Future<UserModel?> updateUser(UserModel user) async {
//     try {
//       updateLoading(true);
//       final response = await userRepo.updateUser(user);
//       final index = allUsers.indexWhere((u) => u.id == user.id);
//       if (index != -1) {
//         allUsers[index] = response;
//         allUsers.refresh(); // مهم لتحديث الـ UI
//       }
//       updateLoading(false);
//       return response;
//     } catch (e) {
//       updateLoading(false);
//       return null;
//     }
//   }

//   // Delete user
//   Future<void> deleteUser(UserModel user) async {
//     try {
//       deleteLoading(true);
//       await userRepo.deleteUser(user);
//       allUsers.removeWhere((u) => u.id == user.id);
//       allUsers.refresh(); // مهم لتحديث الـ UI
//       deleteLoading(false);
//     } catch (e) {
//       deleteLoading(false);
//     }
//   }
// }
import 'package:fake_api_app/features/users/data/userModel.dart';
import 'package:fake_api_app/features/users/data/user_repo.dart';
import 'package:fake_api_app/shared/helpers/custom_snack.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final UserRepo userRepo = UserRepo();
  RxBool isLoading = false.obs;
  RxBool addLoading = false.obs;
  RxBool updateLoading = false.obs;
  RxBool deleteLoading = false.obs;
  RxBool getLoading = false.obs;
  RxList<UserModel> allUsers = <UserModel>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      final response = await userRepo.getAllUsers();
      allUsers.assignAll(response);

      isLoading(false);
    } catch (e) {
      isLoading(false);
      customSnack(e.toString());
    }
  }

  Future<UserModel?> addUser(UserModel user) async {
    try {
      addLoading(true);
      final response = await userRepo.addNewUser(user);
      allUsers.add(response);
      addLoading(false);
      return response;
    } catch (e) {
      addLoading(false);
      customSnack(e.toString());
      return null;
    }
  }

  Future<UserModel?> getUser(int id) async {
    try {
      getLoading(true);
      final response = await userRepo.getSingleUser(id);
      getLoading(false);
      return response;
    } catch (e) {
      getLoading(false);
      customSnack(e.toString());
      return null;
    }
  }

  Future<UserModel?> updateUser(UserModel user) async {
    try {
      updateLoading(true);
      final response = await userRepo.updateUser(user);
      final index = allUsers.indexWhere((u) => u.id == user.id);
      if (index != -1) {
        allUsers[index] = response;
      }
      updateLoading(false);
      return response;
    } catch (e) {
      updateLoading(false);
      customSnack(e.toString());
      return null;
    }
  }

  Future<void> deleteUser(UserModel user) async {
    try {
      deleteLoading(true);
      await userRepo.deleteUser(user);
      allUsers.removeWhere((u) => u.id == user.id);
      deleteLoading(false);
    } catch (e) {
      deleteLoading(false);
      customSnack(e.toString());
    }
  }
}
