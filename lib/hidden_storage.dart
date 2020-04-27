import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


void openHiddenPage(BuildContext context, String AppBarText){
  Navigator.push(context, MaterialPageRoute(
      builder: (context){
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
                          folderSkin(context,'Fotos', Icons.photo_camera),
                          folderSkin(context,'Videos', Icons.video_library),
                        ]
                    ),
                    TableRow(
                        children: [
                          folderSkin(context,'Documentos', Icons.folder),
                          folderSkin(context,'Captura de tela', Icons.photo),
                        ]
                    ),
                    TableRow(
                        children: [
                          folderSkin(context,'Arquivos', Icons.archive),
                          folderSkin(context,'Compromissos', Icons.assignment),
                        ]
                    ),
                    TableRow(
                        children: [
                          folderSkin(context,'Bank Passwords', Icons.attach_money),
                          folderSkin(context,'Notas', Icons.note),
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
  ));
}
Widget folderSkin(BuildContext context, FolderName, IconData iconUsed) {
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
        hiddenStorage(context,FolderName);
      },
    ),
    padding: EdgeInsets.fromLTRB(50, 55, 45, 55),
    margin: EdgeInsets.all(10),
  );
}//cria uma pasta(fotos,videos,etc)
void hiddenStorage(BuildContext context, FolderName){
  Navigator.push(
    context, MaterialPageRoute(
    builder: (context){
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black54,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 50, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Galeria",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(height: 3,),
                    Text(FolderName,
                      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 20),
                    )
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
                    margin: EdgeInsets.all(50),
                    child: ClipRRect(
                    ),
                  );
                }, itemCount: 6)
          ],
        ),
      );
    }
  )
  );
}