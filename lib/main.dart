import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeUI(),
    );
  }
}

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('Bookopedia',
          style: TextStyle(
            fontSize: 34.0,
            fontFamily: 'Lobster',
            color: Colors.white,
          ),

        ),
        centerTitle: true,
        backgroundColor: Colors.teal[900],

      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Books('A game of Thrones', 'Goarge RR Martin', 4.2,'book1',13.5),
          Books('Angels And Demons', 'Dan Brown', 4.2,'book3',13.5),
          Books('Maze Runner', 'James Dashner', 4.2,'book4',13.5),
        ],
      ),
    );
  }
}

class Books extends StatelessWidget {
  final String name;
  final String author;
  final String image;
  final double rating;
  final double price;


  Books(this.name,this.author,this.rating,this.image,this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[600],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset('assets/$image.jpg'),
              title: Text(name,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22.0,

                ),

              ),
              subtitle: Text(author,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18.0,

                ),
              ),
            ),
            ListTile(
              title: Text('Rating: $rating',
                style: TextStyle(
                  fontSize: 16.0,

                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details(name,author,image,price)),
                );
              },
              icon: Icon(Icons.shopping_cart_checkout_outlined,
                color: Colors.grey[800],
                size: 22.0,
              ),
              label: Text('Buy Now',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18.0,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Details extends StatelessWidget {
  final String name;
  final String author;
  final String image;
  final double price;

  Details(this.name,this.author,this.image,this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Get books',
          style: TextStyle(
            fontFamily: 'Lobster',
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[800],
      ),
      body: Container(
        color: Colors.grey[400],
        child: Padding(

          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Book Name: $name\n',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Inter',
                ),
              ),
              Image.asset('assets/$image.jpg'),
              Text('\nAuthor : $author',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Inter',
                ),
              ),

              Text('\nShort Description: "Game of Thrones" is an acclaimed fantasy series filled with power struggles, complex characters, and gripping drama centered around the battle for control of the Seven Kingdoms.'),
              Text('\nPrice: \$$price',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),

                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}