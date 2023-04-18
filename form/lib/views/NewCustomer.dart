import 'package:flutter/material.dart';
import 'package:form/entity/Customer.dart';

import '../constants/index.dart';
import '../data/db.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  final _formKey = GlobalKey<FormState>();
  // controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController taxcodeController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.west),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Thêm khách hàng"),
          ],
        ),
        actions: const [
          SizedBox(
            width: 50,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Form
              Container(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Màu của shadow và độ trong suốt
                      spreadRadius:
                          5, // Độ rộng bóng được phát tán ra từ object
                      blurRadius: 7, // Độ nhoè của bóng
                      offset: const Offset(
                          0, 3), // Vị trí (x,y) của shadow so với widget cha
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tên khách hàng',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: Nguyễn Văn A',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Vui lòng nhập tên khách hàng';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),

                    // type
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Loại khách hàng',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: customerTypes.keys.first,
                            hintStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          items: List<DropdownMenuItem<int>>.generate(
                            customerTypes.length,
                            (index) {
                              final key = customerTypes.keys.toList()[index];
                              final value =
                                  customerTypes.values.toList()[index];

                              return DropdownMenuItem(
                                value: value,
                                child: Text(key),
                              );
                            },
                          ),
                          onChanged: (value) {
                            typeController.text = value.toString();
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Vui lòng lựa chọn loại khách hàng!!!';
                            }
                            return null;
                          },
                        )
                      ],
                    ),

                    // phone number
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Số điện thoại',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: phoneNumberController,
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: 0123456789',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return null;
                            } else if (value != '') {
                              try {
                                num phone = num.parse(value);
                                if (value.length < 10 || value.length > 14) {
                                  return 'Số điện thoại gồm 10-14 số';
                                }
                              } on FormatException {
                                return 'Số điện thoại chỉ bao gồm các ký tự số';
                              }
                            }
                            return null;
                          },
                        ),
                      ],
                    ),

                    // city
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Tỉnh/Thành Phố',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          items: cities.map<DropdownMenuItem<String>>(
                            (city) {
                              return DropdownMenuItem<String>(
                                value: city.name,
                                child: Text(city.name),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            cityController.text = value!;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Vui lòng lựa chọn loại khách hàng!!!';
                            }
                            return null;
                          },
                        )
                      ],
                    ),

                    //district
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Quận/Huyện',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        TextFormField(
                          controller: districtController,
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: Mễ Trì',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),

                    // address
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Địa chỉ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        TextFormField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: Số 8 Phạm Hùng',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),

                    // taxcode
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Mã số thuế',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: taxcodeController,
                          maxLength: 14,
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: 0105987432',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == '') {
                              return 'Vui lòng nhập mã số thuế của khách hàng';
                            } else if (value != '') {
                              try {
                                num taxtcode = num.parse(value!);
                                if (value.length < 10 || value.length > 13) {
                                  return 'Mã số thuế bao gồm 10-13 số';
                                }
                              } on FormatException {
                                return 'Mã số thuế chỉ bao gồm các ký tự số';
                              }
                            }
                          },
                        ),
                      ],
                    ),

                    // id
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Căn cước công dân',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: idController,
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: 00803212345',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == '') {
                              return 'Vui lòng nhập CCCD/CMND của khách hàng';
                            }
                            if (value != '') {
                              try {
                                num id = num.parse(value!);
                                if (value.length < 9 || value.length > 12) {
                                  return 'CCCD/CMND bao gồm 9-12 số';
                                }
                              } on FormatException {
                                return 'CCCD/CMND chỉ bao gồm các ký tự số';
                              }
                            }
                          },
                        ),
                      ],
                    ),

                    // email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Emai',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Ví dụ: sofrdream@gmail.com',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value != '') {
                              if (emailRegex.hasMatch(value!)) {
                                return null;
                              } else {
                                return 'Email nhập vào không hợp lệ';
                              }
                            }
                            return null;
                          },
                        ),
                      ],
                    ),

                    // description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Mô tả',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            hintText:
                                'Ví dụ: Chuyên bán các loai hàng gia dụng',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Butotn add
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Customer newCustomer = Customer(
                      name: nameController.text,
                      type: int.tryParse(typeController.text),
                      city: cityController.text,
                      taxcode: taxcodeController.text,
                      idNumber: idController.text,
                      phoneNumber: phoneNumberController.text,
                      address: addressController.text,
                      description: descriptionController.text,
                      district: districtController.text,
                      email: emailController.text,
                    );
                    customers.add(newCustomer);

                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Thêm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
