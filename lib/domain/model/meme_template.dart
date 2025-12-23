class MemeTemplate {
  final String id;
  final String name;
  final String url;
  final int width;
  final int height;
  final int box_count;
  final int captions;

  MemeTemplate(
      this.id,
      this.name,
      this.url,
      this.width,
      this.height,
      this.box_count,
      this.captions
  );

  factory MemeTemplate.fromJson(Map<String, dynamic> json) {
    return MemeTemplate(
      json['id'],
      json['name'],
      json['url'],
      json['width'] as int,
      json['height'] as int,
      json['box_count'] as int,
      json['captions'] as int,
    );
  }
}