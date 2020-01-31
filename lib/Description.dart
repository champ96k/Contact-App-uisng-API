import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Description extends StatefulWidget {
  var description, data, index;
  Description(this.data, this.index);

  @override
  _DescriptionState createState() => _DescriptionState(this.data, this.index);
}

class _DescriptionState extends State<Description> {
  var dataPage, indexPage;
  _DescriptionState(this.dataPage, this.indexPage);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 16,
        title: Text(
          "Contact",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[

              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {

                },
              )
            ],
          ),

          Container(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              leading: Text(dataPage[indexPage]['Name']),
              title: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Icon(Icons.favorite_border),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: IconButton(
                  icon: Icon(Icons.rate_review),
                  onPressed: () {
                    
                  },
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.42,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Text(dataPage[indexPage]['Mobile']),
              title: Padding(
                padding: const EdgeInsets.only(left: 32),
                child: GestureDetector(
                  onTap: () {
                   launch("tel:${dataPage[indexPage]['Mobile']}"); 
                  },
                  child: CircleAvatar(
                    radius: 20, 
                    backgroundColor: Colors.transparent,
                    child: Image(
                      image: AssetImage("images/pic2.png"),
                    )
                  ),
                )
              ),
              trailing: GestureDetector(
                 onTap: () {
                   launch("sms:${dataPage[indexPage]['Mobile']}"); 
                  },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 20,
                  child: Image(
                    image: AssetImage("images/pic3.png"),
                  )
                ),
              )
            ),
          ),

           ListTile(
            leading: Text(dataPage[indexPage]['EmailID']),
            trailing: GestureDetector(
               onTap: () {
                   launch("mailto:${dataPage[indexPage]['EmailID']}");
                  },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 16,
                child: Image(
                  image: AssetImage("images/pic6.png"),
                 )
                ),
            )
          ),


         

          ListTile( 
            leading: Text("Video Call"),
            trailing: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 16,
                child: Image(
                  image: AssetImage("images/pic5.png"),
                )),
          ),
          ListTile(
            leading: Text("WhatsaApp"),
            trailing: GestureDetector(
              onTap: () {
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 16,
                child: Image(
                  image: AssetImage("images/pic4.png"),
                )
              ),
            )
          ),

           ListTile(
            leading: Text(dataPage[indexPage]['Gender']),
            trailing: Text("Gender")
          ),




          Container(
            height: 0.90,
            color: Colors.grey[300],
          ),
          ListTile(
            title: Text("26 Jan 8:59 PM"),
            subtitle: Text("+919890181173"),
            trailing: Text("Incoming 1m 26s"),
          ),
          ListTile(
            title: Text("25 Jan 9:09 AM"),
            subtitle: Text("+919890181173"),
            trailing: Text("Incoming 2m 26s"),
          ),
        ],
      ),
    );
  }
}
