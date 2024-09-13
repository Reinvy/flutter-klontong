import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klontong/util/service_locator.dart';
import 'package:klontong/widget/wdropdown_button.dart';

import '../model/category.dart';
import '../provider/product_provider.dart';
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
        child: Form(
          key: formKey,
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
                      image: imageC == null
                          ? null
                          : DecorationImage(
                              image: FileImage(
                                File(imageC!.path),
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: imageC != null
                        ? null
                        : const Center(
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
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Wajib diisi";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              WTextFormField(
                controller: desC,
                title: "Deskripsi",
                hintText: "Masukan deskripsi produk",
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Wajib diisi";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              WdropdownButton(
                controller: categoryC,
                title: "Kategori",
                hintText: "Pilih kategori",
                onChanged: (value) {
                  categoryC = value;
                },
                validator: (p0) {
                  if (categoryC == null) {
                    return "Wajib diisi";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              WTextFormField(
                controller: skuC,
                title: "SKU",
                hintText: "Masukan sku produk",
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Wajib diisi";
                  }
                  return null;
                },
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
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Wajib diisi";
                  }
                  return null;
                },
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
                      title: "Berat (gram)",
                      hintText: "Masukan berat (gram)",
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Wajib diisi";
                        }
                        return null;
                      },
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
                      title: "Tinggi (cm)",
                      hintText: "Masukan tinggi (cm)",
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Wajib diisi";
                        }
                        return null;
                      },
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
                      title: "Panjang (cm)",
                      hintText: "Masukan panjang (cm)",
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Wajib diisi";
                        }
                        return null;
                      },
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
                      title: "Lebar (cm)",
                      hintText: "Masukan lebar (cm)",
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Wajib diisi";
                        }
                        return null;
                      },
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
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  final messenger = ScaffoldMessenger.of(context);
                  final colorScheme = Theme.of(context).colorScheme;
                  if (imageC == null) {
                    messenger.showSnackBar(
                      SnackBar(
                        backgroundColor: colorScheme.error,
                        content: Text(
                          "Masukan gambar terlebih dahulu",
                          style: TextStyle(
                            color: colorScheme.onError,
                          ),
                        ),
                      ),
                    );
                    return;
                  }
                  if (formKey.currentState!.validate()) {
                    try {
                      setState(() {
                        isLoading = true;
                      });
                      await sl<ProductProvider>().addProduct(
                        image: imageC!,
                        name: nameC.text,
                        description: desC.text,
                        category: categoryC!,
                        sku: skuC.text,
                        harga: int.parse(priceC.text),
                        weight: int.parse(weightC.text),
                        height: int.parse(heightC.text),
                        length: int.parse(lengthC.text),
                        width: int.parse(widthC.text),
                      );
                      messenger.showSnackBar(
                        SnackBar(
                          backgroundColor: colorScheme.primary,
                          content: Text(
                            "Produk berhasil ditambahkan",
                            style: TextStyle(
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      );
                      navigator.pop();
                    } catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                      messenger.showSnackBar(
                        SnackBar(
                          backgroundColor: colorScheme.error,
                          content: Text(
                            "Terdapat kesalahan saat menambahkan produk",
                            style: TextStyle(
                              color: colorScheme.onError,
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
                child: isLoading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    : Text(
                        "Simpan",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
