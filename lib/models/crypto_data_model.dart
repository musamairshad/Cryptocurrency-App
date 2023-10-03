class CryptoDataModel {
  Status? status;
  List<Data>? data;

  CryptoDataModel({this.status, this.data});

  CryptoDataModel.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String? timestamp;
  int? errorCode;
  // ignore: prefer_void_to_null
  Null errorMessage;
  int? elapsed;
  int? creditCount;
  // ignore: prefer_void_to_null
  Null notice;

  Status(
      {this.timestamp,
      this.errorCode,
      this.errorMessage,
      this.elapsed,
      this.creditCount,
      this.notice});

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
    notice = json['notice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['error_code'] = errorCode;
    data['error_message'] = errorMessage;
    data['elapsed'] = elapsed;
    data['credit_count'] = creditCount;
    data['notice'] = notice;
    return data;
  }
}

class Data {
  int? id;
  int? rank;
  String? name;
  String? symbol;
  String? slug;
  int? isActive;
  String? firstHistoricalData;
  String? lastHistoricalData;
  Platform? platform;

  Data(
      {this.id,
      this.rank,
      this.name,
      this.symbol,
      this.slug,
      this.isActive,
      this.firstHistoricalData,
      this.lastHistoricalData,
      this.platform});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    isActive = json['is_active'];
    firstHistoricalData = json['first_historical_data'];
    lastHistoricalData = json['last_historical_data'];
    platform = json['platform'] != null
        ? Platform.fromJson(json['platform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['is_active'] = isActive;
    data['first_historical_data'] = firstHistoricalData;
    data['last_historical_data'] = lastHistoricalData;
    if (platform != null) {
      data['platform'] = platform!.toJson();
    }
    return data;
  }
}

class Platform {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  String? tokenAddress;

  Platform({this.id, this.name, this.symbol, this.slug, this.tokenAddress});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    tokenAddress = json['token_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['token_address'] = tokenAddress;
    return data;
  }
}