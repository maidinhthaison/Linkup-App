import 'package:flutter/material.dart';
import 'package:social_app/core/global/app_colors.dart';
import 'package:social_app/core/global/app_navigator.dart';
import 'package:social_app/core/global/app_styles.dart';
import 'package:social_app/core/models/user_model.dart';
import 'package:social_app/features/users/presentation/views/user_profile_view.dart';

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.navigateTo(
          screen: UserProfileView(userModel: userModel),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppColors.primaryColor.withOpacity(0.6),
        elevation: 10,
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 45.5,
              child: CircleAvatar(
                backgroundImage: NetworkImage(userModel.image!),
                radius: 45.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              userModel.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bodyLarge.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.touch_app,
                  color: Colors.white,
                  size: 22,
                ),
                const SizedBox(width: 5),
                Text(
                  "Visit",
                  style: AppStyles.bodyLarge.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}