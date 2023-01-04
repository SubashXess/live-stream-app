import 'dart:io';

class StreamSettingModel {
  final String id;
  final String streamId;
  final String userId;
  final String appId;
  final String appSign;
  final String title;
  final String? desc;
  final File? thumb;
  final String? generatedLink;
  final String? scheduleDate;
  final String? scheduleTime;
  final String createdAt;
  final String updatedAt;
  final String status;

  const StreamSettingModel({
    required this.id,
    required this.streamId,
    required this.userId,
    required this.appId,
    required this.appSign,
    required this.title,
    this.desc,
    this.thumb,
    this.generatedLink,
    this.scheduleDate,
    this.scheduleTime,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory StreamSettingModel.fromJson(Map<String, dynamic> json) {
    return StreamSettingModel(
      id: json['id'],
      streamId: json['streamId'],
      userId: json['userId'],
      appId: json['appId'],
      appSign: json['appSign'],
      title: json['title'],
      desc: json['desc'],
      thumb: json['thumb'],
      generatedLink: json['generatedLink'],
      scheduleDate: json['scheduleDate'],
      scheduleTime: json['scheduleTime'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'streamId': streamId,
        'userId': userId,
        'appId': appId,
        'appSign': appSign,
        'title': title,
        'desc': desc,
        'thumb': thumb,
        'generatedLink': generatedLink,
        'scheduleDate': scheduleDate,
        'scheduleTime': scheduleTime,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'status': status,
      };
}
