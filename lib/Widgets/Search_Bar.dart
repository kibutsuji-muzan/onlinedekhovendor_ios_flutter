import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class searchBar extends StatefulWidget{
  final void Function(String) onSearch;
  searchBar({required this.onSearch});

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {

  TextEditingController _searchController=TextEditingController();

   handleSearch(){
    final searchText=_searchController.text;
  widget.onSearch(searchText);
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Container(
            height: 40,
            child:
            TextField(
              controller:_searchController ,
              decoration: InputDecoration(
                  hintText: "Search",

                  suffixIcon:  IconButton(
                    icon: Icon(Icons.search,),
                    onPressed: handleSearch,

    ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  )
              ),
            ),
          ),
        )
      ],
    );



  }}