import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not_hesaplama/constant/app_constant.dart';
import 'package:flutter_dinamik_not_hesaplama/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({required this.onHarfSecildi, Key? key})
      : super(key: key);

  @override
  _HarfDropdownWidgetState createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade400,
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
        underline: Container(
          padding: Sabitler.dropDownPadding,
        ),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}
