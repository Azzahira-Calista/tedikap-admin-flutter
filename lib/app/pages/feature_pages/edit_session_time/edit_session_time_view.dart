import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_session_time/edit_session_time_controller.dart';
import 'package:tedikap_admin/app/pages/global_components/alert.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/global_components/textfield.dart';
import 'package:tedikap_admin/common/format.dart';
import 'package:tedikap_admin/common/themes.dart';

class EditSessionTimeView extends GetView<EditSessionTimeController> {
  const EditSessionTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Session Time',
          style: appBarText,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          triggerMode: RefreshIndicatorTriggerMode.anywhere;
          controller.getSessionTime();
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Session Time',
                style: normalText.copyWith(
                  fontWeight: FontWeight.w600
                ),
              ),

              const SizedBox(height: 10,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Session 1',
                    style: subTitle.copyWith(color: primaryColor),
                  ),
                  Obx(() => Text(
                    'Start time: ${formatTimeString(controller.sessionTimeDataResponse.value.sessionTimes?[0].startTime.toString() ?? "" )} \nEnd time: ${formatTimeString(controller.sessionTimeDataResponse.value.sessionTimes?[0].endTime.toString() ?? "")}',
                    style: normalText,
                  ), )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Session 2',
                    style: subTitle.copyWith(color: primaryColor),
                  ),
                  Obx(() => Text(

                    'Start time: ${formatTimeString(controller.sessionTimeDataResponse.value.sessionTimes?[1].startTime.toString() ?? "" )} \nEnd time: ${formatTimeString(controller.sessionTimeDataResponse.value.sessionTimes?[1].endTime.toString() ?? "")}',
                    style: normalText,
                  ), )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Session', style: subTitle),
                  const SizedBox(height: 5,),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      focusColor: primaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: offColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    value: controller.selectedId.value,
                    items: ['1', '2']
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category, style: normalText),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedId.value = value!;
                    },
                    hint: Text(
                      "Select a session",
                      style: normalTextPrimary.copyWith(color: offColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),

              MyTextField(
                hintText: 'Enter the start time',
                name: 'Start Time',
                expand: false,
                readOnly: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onTap: () {
                  controller.selectTime(
                      context, controller.startTimeController);
                },
                controller: controller.startTimeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5,),

              MyTextField(
                hintText: 'Enter the end time',
                name: 'End Time',
                expand: false,
                readOnly: true,
                controller: controller.endTimeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field cannot be empty";
                  }
                  return null;
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onTap: () {
                  controller.selectTime(context, controller.endTimeController);
                },
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(),
                child: myButton(
                  text: "Change",
                  onPressed: () {
                    Get.dialog(
                      ReusableDialog(
                          title:
                              'Are you sure you want to edit the session time?',
                          content: '',
                          cancelText: 'No',
                          confirmText: 'Yes',
                          onCancelPressed: () {
                            Get.back();
                          },
                          onConfirmPressed: () {
                            controller.editSessionTime();

                          }),
                    );
                  },
                  color: primaryColor,
                  textColor: white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
