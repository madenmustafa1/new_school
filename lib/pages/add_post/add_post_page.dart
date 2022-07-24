import 'package:flutter/material.dart';
import 'package:new_school/model/home/post_model.dart';
import 'package:uuid/uuid.dart';

import '/dependency_injection/setup.dart';
import '/util/color_util.dart';
import '/util/constants.dart';
import '/widgets/basic_appbar.dart';
import '/widgets/calc_sized_box.dart';
import '/widgets/text_and_button/rich_text_field.dart';
import '/widgets/text_and_button/simple_button.dart';
import 'add_post_view_mode.dart';

// ignore: must_be_immutable
class AddPostPage extends StatelessWidget {
  AddPostPage({Key? key}) : super(key: key);

  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController youtubeLinkController = TextEditingController();

  AddPostViewModel addPostViewModel = getIt<AddPostViewModel>();

  Constants constants = getIt<Constants>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorUtil.MAIN_COLOR,
      backgroundColor: ColorUtil.GREY_PLATINUM,
      appBar: BasicAppBar(title: constants.addPost),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CalcSizedBox(calc: 50),
            //Description
            RichTextField(
              controller: descriptionController,
              hintText: constants.description,
              keyboardType: TextInputType.multiline,
              maxlines: 4,
              suffixIcon: const Icon(Icons.title_rounded),
            ),
            //Name
            RichTextField(
              controller: nameController,
              hintText: constants.workName,
              suffixIcon: const Icon(Icons.music_note),
            ),

            //Y.Link
            RichTextField(
              controller: youtubeLinkController,
              hintText: constants.youtubeLink,
              suffixIcon: const Icon(Icons.play_arrow_sharp),
            ),
            const CalcSizedBox(calc: 50),
            //Login Button
            SimpleButton(
              buttonText: "Paylaş",
              //getIt<Constants>().loginButtonText,
              onPressed: () {
                //login(context);
                share();
              },
            ),
          ],
        ),
      ),
    );
  }

  void share() {
    var uuid = const Uuid();
    PostModel postModel = PostModel(
      videoUrl: youtubeLinkController.text,
      description: descriptionController.text,
      nameSurname: "nameSurname",
      profilePhotoUrl: "profilePhotoUrl",
      videoName: nameController.text,
      uuid: uuid.v1(),
      like: 0,
      comment: [],
      subject: "subject",
      email: "email",
    );

    addPostViewModel.addPost(postModel);
  }
}
