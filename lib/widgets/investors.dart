import 'package:flutter/material.dart';
import 'package:flutter_tst/api/api_client.dart';
import '../global.dart';

class Investors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Startups _dt = startups!;

    ChunkItem? _chunk;
    CompanyDetails? _company;
    String? _addr;

    int _count  = _dt.data!.chunk.length;

    if (_dt.result) {
      _chunk = _dt.data!.chunk[5];
      _company = _chunk.company_details;
      _addr = '${_company.address.country}, ${_company.address.city}';
      _addr = _addr.length > 40 ? '${_addr.substring(0, 40)}...' : _addr;
    }
    return _dt.result
        ? Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        image: DecorationImage(
                          image: NetworkImage(_company!.logo.url),
                        ),
                      ),
                    ),
                    Text('Count $_count'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Company: ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text('${_company.name}'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Address: ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(_addr!),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20.0,
                    right: 15.0,
                  ),
                  height: 50.0,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Description : ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${_company.address.country}, ${_company.elevator_pitch}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Partner: ',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text('${_chunk!.screening.partner.name}'),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Text('Error Reading data.\nMessage: ${_dt.error_message}\nCode: ${_dt.error_code}');
  }
}
