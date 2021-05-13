import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'create_event_page.dart';
import 'messages_store.dart';

class FavoriteMessagesList extends StatefulWidget {
  final EventsStore _data;
  final String _eventTitle;

  FavoriteMessagesList(this._data, this._eventTitle);

  @override
  State<StatefulWidget> createState() =>
      _FavoriteMessagesListState(_data, _eventTitle);
}

class _FavoriteMessagesListState extends State<FavoriteMessagesList> {
  final EventsStore _data;
  final String _eventTitle;

  _FavoriteMessagesListState(this._data, this._eventTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: _data.size,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(
              left: 7,
              right: 7,
            ),
            child: RaisedButton(
              // todo: Ask about button background color
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: null,
              onLongPress: () => {
                _data.elementAt(i).selectMessage(true),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventPage(
                      eventTitle: _eventTitle,
                      isEventSelected: true,
                      selectedMessage: _data.elementAt(i),
                      data: _data,
                    ),
                  ),
                )
              },
              child: Row(
                children: [Text(_data.eventsList[i].message)],
              ),
            ),
          );
        },
      ),
    );
  }
}
