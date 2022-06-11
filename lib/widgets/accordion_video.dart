import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:new_school/model/home/post_model.dart';
import 'package:pod_player/pod_player.dart';
import '../util/app_util.dart';
import '../util/color_util.dart';
import '../widgets/simple_text.dart';
import '../widgets/widget_util.dart';
import '../dependency_injection/setup.dart';
import '../widgets/video_player.dart';

class AccordionVideo extends StatefulWidget {
  final PostModel postModel;

  const AccordionVideo({
    Key? key,
    required this.postModel,
  }) : super(key: key);

  @override
  State<AccordionVideo> createState() => _AccordionVideoState();
}

class _AccordionVideoState extends State<AccordionVideo> {
  MediaQueryData? mediaQuery;

  WidgetUtil widgetUtil = getIt<WidgetUtil>();

  PodPlayerController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller ??=
        widgetUtil.returnPodPlayerController(widget.postModel.videoUrl);

    mediaQuery ??= MediaQuery.of(context);
    return Container(
      decoration: widgetUtil.boxDecoration(bottom: true, widht: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Row(
            children: [
              widgetUtil.returnPadding(
                top: AppUtil.defaulPadding - 4,
                left: AppUtil.defaulPadding,
                right: AppUtil.defaulPadding,
                widget: CircleAvatar(
                  radius: 25.0,
                  backgroundImage:
                      NetworkImage(widget.postModel.profilePhotoUrl),
                ),
              ),
              SimpleText(
                text: widget.postModel.nameSurname,
                optionalTextSize: 18,
                textIsNormal: true,
              ),
            ],
          ),
          widgetUtil.returnPadding(
              left: AppUtil.defaulPadding,
              right: AppUtil.defaulPadding,
              widget: SimpleText(
                text: widget.postModel.description,
                optionalTextSize: 18,
                //textIsNormal: true,
              )),
          const SizedBox(height: 5),
          Accordion(
            paddingListTop: 0,
            paddingListBottom: 5,
            disableScrolling: true,
            maxOpenSections: 2,
            leftIcon: Icon(Icons.audiotrack, color: ColorUtil.WHITE),
            children: [
              AccordionSection(
                headerBackgroundColor: ColorUtil.MAIN_COLOR,
                isOpen: false,
                header: SimpleText(
                  text: widget.postModel.videoName,
                  optionalTextSize: 18,
                  textColor: ColorUtil.WHITE,
                ),
                content: CustomVideoPlayer(
                  videoUrl: widget.postModel.videoUrl,
                  videoController: controller!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
