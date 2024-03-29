class ProductDeatilEntity {
	String code;
	ProductDeatilData data;
	String message;

	ProductDeatilEntity({this.code, this.data, this.message});

	ProductDeatilEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new ProductDeatilData.fromJson(json['data']) : null;
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['message'] = this.message;
		return data;
	}
}

class ProductDeatilData {
	ProductDeatilDataGoodinfo goodInfo;
	List<ProductDeatilDataGoodcommants> goodComments;
	ProductDeatilDataAdvertespicture advertesPicture;

	ProductDeatilData({this.goodInfo, this.goodComments, this.advertesPicture});

	ProductDeatilData.fromJson(Map<String, dynamic> json) {
		goodInfo = json['goodInfo'] != null ? new ProductDeatilDataGoodinfo.fromJson(json['goodInfo']) : null;
		if (json['goodComments'] != null) {
			goodComments = new List<ProductDeatilDataGoodcommants>();(json['goodComments'] as List).forEach((v) { goodComments.add(new ProductDeatilDataGoodcommants.fromJson(v)); });
		}
		advertesPicture = json['advertesPicture'] != null ? new ProductDeatilDataAdvertespicture.fromJson(json['advertesPicture']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.goodInfo != null) {
      data['goodInfo'] = this.goodInfo.toJson();
    }
		if (this.goodComments != null) {
      data['goodComments'] =  this.goodComments.map((v) => v.toJson()).toList();
    }
		if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
		return data;
	}
}

class ProductDeatilDataGoodinfo {
	String image5;
	int amount;
	String image3;
	String image4;
	String goodsId;
	String isOnline;
	String image1;
	String image2;
	String goodsSerialNumber;
	double oriPrice;
	double presentPrice;
	String comPic;
	int state;
	String shopId;
	String goodsName;
	String goodsDetail;

	ProductDeatilDataGoodinfo({this.image5, this.amount, this.image3, this.image4, this.goodsId, this.isOnline, this.image1, this.image2, this.goodsSerialNumber, this.oriPrice, this.presentPrice, this.comPic, this.state, this.shopId, this.goodsName, this.goodsDetail});

	ProductDeatilDataGoodinfo.fromJson(Map<String, dynamic> json) {
		image5 = json['image5'];
		amount = json['amount'];
		image3 = json['image3'];
		image4 = json['image4'];
		goodsId = json['goodsId'];
		isOnline = json['isOnline'];
		image1 = json['image1'];
		image2 = json['image2'];
		goodsSerialNumber = json['goodsSerialNumber'];
		oriPrice = json['oriPrice'];
		presentPrice = json['presentPrice'];
		comPic = json['comPic'];
		state = json['state'];
		shopId = json['shopId'];
		goodsName = json['goodsName'];
		goodsDetail = json['goodsDetail'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image5'] = this.image5;
		data['amount'] = this.amount;
		data['image3'] = this.image3;
		data['image4'] = this.image4;
		data['goodsId'] = this.goodsId;
		data['isOnline'] = this.isOnline;
		data['image1'] = this.image1;
		data['image2'] = this.image2;
		data['goodsSerialNumber'] = this.goodsSerialNumber;
		data['oriPrice'] = this.oriPrice;
		data['presentPrice'] = this.presentPrice;
		data['comPic'] = this.comPic;
		data['state'] = this.state;
		data['shopId'] = this.shopId;
		data['goodsName'] = this.goodsName;
		data['goodsDetail'] = this.goodsDetail;
		return data;
	}
}

class ProductDeatilDataGoodcommants {
	int sCORE;
	String comments;
	int discussTime;
	String userName;

	ProductDeatilDataGoodcommants({this.sCORE, this.comments, this.discussTime, this.userName});

	ProductDeatilDataGoodcommants.fromJson(Map<String, dynamic> json) {
		sCORE = json['SCORE'];
		comments = json['comments'];
		discussTime = json['discussTime'];
		userName = json['userName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['SCORE'] = this.sCORE;
		data['comments'] = this.comments;
		data['discussTime'] = this.discussTime;
		data['userName'] = this.userName;
		return data;
	}
}

class ProductDeatilDataAdvertespicture {
	String toPlace;
	String pictureAddress;

	ProductDeatilDataAdvertespicture({this.toPlace, this.pictureAddress});

	ProductDeatilDataAdvertespicture.fromJson(Map<String, dynamic> json) {
		toPlace = json['TO_PLACE'];
		pictureAddress = json['PICTURE_ADDRESS'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TO_PLACE'] = this.toPlace;
		data['PICTURE_ADDRESS'] = this.pictureAddress;
		return data;
	}
}
