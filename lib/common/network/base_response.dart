import 'package:equatable/equatable.dart';

class BaseResponse extends Equatable {
  final bool? success;
  final int? status;
  final List<String>? messages;
  final dynamic data;

  const BaseResponse({this.success, this.status, this.messages, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        success: json['success'],
        status: json['status'],
        messages: List<String>.from(json['messages']),
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'status': status,
        'messages': messages,
        'data': data,
      };

  @override
  List<Object?> get props => [success, status, messages, data];
}
