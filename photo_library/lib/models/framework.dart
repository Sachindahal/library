// void main() {
  
//  //Create new user
//  //Create 5(pkr,dhangadi,chtwn,ktm,htd) album for this user
//  //Insert new item on this album
//  //Modify the album name
//  //Rename the item name
//  //Insert another Item
//  //Add 5 tags to this item
//  //Insert 5 items to each album
//  //Show albums in Library
//  //Show images in an album
//  //Show all content of library
  
//  User user = new User("birat11");
//  print('username is ${user.uid}');
  
//  Album a1 = new Album("Pokhara Album");

//  Library library1 = new Library("Library1",user);
  
//  library1.create_album(a1);
  
//  Item i11 = new Item("Item1","Item1_url");
//  Item i12 = new Item("Item2","Item2_url");
//  Item i13 = new Item("Item3","Item3_url");
//  Item i14 = new Item("Item4","Item4_url"); 
//  Item i15 = new Item("Item5","Item5_url"); 
  
//  a1.add_item(i11);
//  a1.add_item(i12);
//  a1.add_item(i13);
//  a1.add_item(i14);
//  a1.add_item(i15);
 
//  library1.show_albums();
//  a1.show_items();
 
  
// }

import 'dart:io';
import 'package:scoped_model/scoped_model.dart';

class User{
  String uid;
  int age;
  String email;
 
  User(String uid){
    this.uid = uid;
  }
}

class Library extends Model {
  User usr;
  String libraryName;
  List<Album> albums;

  Library(){
    this.usr=null;
    this.libraryName = "This is default Library Name";
    albums = new List<Album>();
  }

  Library.withName(String name,User usr){
    this.usr = usr;
    this.libraryName = name; 
    albums = new List<Album>();
  }
  
  Library.withAlbum(String name,User usr,Album album){
    this.usr = usr;
    albums = new List<Album>();
    this.albums.add(album);
    this.libraryName = name;
  }

  setLibName(String name){
    this.libraryName=name;
    notifyListeners();
  }

  setUserName(User usr){
    this.usr=usr;
    notifyListeners();
  }

  createAlbum(String album,File albumIcon){
    Album a = new Album.withIcon(album,albumIcon);
    this.albums.add(a);
    notifyListeners();
  }
  
  updateUserEmail(String email){
  	this.usr.email = email; 
  }
  
  showAlbums(){
    //iterate through the album list and show album name
    if(albums!=null){
      for (Album a in albums){ 			
       a.showAlbumName();
      }
    }
  }
  
  showLibraryContents(){
  //   iterate through albums and for each album call album.show_items
  //  if(albums!=null){
  //     for(Album a in albums){
  //       a.show_album_name();
  //       for(Item i in a){
  //         i.show_item_detail();
  //       }
  //     }
  //   }
  }
}

class Album extends Model {
  String albumName;
  File albumIcon;
  List<Item> items;
  
  Album(String name){
    this.albumName = name; 
    items = new List();
  }
  
  Album.withIcon(String name,File albumIcon){
    this.albumName=name;
    this.albumIcon=albumIcon;
  }

  Album.withItem(String name, Item i){
    this.albumName=name;
    items = new List();
    this.items.add(i);
  }
 
  addItem(Item i){
    this.items.add(i);
    notifyListeners();
  }
  
  showAlbumName(){
    print("album name:${this.albumName}");
  }
  
  showItems(){
    //iterate through item list and print item name,tags and image
    if(items!=null){
    	for(Item i in items){
        i.showItemDetail();
     }  
    } 
  }
}

class Item{
  String itemDescr;
  List<String> itemTags;
  //Image img;
  String imgUrl;
  
  Item(String name,String img){
    this.itemDescr = name;
    this.imgUrl = img;
    this.itemTags = new List<String>();
  }

  renameImage(String name){
    this.itemDescr = name;
  }  
  
  showItemDetail(){
    print("item description:${this.itemDescr}");
    if(itemTags != null){
      for(String t in itemTags){
        print("Items tag:$t");
      } 
    }   
    print("item image url:${this.imgUrl}");
  }
}