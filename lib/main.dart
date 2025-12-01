import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

// Widget สำหรับหน้าหลัก (Home Page)
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ฟังก์ชัน build - สร้างหน้าจอหลักและแสดงข้อมูลส่วนตัว
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold - โครงสร้างพื้นฐานของหน้าจอ
      body: SafeArea(
        // SafeArea - ป้องกันเนื้อหาทับกับ status bar หรือ notch
        child: Column(
          // Column - จัดเรียง widget แนวตั้ง
          children: [
            // ===== ส่วนที่ 1: Header Section (ส่วนหัวสีน้ำเงิน) =====
            Container(
              // Container - กล่องสำหรับจัดการ layout และตกแต่ง
              width: double.infinity, // ความกว้างเต็มหน้าจอ
              decoration: BoxDecoration(
                color: Colors.blue[700], // สีพื้นหลังน้ำเงินเข้ม
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ), // ระยะห่างภายใน (ซ้าย-ขวา 20, บน-ล่าง 30)
              child: Column(
                // จัดเรียงเนื้อหาในส่วนหัวแนวตั้ง
                children: [
                  // Text Widget - แสดงหัวข้อ "ข้อมูลส่วนตัว"
                  Text(
                    "ข้อมูลส่วนตัว",
                    style: TextStyle(
                      fontSize: 24, // ขนาดตัวอักษร
                      fontWeight: FontWeight.bold, // ความหนาตัวอักษร (ตัวหนา)
                      color: Colors.white, // สีตัวอักษรขาว
                    ),
                  ),
                  SizedBox(height: 20), // สร้างช่องว่างแนวตั้ง 20 pixel
                  // Container สำหรับรูปโปรไฟล์พร้อมกรอบสีขาว
                  Container(
                    padding: EdgeInsets.all(
                      6,
                    ), // ระยะห่างภายในรอบรูป (สร้างกรอบสีขาว)
                    decoration: BoxDecoration(
                      color: Colors.white, // พื้นหลังสีขาว (เป็นกรอบรูป)
                      borderRadius: BorderRadius.circular(80), // ทำให้เป็นวงกลม
                    ),
                    child: ClipOval(
                      // ClipOval - ตัดรูปให้เป็นวงกลม
                      child: Image.network(
                        // Image.network - โหลดรูปจากอินเทอร์เน็ตผ่าน URL
                        "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610167640.jpg",
                        width: 120, // ความกว้างรูป 120 pixel
                        height: 120, // ความสูงรูป 120 pixel
                        fit: BoxFit
                            .cover, // ให้รูปเต็มกรอบและครอบคลุมพื้นที่โดยอาจครอปส่วนเกิน
                      ),
                    ),
                  ),
                  SizedBox(height: 15), // ช่องว่าง 15 pixel
                  // Text Widget - แสดงชื่อ-นามสกุล
                  Text(
                    "Wisarut Yuensuk",
                    style: TextStyle(
                      color: Colors.white, // สีขาว
                      fontSize: 22, // ขนาดตัวอักษร
                      fontWeight: FontWeight.bold, // ตัวหนา
                    ),
                  ),
                  SizedBox(height: 5), // ช่องว่าง 5 pixel
                  // Text Widget - แสดงอีเมล
                  Text(
                    "wisarut.yuensuk@e-tech.ac.th",
                    style: TextStyle(
                      color: Colors.white, // สีขาว
                      fontSize: 14, // ขนาดตัวอักษร
                      fontWeight: FontWeight.w400, // ความหนาปานกลาง
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ), // ช่องว่างระหว่างส่วน Header กับส่วนข้อมูลด้านล่าง
            // ===== ส่วนที่ 2: Information Section (ส่วนแสดงข้อมูลรายละเอียด) =====
            Padding(
              // Padding - สร้างระยะห่างรอบๆ widget ภายใน
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ), // ระยะห่างซ้าย-ขวา 20 pixel
              child: Column(
                // จัดเรียงเนื้อหาแนวตั้ง
                crossAxisAlignment:
                    CrossAxisAlignment.start, // จัดเนื้อหาชิดซ้าย
                children: [
                  // Text Widget - หัวข้อ "ข้อมูลส่วนตัว" ด้านล่าง
                  Text(
                    "ข้อมูลส่วนตัว",
                    style: TextStyle(
                      fontSize: 18, // ขนาดตัวอักษร
                      fontWeight:
                          FontWeight.w600, // ความหนาตัวอักษร (ค่อนข้างหนา)
                      color: Colors.black87, // สีดำแก่
                    ),
                  ),
                  SizedBox(height: 15), // ช่องว่าง 15 pixel
                  // เรียกใช้ฟังก์ชัน _buildInfoRow เพื่อสร้างแถวข้อมูลเบอร์โทร
                  _buildInfoRow(
                    Icons.phone, // ไอคอนโทรศัพท์
                    Colors.green, // สีไอคอนเขียว
                    Colors
                        .green[50]!, // สีพื้นหลังเขียวอ่อน (! = บังคับให้ไม่เป็น null)
                    "แจ้งโทรศัพท์", // หัวข้อ
                    "081-234-5678", // ข้อมูลเบอร์โทร
                  ),
                  SizedBox(height: 12), // ช่องว่างระหว่างแต่ละแถว 12 pixel
                  // เรียกใช้ฟังก์ชัน _buildInfoRow เพื่อสร้างแถวข้อมูลวันเกิด
                  _buildInfoRow(
                    Icons.cake, // ไอคอนเค้ก (แทนวันเกิด)
                    Colors.pink, // สีไอคอนชมพู
                    Colors.pink[50]!, // สีพื้นหลังชมพูอ่อน
                    "วันเกิด", // หัวข้อ
                    "26 กันยายน 2568", // ข้อมูลวันเกิด
                  ),
                  SizedBox(height: 12), // ช่องว่าง 12 pixel
                  // เรียกใช้ฟังก์ชัน _buildInfoRow เพื่อสร้างแถวข้อมูลที่อยู่
                  _buildInfoRow(
                    Icons.location_on, // ไอคอนหมุดแผนที่ (สถานที่)
                    Colors.orange, // สีไอคอนส้ม
                    Colors.orange[50]!, // สีพื้นหลังส้มอ่อน
                    "ที่อยู่", // หัวข้อ
                    "ชลบุรี", // ข้อมูลที่อยู่
                  ),
                  SizedBox(height: 12), // ช่องว่าง 12 pixel
                  // เรียกใช้ฟังก์ชัน _buildInfoRow เพื่อสร้างแถวข้อมูลการศึกษา
                  _buildInfoRow(
                    Icons.school, // ไอคอนหมวกนักศึกษา (การศึกษา)
                    Colors.purple, // สีไอคอนม่วง
                    Colors.purple[50]!, // สีพื้นหลังม่วงอ่อน
                    "การศึกษา", // หัวข้อ
                    "วิทยาลัยเทคโนโลยีคาดละวินออก (อ.เกาะ)", // ข้อมูลการศึกษา
                  ),
                  SizedBox(height: 30), // ช่องว่างก่อนปุ่ม 30 pixel
                  // ===== ปุ่มนำทางไปหน้า 2 =====
                  SizedBox(
                    // SizedBox - กำหนดขนาดของ Widget ลูก
                    width: double.infinity, // ความกว้างเต็มหน้าจอ
                    height: 50, // ความสูง 50 pixel
                    child: ElevatedButton(
                      // ElevatedButton - ปุ่มที่มีพื้นหลังและเงา
                      onPressed: () => Navigator.pushNamed(context, '/second'),

                      // onPressed - ฟังก์ชันที่ทำงานเมื่อกดปุ่ม
                      // Navigator.pushNamed - นำทางไปยังหน้าที่มีชื่อ route '/second' (SecondPage)
                      style: ElevatedButton.styleFrom(
                        // กำหนดรูปแบบ (style) ของปุ่ม
                        backgroundColor:
                            Colors.blue[700], // สีพื้นหลังปุ่มน้ำเงินเข้ม
                        foregroundColor:
                            Colors.white, // สีตัวอักษรและไอคอนบนปุ่มเป็นสีขาว
                        shape: RoundedRectangleBorder(
                          // กำหนดรูปร่างปุ่ม
                          borderRadius: BorderRadius.circular(
                            25,
                          ), // มุมโค้งมน 25 pixel (ทำให้ปุ่มกลม)
                        ),
                      ),
                      child: Text(
                        // ข้อความที่แสดงบนปุ่ม
                        "ไปยังหน้า 2",
                        style: TextStyle(
                          fontSize: 16, // ขนาดตัวอักษร
                          fontWeight:
                              FontWeight.w600, // ความหนาตัวอักษร (ค่อนข้างหนา)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== ฟังก์ชัน _buildInfoRow =====
  // ฟังก์ชันสำหรับสร้างแถวข้อมูล (reusable widget) - ใช้ซ้ำได้หลายครั้งโดยส่งค่าที่แตกต่างกัน
  // ทำให้ไม่ต้องเขียนโค้ดซ้ำๆ สำหรับแต่ละรายการข้อมูล
  // รับพารามิเตอร์ 5 ตัว: ไอคอน, สีไอคอน, สีพื้นหลัง, หัวข้อ, ข้อมูล
  Widget _buildInfoRow(
    IconData icon, // ประเภทไอคอนที่จะแสดง (เช่น Icons.phone, Icons.cake)
    Color iconColor, // สีของไอคอน (เช่น Colors.green, Colors.pink)
    Color bgColor, // สีพื้นหลังของกล่องไอคอน (เช่น Colors.green[50])
    String label, // ข้อความหัวข้อ (เช่น "แจ้งโทรศัพท์", "วันเกิด")
    String value, // ข้อความข้อมูล (เช่น "081-234-5678", "26 กันยายน 2568")
  ) {
    return Container(
      // Container - กล่องหลักของแต่ละแถวข้อมูล
      padding: EdgeInsets.all(12), // ระยะห่างภายในทุกด้าน 12 pixel
      decoration: BoxDecoration(
        // BoxDecoration - ใช้ตกแต่งกล่อง (สี, มุมโค้ง, เงา)
        color: Colors.white, // สีพื้นหลังขาว
        borderRadius: BorderRadius.circular(8), // มุมโค้งมน 8 pixel
        boxShadow: [
          // boxShadow - สร้างเงาให้กับกล่อง (แบบ 3D)
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // สีเงาเทาโปร่งแสง 10% (0.1)
            spreadRadius: 1, // การกระจายของเงา 1 pixel
            blurRadius: 3, // ความเบลอของเงา 3 pixel
            offset: Offset(
              0,
              1,
            ), // ตำแหน่งเงา (แกน x=0, แกน y=1) เงาอยู่ด้านล่าง
          ),
        ],
      ),
      child: Row(
        // Row - จัดเรียง widget ภายในแนวนอน
        children: [
          // ===== ส่วนที่ 1 ของแถว: กล่องไอคอน =====
          Container(
            padding: EdgeInsets.all(10), // ระยะห่างภายในกล่องไอคอน 10 pixel
            decoration: BoxDecoration(
              color:
                  bgColor, // สีพื้นหลังของกล่องไอคอน (เขียวอ่อน, ชมพูอ่อน, ส้มอ่อน, ม่วงอ่อน)
              borderRadius: BorderRadius.circular(8), // มุมโค้งมน 8 pixel
            ),
            child: Icon(
              // Icon - แสดงไอคอน
              icon, // ไอคอนที่รับมาจากพารามิเตอร์
              size: 28, // ขนาดไอคอน 28 pixel
              color: iconColor, // สีไอคอนที่รับมาจากพารามิเตอร์
            ),
          ),
          SizedBox(width: 15), // ช่องว่างระหว่างกล่องไอคอนกับข้อความ 15 pixel
          // ===== ส่วนที่ 2 ของแถว: ข้อความหัวข้อและข้อมูล =====
          Column(
            // Column - จัดเรียงข้อความแนวตั้ง (หัวข้ออยู่ด้านบน ข้อมูลอยู่ด้านล่าง)
            crossAxisAlignment: CrossAxisAlignment.start, // จัดข้อความชิดซ้าย
            children: [
              // Text Widget - แสดงหัวข้อ (label) เช่น "แจ้งโทรศัพท์"
              Text(
                label, // ข้อความหัวข้อที่รับมาจากพารามิเตอร์
                style: TextStyle(
                  fontSize: 12, // ขนาดตัวอักษรเล็ก 12 pixel
                  color: Colors.grey[600], // สีเทา (สีหัวข้อ)
                ),
              ),
              SizedBox(height: 2), // ช่องว่างระหว่างหัวข้อกับข้อมูล 2 pixel
              // Text Widget - แสดงข้อมูล (value) เช่น "081-234-5678"
              Text(
                value, // ข้อมูลที่รับมาจากพารามิเตอร์
                style: TextStyle(
                  fontSize: 15, // ขนาดตัวอักษรใหญ่กว่าหัวข้อ 15 pixel
                  fontWeight:
                      FontWeight.w500, // ความหนาตัวอักษรปานกลาง-หนา (500)
                  color: Colors.black87, // สีดำแก่ (สีข้อมูลหลัก)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Picture with Follow Badge
                  Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              'http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610167640.jpg',
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'ติดตาม',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      // Stats Row
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatColumn('5', 'กำลังติดตาม'),
                            _buildStatColumn('828.1 K', 'ผู้ติดตาม'),
                            _buildStatColumn('329.9 K', 'ถูกใจและบันทึก'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Username
                  Row(
                    children: [
                      const Text(
                        'Wisarut_Yuensuk',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),

                  // TikTok ID
                  const Text(
                    '♪ wisarut126 ♪',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Follow Button and Share
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFEE500),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: const Text(
                            'ติดตาม',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Icon(
                          Icons.share_outlined,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Video Grid
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 0.65,
                children: [
                  _buildVideoThumbnail(
                    'http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610167640.jpg',
                    '1.2M',
                  ),
                  _buildVideoThumbnail(
                    'http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610167640.jpg',
                    '856K',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildVideoThumbnail(String imageUrl, String views) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // รูปภาพ
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),

          // Gradient overlay ด้านล่าง
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // จำนวนวิว
          Positioned(
            bottom: 8,
            left: 8,
            child: Row(
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  views,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}