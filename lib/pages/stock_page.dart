import 'package:flutter/material.dart';

class InventoryItem {
  String name;
  String description;

  InventoryItem({required this.name, required this.description});
}

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final List<InventoryItem> _items = [
    InventoryItem(
        name: 'Tap to change name', description: 'Edit item Description'),
    // InventoryItem(name: 'Item 2', description: 'Description for Item 2'),
    // InventoryItem(name: 'Item 3', description: 'Description for Item 3'),
  ]; // Example initial items

  void _addItem() {
    setState(() {
      _items.add(
        InventoryItem(
          name: 'Tap to change name ${_items.length + 1}',
          description: 'Edit item Description ${_items.length + 1}',
        ),
      );
    });
    _showNotification('Item added');
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
    _showNotification('Item deleted');
  }

  void _editItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newName = _items[index].name;
        String newDescription = _items[index].description;

        return AlertDialog(
          backgroundColor: Colors.blueGrey,
          title: const Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  newName = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  newDescription = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _items[index].name = newName;
                  _items[index].description = newDescription;
                });
                Navigator.of(context).pop();
                _showNotification('Item updated');
              },
              child: const Text('Save', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Inventory'),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image.asset(
            //   'images/paint.jpeg',
            //   fit: BoxFit.cover,
            // ),
            ListView.builder(
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(_items[index].name),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _deleteItem(index);
                  },
                  background: Container(
                    decoration: const BoxDecoration(color: Colors.black87),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(
                      _items[index].name,
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(_items[index].description),
                    leading: const Icon(Icons.inventory),
                    onTap: () {
                      _editItem(index);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
