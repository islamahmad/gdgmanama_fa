import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart'; // Add this line.

void main() {
  runApp(MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: new RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final WordPair wordPair = new WordPair.random();
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase, //+ ' ' + pair.second.toUpperCase(),
        style: _biggerFont,
      ),
      leading: CircleAvatar(
        child: Text(pair.first.substring(0, 1).toUpperCase() +
            pair.second.substring(0, 1).toUpperCase()),
      ),
      trailing: Icon(Icons.add_box),
      subtitle: Text(pair.second),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return new Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
