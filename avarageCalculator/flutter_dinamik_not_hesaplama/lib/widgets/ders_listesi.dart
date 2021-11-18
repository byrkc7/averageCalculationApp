import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not_hesaplama/constant/app_constant.dart';
import 'package:flutter_dinamik_not_hesaplama/helper/data_helper.dart';
import 'package:flutter_dinamik_not_hesaplama/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function silinenEleman;
  const DersListesi({required this.silinenEleman, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: DataHelper.tumEklenenDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  silinenEleman(index);
                },
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          "Kredi: ${tumDersler[index].krediDegeri}  || Not Değeri: ${tumDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
           
            child: Center(
                child: Text(
              "Lütfen Ders Ekleyiniz..",
              style: Sabitler.baslikStyle,
            )),
          );
  }
}
