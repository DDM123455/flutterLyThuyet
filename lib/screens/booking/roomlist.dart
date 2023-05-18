import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/models/products.dart';
import 'package:flutterfinal/models/rooms.dart';
import 'package:flutterfinal/screens/product_detail/product_detali_screen.dart';
import 'showmodal_booking.dart';
class RoomItem2 extends StatelessWidget {
  final Map<String, dynamic> room;

  RoomItem2({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomObject = Room(
        id: room['_id'] ?? "1",
        roomName: room['roomName'] ?? '',
        price: room['price'] ?? 0.0,
        quantity: room['quantity'] ?? 1,
        imageRoom: room['imageRoom']);

    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, ProductDetailScreen.routeName,
                    //     arguments:
                    //     ProductDetailsArguments(hotel: widget.hotel));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 4,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(roomObject.imageRoom),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${roomObject.roomName}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  SizedBox(width: 5),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Giá: ${roomObject.price}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Add a button widget here
              Padding(
                padding: const EdgeInsets.only(right: 8.0,bottom: 17),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return BookHotelForm(pricePerNight: roomObject.price!.toDouble(),roomName: roomObject.roomName,);
                      },
                    );
                  },
                  child: Text('Đặt phòng'),
                ),
              ),
            ],
          ),
          // Add a Positioned widget to position the button at the top right corner of the widget
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Hot',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}