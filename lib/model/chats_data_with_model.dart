class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Phone Seller",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/1.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Laptop Seller",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/5.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Watch Seller",
    lastMessage: "Do you have update...",
    image: "assets/images/9.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "HPhones Seller",
    lastMessage: "You’re welcome :)",
    image: "assets/images/14.png",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "IPad Seller",
    lastMessage: "Thanks",
    image: "assets/images/19.png",
    time: "6d ago",
    isActive: false,
  ),
];