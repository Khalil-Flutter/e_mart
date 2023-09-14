import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                  "https://scontent.fkhi2-3.fna.fbcdn.net/v/t39.30808-6/349954975_778921730442256_806127685097259317_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=a2f6c7&_nc_eui2=AeEN2BmsEa_GDH6ofeH5oFfR-4Nvq7XmDar7g2-rteYNqvzApg3F05xzv3hq_NQzStv6Iun0T_ZN1CimNrDJ18W-&_nc_ohc=q9DLuWRy4DIAX9aJiRH&_nc_ht=scontent.fkhi2-3.fna&oh=00_AfCcHl72myY3571-Mez0LUSMm0QqAsYa0JMeoTBPiu636w&oe=65011BB2",
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Muhammad Khalil Ur Rehman',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'khalilflutter508@gmail.com',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20.0),
            ListTile(
              title: const Text('Order History'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to the user's order history page.
              },
            ),
            ListTile(
              title: const Text('Shipping Address'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to the user's address book page.
              },
            ),
            ListTile(
              title: const Text('Payment Methods'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to the user's payment methods page.
              },
            ),
          ],
        ),
      ),
    );
  }
}
