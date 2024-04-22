class TrackingParams {
  double? lat;
  double? long;
  String? status;

  TrackingParams({
    this.lat,
    this.long,
    this.status,
  });

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
        "status": status,
      };
}
