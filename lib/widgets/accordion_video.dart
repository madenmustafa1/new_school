import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import '../util/color_util.dart';
import '../widgets/simple_text.dart';
import '../widgets/widget_util.dart';
import '../dependency_injection/setup.dart';
import '../widgets/video_player.dart';

class AccordionVideo extends StatefulWidget {
  final String nameSurname;
  final String? profilePhoto;
  final String videoUrl;
  final String videoName;
  final String description;
  const AccordionVideo(
      {Key? key,
      required this.videoUrl,
      required this.description,
      required this.nameSurname,
      required this.profilePhoto,
      required this.videoName})
      : super(key: key);

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
    controller ??= widgetUtil.returnPodPlayerController(widget.videoUrl);

    mediaQuery ??= MediaQuery.of(context);
    return Container(
      decoration: widgetUtil.boxDecoration(bottom: true, widht: 0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          widgetUtil.returnPadding(
              widget: SimpleText(
            text: widget.nameSurname,
            optionalTextSize: 18,
            textIsNormal: true,
          )),
          widgetUtil.returnPadding(
              widget: SimpleText(
            text: widget.description,
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
                  text: widget.videoName,
                  optionalTextSize: 18,
                  textColor: ColorUtil.WHITE,
                ),
                content: CustomVideoPlayer(
                  videoUrl: widget.videoUrl,
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

//Icon(Icons.audiotrack, color: Colors.white)
