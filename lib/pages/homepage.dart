import 'package:flutter/material.dart';

class stateFulPracticing extends StatefulWidget {
  const stateFulPracticing({Key? key}) : super(key: key);

  @override
  State<stateFulPracticing> createState() => _stateFulPracticingState();
}

class _stateFulPracticingState extends State<stateFulPracticing> {
  List quotes = [
    "'We build our computer (systems) the way we build our cities: over time, without a plan, on top of ruins' – Ellen Ullman",
    "'Every great developer you know got there by solving problems they were unqualified to solve until they actually did it' – Patrick McKenzie",
    "'Rules of Optimization: Rule 1: Don’t do it. Rule 2 (for experts only): Don’t do it yet' – Michael A. Jackson",
    "'No one in the brief history of computing has ever written a piece of perfect software. It’s unlikely that you’ll be the first' – Andy Hunt",
    "'One of the best programming skills you can have is knowing when to walk away for a while.' – Oscar Godson",
    "'It’s hard enough to find an error in your code when you’re looking for it; it’s even harder when you’ve assumed your code is error-free' – Steve McConnell",
    "'The first 90% of the code accounts for the first 90% of the development time. The remaining 10% of the code accounts for the other 90% of the development time' – Tom Cargill",
    "'Good code is its own best documentation. As you’re about to add a comment, ask yourself, “How can I improve the code so that this comment isn’t needed?” Improve the code and then document it to make it even clearer' – Steve McConnell",
    "'One of my most productive days was throwing away 1000 lines of code ' – Ken Thompson",
    "'The computer was born to solve problems that did not exist before ' – Bill Gates "
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.amberAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    child: Center(
                        child: Text(
                  quotes[index % quotes.length],
                  style: TextStyle(fontStyle: FontStyle.italic),
                ))),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                onPressed: _showQuotes,
                icon: Icon(Icons.wb_sunny),
                label: Text("Inspire me quotes"),
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.blue,
          child: Center(
            child: Text(
              "Top 10 Developers inspiring Quotes",
              style: TextStyle(color: Colors.white, fontSize: 18.5),
            ),
          ),
        ),
      ),
    );
  }

  void _showQuotes() {
    setState(() {
      index += 1;
    });
  }
}
