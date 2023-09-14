import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.message),
            trailing: Text(notification.timestamp),
            onTap: () {
              // Handle tapping on a notification item, e.g., navigate to a detailed notification view.
            },
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String timestamp;

  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
  });
}

final List<NotificationItem> notifications = [
  NotificationItem(
    title: 'New Message',
    message: 'You have a new message from John Doe.',
    timestamp: '2 hours ago',
  ),
  NotificationItem(
    title: 'Order Shipped',
    message: 'Your order #12345 has been shipped.',
    timestamp: 'Yesterday',
  ),
  NotificationItem(
    title: 'Promotion',
    message: 'Check out our latest promotions!',
    timestamp: '3 days ago',
  ),
];
