// To parse this JSON data, do
//
//     final pinkVillaModel = pinkVillaModelFromJson(jsonString);

import 'dart:convert';

PinkVillaModel pinkVillaModelFromJson(String str) => PinkVillaModel.fromJson(json.decode(str));

String pinkVillaModelToJson(PinkVillaModel data) => json.encode(data.toJson());

class PinkVillaModel {
  PinkVillaModel({
    this.nodes,
  });

  List<NodeElement> nodes;

  factory PinkVillaModel.fromJson(Map<String, dynamic> json) => PinkVillaModel(
    nodes: List<NodeElement>.from(json["nodes"].map((x) => NodeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
  };
}

class NodeElement {
  NodeElement({
    this.node,
  });

  NodeNode node;

  factory NodeElement.fromJson(Map<String, dynamic> json) => NodeElement(
    node: NodeNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class NodeNode {
  NodeNode({
    this.title,
    this.nidDontUse,
    this.fieldPhotoImageSection,
    this.path,
    this.nid,
  });

  String title;
  String nidDontUse;
  String fieldPhotoImageSection;
  String path;
  String nid;

  factory NodeNode.fromJson(Map<String, dynamic> json) => NodeNode(
    title: json["title"],
    nidDontUse: json["nid_dont_use"],
    fieldPhotoImageSection: json["field_photo_image_section"],
    path: json["path"],
    nid: json["nid"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "nid_dont_use": nidDontUse,
    "field_photo_image_section": fieldPhotoImageSection,
    "path": path,
    "nid": nid,
  };
}
