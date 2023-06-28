import 'package:flutter/material.dart';
import 'package:social_app/core/global/app_colors.dart';
import 'package:social_app/core/models/user_model.dart';
import 'package:social_app/layout/cubit/cubit.dart';
import 'package:social_app/layout/cubit/states.dart';

import 'add_photos_and_tags_buttons.dart';
import 'new_post_text_field.dart';
import 'post_image.dart';
import 'user_name_and_image.dart';

class NewPostViewBody extends StatelessWidget {
  const NewPostViewBody({
    Key? key,
    required this.cubit,
    required this.state,
    required this.textController,
    required this.model,
  }) : super(key: key);

  final SocialAppCubit cubit;
  final TextEditingController textController;
  final UserModel model;
  final SocialAppStates state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          if (state is CreatePostLoadingState)
            const LinearProgressIndicator(color: AppColors.primaryColor),
          if (state is CreatePostLoadingState) const SizedBox(height: 10),
          UserNameAndImage(model: model),
          const SizedBox(height: 5),
          NewPostTextField(textController: textController, model: model),
          const SizedBox(height: 50),
          if (cubit.postImage != null) PostImage(cubit: cubit),
          const SizedBox(height: 20),
          AddPhotosAndTagsButtons(cubit: cubit),
        ],
      ),
    );
  }
}
