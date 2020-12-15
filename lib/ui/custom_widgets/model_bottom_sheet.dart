import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher/core/view_models/subjects_view_model.dart';

void modelBottomSheet(context,subjects,length){
  showModalBottomSheet(
      context: context,
      builder: (builder){
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          ),
          height: 260.0,
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 4),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('${subjects[index].name}'),
                              Consumer<SubjectsViewModel>(
                                builder: (context, model, child){
                                  return myRadio(
                                      index: index,
                                      groupValue: model.groupValue,
                                      onChange: (index){
                                        model.changeRadioValue(index);
                                      }
                                  );
                                },
                              )

                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Divider(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancel')
                        ),
                        Container(
                          height: 29,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Consumer<SubjectsViewModel>(
                            builder: (context, model ,child){
                              return FlatButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text('Done',style: TextStyle(color: Colors.white),)
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }
  );
}

Widget myRadio({index, groupValue ,Function onChange}){
  return Radio(
      value: index,
      groupValue: groupValue,
      onChanged: onChange
  );
}

