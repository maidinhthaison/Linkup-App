import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_styles.dart';
import '../../../../layout/cubit/cubit.dart';
import '../../../../shared/constants.dart';

class CommenterTextButtonSender extends StatelessWidget {
  const CommenterTextButtonSender({
    Key? key,
    required this.commentText,
    required this.commentController,
    required this.cubit,
    required this.postId,
    this.commentImage,
  }) : super(key: key);

  final String commentText;
  final TextEditingController commentController;
  final SocialAppCubit cubit;
  final String postId;
  final File? commentImage;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (commentText.trim().isEmpty && commentImage == null)
          ? null
          : () {
              if (cubit.commentImage == null) {
                cubit.typeNewComment(
                  postId: postId,
                  time: TimeOfDay.now().format(context),
                  date: getDate(),
                  commentText: commentText.trim(),
                );
              }
              if (cubit.commentImage != null) {
                cubit.uploadCommentImage(
                  postId: postId,
                  time: TimeOfDay.now().format(context),
                  date: getDate(),
                  commentText: commentText.trim(),
                );
              }
              commentController.clear();
              cubit.removeCommentImage();
              FocusScope.of(context).unfocus();
            },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey; // Set disabled color
            }
            return AppColors.primaryColor; // Set enabled color
          },
        ),
        textStyle: MaterialStateProperty.all(AppStyles.bodySmall),
      ),
      child: const Text(
        "Comment",
      ),
    );
  }
}
