import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not_hesaplama/constant/app_constant.dart';
import 'package:flutter_dinamik_not_hesaplama/helper/data_helper.dart';
import 'package:flutter_dinamik_not_hesaplama/model/ders.dart';
import 'package:flutter_dinamik_not_hesaplama/widgets/ders_listesi.dart';
import 'package:flutter_dinamik_not_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:flutter_dinamik_not_hesaplama/widgets/krediler_dropdown_widget.dart';
import 'package:flutter_dinamik_not_hesaplama/widgets/ortalama_g%C3%B6ster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.OrtalamaHesapla()),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://2.bp.blogspot.com/-cvBj-Oh96GA/WY2daszt5BI/AAAAAAAAVac/XrDf2Eo1IW8ci4ZkG8DQfop7PWoW3WYzwCLcBGAs/s1600/ORIMrxL.jpg%22"),
                    fit: BoxFit.cover),
              ),
              child: DersListesi(
                silinenEleman: (index) {
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: HarfDropdownWidget(
                  onHarfSecildi: (harf) {
                    secilenHarfDegeri = harf;
                  },
                ),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: KrediDropdownWidget(
                  onKrediSecildi: (kredi) {
                    secilenKrediDegeri = kredi;
                  },
                ),
              )),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Colors.red,
                iconSize: 31,
              ),
            ],
          ),
          SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: TextFormField(
        onSaved: (deger) {
          setState(() {
            girilenDersAdi = deger!;
          });
        },
        validator: (s) {
          if (s!.length <= 0) {
            return "Ders Adını Giriniz";
          } else
            return null;
        },
        decoration: InputDecoration(
          hintText: "Ders Giriniz",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
        ),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
