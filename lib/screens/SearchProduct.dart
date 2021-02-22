import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/searchWord.dart';

class SeacrchProduct extends StatefulWidget {
  static const routeName = '/Search-screen';
  @override
  _SeacrchProductState createState() => _SeacrchProductState();
}

class _SeacrchProductState extends State<SeacrchProduct> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    // Fetch the products from firebase when the product overview screen is loaded
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    // Runs on initial state only
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
            icon: Icon(Icons.search),
          ),
        ],
        centerTitle: true,
        title: Text('Search Product'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Text(products.items.toString()),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
    //throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text("SelectedResult"),
      ),
    );
    //throw UnimplementedError();
  }

  List<String> recentList = ["Text 1", "Text 3"];
  @override
  Widget buildSuggestions(BuildContext context) {
    final products = Provider.of<Products>(context);
    final searchWords = Provider.of<SearchWord>(context);
    searchWords.fetchAndSetWords();
    
    //recentList = searchWords.searchList;
    List<String> myList = [];
    myList = searchWords.searchList;
    

    // Iterating through the list of products and creating a list of product titles
    List<String> prodList = [];
    products.items.forEach(
      (prod) {
        prodList.add(prod.title.toLowerCase());
      },
    );

    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = myList
        : suggestionList.addAll(prodList.where(
            (element) => element.contains(query.toLowerCase()),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          onTap: (){
            String selectedResult = suggestionList[index];
            searchWords.addWord(selectedResult);
            showResults(context);
            Navigator.of(context).pop();
            
          },
        );
      },
    );
  }
}
