import 'package:flutter/material.dart';

const String userName = "Dang Hoang Phuong";
const String receive = "receive";
const String tranfer = "tranfer";
const String time = "Hôm qua, 21 Thg 03 2023";

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://th.bing.com/th/id/R.32de54ef34e76f1a150d28577694b658?rik=pS84ql50R9cXqg&pid=ImgRaw&r=0"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
            child: Column(
              children: const <Widget>[
                // More Button
                MoreButton(),

                // bank account balance
                BankAccBalance(),

                // nav bar list
                NavBar(),

                // Transaction history
                TransactionHistory(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      width: double.infinity,
      // height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        // Historical Heading
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Lịch sử giao dịch",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Icon(Icons.replay)
            ],
          ),
        ),

        // Historical List
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [Text(time)],
            ),
            // List
            Column(
              children: const [
                // deal
                Bill(
                  type: receive,
                  userName: userName,
                  billContent: "em Mi trả nợ em Phương",
                  amount: "500.000",
                ),
                Bill(
                  type: tranfer,
                  userName: userName,
                  billContent: "Đêm qua em Doanh tuyệt lắm:>",
                  amount: "500.000",
                ),
                Bill(
                  type: tranfer,
                  userName: userName,
                  billContent: "Đêm qua em Doanh tuyệt lắm:>",
                  amount: "500.000",
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}

class Bill extends StatelessWidget {
  final String type;
  final String userName;
  final String billContent;
  final String amount;

  const Bill(
      {required this.type,
      required this.userName,
      required this.billContent,
      required this.amount});

  Icon icon() {
    if (type == "receive") {
      return const Icon(
        Icons.subdirectory_arrow_right_outlined,
        color: Colors.green,
      );
    }
    return const Icon(
      Icons.subdirectory_arrow_left_outlined,
      color: Colors.red,
    );
  }

  String amountString() {
    if (type == "receive") {
      return "+ $amount";
    }
    return "- $amount";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon(),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(billContent)
                  ]),
            ],
          ),
          Text(
            amountString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// MoreButton
class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 30),
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Center(
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

// BankAccBalance
class BankAccBalance extends StatelessWidget {
  const BankAccBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Stack(
                children: const [
                  Icon(
                    Icons.home_filled,
                    size: 50,
                    color: Colors.orange,
                  ),
                  Positioned(
                    top: 10.0,
                    right: 10.0,
                    bottom: 0,
                    child:
                        Icon(Icons.restaurant, size: 30.0, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text("Số dư khả dụng"),
                  Text(
                    "1.234.567đ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

// NavBar
class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Nav bar item
            NavBarItem(
              icon: Icons.credit_card,
              title: "Tài khoản và thẻ",
            ),

            NavBarItem(
              icon: Icons.attach_money_outlined,
              title: "Rút tiền",
            ),

            NavBarItem(
              icon: Icons.compare_arrows_outlined,
              title: "Chuyển tiền",
            ),

            NavBarItem(
              icon: Icons.qr_code_2_outlined,
              title: "Mã QR",
            ),
          ]),
    );
  }
}

// NavBarItem
class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const NavBarItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.orange,
            size: 30,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
