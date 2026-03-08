import 'package:flutter/material.dart';

class FoodDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10),

                /// TOP BAR
                Row(
  children: [
    Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),

    SizedBox(width: 15),

    Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Food Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "EDIT",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    ),
  ],
                  
                ),

                SizedBox(height: 20),

                /// FOOD IMAGE
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [

                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "lib/assets/image/image7.png",
                          width:double.infinity,
                          height: 210,
                          
                        ),
                      ),
                    ),

                    /// LEFT TAG
                    Positioned(
                      bottom: 15,
                      left: 45,
                      child: tag("Breakfast"),
                    ),

                    /// RIGHT TAG
                    Positioned(
                      bottom: 15,
                      right: 45,
                      child: tag("Delivery"),
                    ),

                    /// SLIDER DOTS
                    Positioned(
                      bottom: 10,
                      child: Row(
                        children: [
                          dot(true),
                          dot(false),
                          dot(false),
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: 20),

                /// FOOD NAME + PRICE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      "Chicken Thai Biriyani",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),

                    Text(
                      "\$60",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                /// LOCATION + REVIEW
                Row(
                  children: [

                    Icon(Icons.location_on,
                        size: 16,
                        color: Colors.grey),

                    SizedBox(width: 5),

                    Text(
                      "Kentucky 39495",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12),
                    ),

                    Spacer(),

                    Icon(Icons.star,
                        size: 16,
                        color: Colors.orange),

                    SizedBox(width: 3),

                    Text(
                      "4.9",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 4),

                    Text(
                      "(10 Reviews)",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12),
                    )
                  ],
                ),

                SizedBox(height: 25),

                /// INGREDIENT TITLE
                Text(
                  "INGRIDIENTS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),

                SizedBox(height: 20),

                /// INGREDIENT ROW 1
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [

                    ingredient(Icons.emoji_food_beverage, "Salt"),
                    ingredient(Icons.restaurant, "Chicken"),
                    ingredient(Icons.circle, "Onion"),
                    ingredient(Icons.spa, "Garlic"),
                    ingredient(Icons.local_florist, "Pappers"),
                  ],
                ),

                SizedBox(height: 20),

                /// INGREDIENT ROW 2
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [

                    ingredient(Icons.whatshot, "Ginger"),
                    ingredient(Icons.eco, "Broccoli"),
                    ingredient(Icons.circle_outlined, "Orange"),
                    ingredient(Icons.grass, "Walnut"),
                    ingredient(Icons.spa_outlined, "Herbs"),
                  ],
                ),

                SizedBox(height: 25),

                /// DESCRIPTION
                Text(
                  "Description",
                  style: TextStyle(
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text(
                  "Lorem ipsum dolor sit amet, consetur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.",
                  style: TextStyle(
                      color: Colors.grey,
                      height: 1.5),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),

      /// BOTTOM MENU
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 30),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(30)),
        ),

        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [

            Icon(Icons.grid_view, color: Colors.orange),

            Icon(Icons.menu, color: Colors.grey),

            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.orange,
                    width: 2),
              ),
              child: Icon(Icons.add,
                  color: Colors.orange),
            ),

            Icon(Icons.notifications_none,
                color: Colors.grey),

            Icon(Icons.person_outline,
                color: Colors.grey),
          ],
        ),
      ),
    );
  }

  /// TAG
  Widget tag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  /// DOT
  Widget dot(bool active) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      height: 6,
      width: active ? 16 : 6,
      decoration: BoxDecoration(
        color:
            active ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  /// INGREDIENT ICON
  Widget ingredient(IconData icon, String name) {
    return Column(
      children: [

        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(0xffFDE8E2),
            shape: BoxShape.circle,
          ),

          child: Icon(
            icon,
            color: Colors.orange,
          ),
        ),

        SizedBox(height: 6),

        Text(
          name,
          style: TextStyle(
              fontSize: 11,
              color: Colors.grey),
        )
      ],
    );
  }
}