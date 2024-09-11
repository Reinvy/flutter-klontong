import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../model/category.dart';
import '../widget/wtext_form_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  XFile? imageC;
  Category? categoryC;
  final nameC = TextEditingController();
  final skuC = TextEditingController();
  final desC = TextEditingController();
  final priceC = TextEditingController();
  final weightC = TextEditingController();
  final heightC = TextEditingController();
  final lengthC = TextEditingController();
  final widthC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Produk",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  imageC = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  setState(() {});
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 60,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            WTextFormField(
              controller: nameC,
              title: "Nama Produk",
              hintText: "Masukan nama produk",
            ),
            const SizedBox(
              height: 12,
            ),
            WTextFormField(
              controller: desC,
              title: "Deskripsi",
              hintText: "Masukan deskripsi produk",
            ),
            const SizedBox(
              height: 12,
            ),
            WTextFormField(
              controller: skuC,
              title: "SKU",
              hintText: "Masukan sku produk",
            ),
            const SizedBox(
              height: 12,
            ),
            WTextFormField(
              controller: priceC,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              title: "Harga",
              hintText: "Masukan harga produk",
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: WTextFormField(
                    controller: weightC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    title: "Berat",
                    hintText: "Masukan berat",
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: WTextFormField(
                    controller: heightC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    title: "Tinggi",
                    hintText: "Masukan tinggi",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: WTextFormField(
                    controller: lengthC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    title: "Panjang",
                    hintText: "Masukan panjang",
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: WTextFormField(
                    controller: widthC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    title: "Lebar",
                    hintText: "Masukan lebar",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () {},
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
