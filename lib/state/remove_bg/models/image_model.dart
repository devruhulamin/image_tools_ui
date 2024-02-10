import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final int id;
  final String processedAt;
  final String processedImageUrl;
  final String message;

  const ImageModel({
    required this.id,
    required this.processedAt,
    required this.processedImageUrl,
    required this.message,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as int,
      processedAt: json['processed_at'] as String,
      processedImageUrl: json['processed_image_url'] as String,
      message: json['message'] as String,
    );
  }

  @override
  List<Object?> get props => [id, processedAt, processedImageUrl, message];
}
