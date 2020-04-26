import 'calculator.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


openHiddenPage(String AppBarText,) {
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      title: Text(AppBarText),
    ),
    body:
        ListView(
          children:
          <Widget>[
            Container(
              child: Table(
                children: [
                  TableRow(
                      children: [
                        folderSkin('Fotos', Icons.photo_camera),
                        folderSkin('Videos', Icons.video_library),
                      ]
                  ),
                  TableRow(
                      children: [
                        folderSkin('Documentos', Icons.folder),
                        folderSkin('Captura de tela', Icons.photo),
                      ]
                  ),
                  TableRow(
                      children: [
                        folderSkin('Arquivos', Icons.archive),
                        folderSkin('Compromissos', Icons.assignment),
                      ]
                  ),
                  TableRow(
                      children: [
                        folderSkin('Bank Passwords', Icons.attach_money),
                        folderSkin('Notas', Icons.note),
                      ]
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
Widget folderSkin(String FolderName, IconData iconUsed) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey[900],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20)
    ),
    child: IconButton(
      padding: EdgeInsets.all(20),
      icon: Icon(iconUsed),
      onPressed: () {
        hiddenStorage(FolderName);
      },
    ),
    padding: EdgeInsets.fromLTRB(50, 55, 45, 55),
    margin: EdgeInsets.all(10),
  );
}//cria uma pasta(fotos,videos,etc)
hiddenStorage(FolderName){
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Text(FolderName),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Galery",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SliverStaggeredGrid.countBuilder(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      child: ClipRRect(
                        child: Image.asset("assets/$index.png"),
                      ),
                    );
                  }, itemCount: 5)
            ],
          ),
        );
      }



