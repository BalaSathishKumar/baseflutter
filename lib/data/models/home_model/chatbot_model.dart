class ChatBotListResponseModel {
  List<BotList>? botList;
  BotList? selectedBot;

  ChatBotListResponseModel({this.botList, this.selectedBot});

  ChatBotListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['bot_list'] != null) {
      botList = <BotList>[];
      json['bot_list'].forEach((v) {
        botList!.add(new BotList.fromJson(v));
      });
    }
    selectedBot = json['selectedBot'] != null
        ? new BotList.fromJson(json['selectedBot'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.botList != null) {
      data['bot_list'] = this.botList!.map((v) => v.toJson()).toList();
    }
    if (this.selectedBot != null) {
      data['selectedBot'] = this.selectedBot!.toJson();
    }
    return data;
  }
}

class BotList {
  int? botId;
  String? botName;

  BotList({this.botId, this.botName});

  BotList.fromJson(Map<String, dynamic> json) {
    botId = json['bot_id'];
    botName = json['bot_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bot_id'] = this.botId;
    data['bot_name'] = this.botName;
    return data;
  }
}