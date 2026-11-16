/// Response models for the Silver Price API.

/// API Response wrapper.
class SilverpriceResponse {
  final String status;
  final dynamic error;
  final SilverpriceData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  SilverpriceResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory SilverpriceResponse.fromJson(Map<String, dynamic> json) => SilverpriceResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? SilverpriceData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Silver Price API.

class SilverpriceData {
  String? currency;
  num? gram;
  num? kilogram;
  num? ounce;
  String? lastUpdated;
  num? change24h;
  num? change24hPct;
  String? changeDirection;
  num? high24h;
  num? low24h;
  num? change7d;
  num? change7dPct;
  num? change30d;
  num? change30dPct;
  num? high30d;
  num? low30d;
  num? average30d;
  num? volatility30d;
  List<SilverpriceDataDailyItem>? daily;
  String? marketStatus;
  SilverpriceDataFormatted? formatted;

  SilverpriceData({
    this.currency,
    this.gram,
    this.kilogram,
    this.ounce,
    this.lastUpdated,
    this.change24h,
    this.change24hPct,
    this.changeDirection,
    this.high24h,
    this.low24h,
    this.change7d,
    this.change7dPct,
    this.change30d,
    this.change30dPct,
    this.high30d,
    this.low30d,
    this.average30d,
    this.volatility30d,
    this.daily,
    this.marketStatus,
    this.formatted,
  });

  factory SilverpriceData.fromJson(Map<String, dynamic> json) => SilverpriceData(
      currency: json['currency'],
      gram: json['gram'],
      kilogram: json['kilogram'],
      ounce: json['ounce'],
      lastUpdated: json['lastUpdated'],
      change24h: json['change24h'],
      change24hPct: json['change24hPct'],
      changeDirection: json['changeDirection'],
      high24h: json['high24h'],
      low24h: json['low24h'],
      change7d: json['change7d'],
      change7dPct: json['change7dPct'],
      change30d: json['change30d'],
      change30dPct: json['change30dPct'],
      high30d: json['high30d'],
      low30d: json['low30d'],
      average30d: json['average30d'],
      volatility30d: json['volatility30d'],
      daily: (json['daily'] as List?)?.map((e) => SilverpriceDataDailyItem.fromJson(e)).toList(),
      marketStatus: json['marketStatus'],
      formatted: json['formatted'] != null ? SilverpriceDataFormatted.fromJson(json['formatted']) : null,
    );
}

class SilverpriceDataDailyItem {
  String? date;
  num? price;

  SilverpriceDataDailyItem({
    this.date,
    this.price,
  });

  factory SilverpriceDataDailyItem.fromJson(Map<String, dynamic> json) => SilverpriceDataDailyItem(
      date: json['date'],
      price: json['price'],
    );
}

class SilverpriceDataFormatted {
  String? ounce;
  String? gram;
  String? kilogram;
  String? ounceWords;
  String? kilogramWords;

  SilverpriceDataFormatted({
    this.ounce,
    this.gram,
    this.kilogram,
    this.ounceWords,
    this.kilogramWords,
  });

  factory SilverpriceDataFormatted.fromJson(Map<String, dynamic> json) => SilverpriceDataFormatted(
      ounce: json['ounce'],
      gram: json['gram'],
      kilogram: json['kilogram'],
      ounceWords: json['ounceWords'],
      kilogramWords: json['kilogramWords'],
    );
}

class SilverpriceRequest {
  String? currency;
  bool? hourly;
  bool? daily;

  SilverpriceRequest({
    this.currency,
    this.hourly,
    this.daily,
  });

  Map<String, dynamic> toJson() => {
      if (currency != null) 'currency': currency,
      if (hourly != null) 'hourly': hourly,
      if (daily != null) 'daily': daily,
    };
}
