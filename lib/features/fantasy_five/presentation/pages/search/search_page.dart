import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: height / 4,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Stack(children: [
                    Container(
                      padding: EdgeInsets.only(top: 150, left: 20),
                      child: Container(
                        width: width - 60,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFeeeeee),
                            borderRadius: BorderRadiusDirectional.circular(35)),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          onFieldSubmitted: (_) {
                            if (_.length == 0) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Type Something')));
                            } else {
                              // call(_);
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                            hintText: 'Search Players',
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 40),
                      child: Text('SEARCH',
                          style: GoogleFonts.getFont('Anton',
                              textStyle: TextStyle(
                                  fontSize: 60, color: Color(0xFF3d3d69)))),
                    ),
                  ])),
            ],
          ),
          // searchResult == null
          // ?
          SearchExample()
          // : Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Padding(
          //         padding: EdgeInsets.only(left: 20, right: 20),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: <Widget>[
          //             Text('Search result: ${searchResult.length}'),
          //             InkWell(
          //                 onTap: () {
          //                   setState(() {
          //                     searchResult = null;
          //                   });
          //                 },
          //                 child: Text('Clear result X', style: TextStyle(color: Colors.red))),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         height: height / 2 + 75,
          //         child: searchResult.length == 0
          //             ? Center(child: Text('Nothing Found :('))
          //             : ListView.builder(
          //                 physics: BouncingScrollPhysics(),
          //                 itemCount: searchResult.length,
          //                 itemBuilder: (context, index) {
          //                   return ListTile(
          //                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerInfo(searchResult[index]))),
          //                     leading: CircleAvatar(backgroundImage: AssetImage('assets/logo/${clubLogo[searchResult[index].playerClub]}')),
          //                     subtitle: Text('Tap to see detail'),
          //                     title: Text(searchResult[index].playerName),
          //                   );
          //                 }),
          //       ),
          //     ],
          //   ),
        ],
      ),
    );
  }
}

class SearchExample extends StatelessWidget {
  const SearchExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.getFont('Anton');
    return Container(
        child: Column(children: [
      SizedBox(height: 40),
      Text('# Search Examples',
          style: TextStyle(fontSize: 22, color: Colors.grey)),
      SizedBox(height: 30),
      Text('Mohammed Salah', style: style),
      SizedBox(height: 20),
      Text('Lionel Messi', style: style),
      SizedBox(height: 20),
      Text('Neymar JR.', style: style),
      SizedBox(height: 20),
      Text('David De Gea', style: style),
      SizedBox(height: 20),
      Text('David Luiz', style: style)
    ]));
  }
}
