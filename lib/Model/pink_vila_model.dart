class PinkVilaModel {
  List<Nodes> nodes;

  PinkVilaModel({this.nodes});

  PinkVilaModel.fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      nodes = new List<Nodes>();
      json['nodes'].forEach((v) {
        nodes.add(new Nodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nodes != null) {
      data['nodes'] = this.nodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nodes {
  Node node;

  Nodes({this.node});

  Nodes.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node.toJson();
    }
    return data;
  }
}

class Node {
  String title;
  String nidDontUse;
  String fieldPhotoImageSection;
  String path;
  String nid;

  Node(
      {this.title,
        this.nidDontUse,
        this.fieldPhotoImageSection,
        this.path,
        this.nid});

  Node.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    nidDontUse = json['nid_dont_use'];
    fieldPhotoImageSection = json['field_photo_image_section'];
    path = json['path'];
    nid = json['nid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['nid_dont_use'] = this.nidDontUse;
    data['field_photo_image_section'] = this.fieldPhotoImageSection;
    data['path'] = this.path;
    data['nid'] = this.nid;
    return data;
  }
}