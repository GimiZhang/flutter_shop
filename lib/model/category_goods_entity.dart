class CategoryGoodsEntity {
	String code;
	List<CategoryGoodsData> data;
	String message;

	CategoryGoodsEntity({this.code, this.data, this.message});

	CategoryGoodsEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		if (json['data'] != null) {
			data = new List<CategoryGoodsData>();(json['data'] as List).forEach((v) { data.add(new CategoryGoodsData.fromJson(v)); });
		}
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['message'] = this.message;
		return data;
	}
}

class CategoryGoodsData {
	String image;
	double oriPrice;
	double presentPrice;
	String goodsId;
	String goodsName;

	CategoryGoodsData({this.image, this.oriPrice, this.presentPrice, this.goodsId, this.goodsName});

	CategoryGoodsData.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		oriPrice = json['oriPrice'];
		presentPrice = json['presentPrice'];
		goodsId = json['goodsId'];
		goodsName = json['goodsName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['oriPrice'] = this.oriPrice;
		data['presentPrice'] = this.presentPrice;
		data['goodsId'] = this.goodsId;
		data['goodsName'] = this.goodsName;
		return data;
	}
}
