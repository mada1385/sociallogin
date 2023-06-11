import 'dart:io';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:social_login/features/Projects/application/Projectprovider.dart';
import 'package:social_login/features/Projects/domain/ProjectModel.dart';
import 'package:social_login/features/user/application/userprovider.dart';
import 'package:social_login/shared/config/colors.dart';
import 'package:social_login/shared/config/mediaqueryconfig.dart';
import 'package:social_login/shared/main%20ui%20components/buttons.dart';
import 'package:social_login/shared/main%20ui%20components/customtext.dart';
import 'package:social_login/shared/main%20ui%20components/customtextfield.dart';
import 'package:social_login/shared/main%20ui%20components/relativewidgets.dart';
import 'package:social_login/shared/services/permisions/permissions.dart';
import 'package:social_login/shared/utils/uiutils.dart';

class Addproject extends StatefulWidget {
  const Addproject({Key key, this.project}) : super(key: key);
  final Project project;

  @override
  State<Addproject> createState() => _AddprojectState();
}

class _AddprojectState extends State<Addproject> {
  final List<String> ProjectType = ["مشروع مستمر", "صفقه سريعه"];
  String ProjectTypeval;
  String ProjectField;
  int ProjectCommunity;
  List<File> attachments = [];
  TextEditingController ctrl = TextEditingController();
  TextEditingController ProjectNameController = TextEditingController();
  TextEditingController TotalCapitalController = TextEditingController();
  TextEditingController NeededCapitalController = TextEditingController();
  TextEditingController partnerNumberController = TextEditingController();
  TextEditingController ProjectDetailsController = TextEditingController();
  TextEditingController expectedRevenueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    const oneSec = Duration(seconds: 10);
    // Timer.periodic(
    //     oneSec,
    //     (Timer t) => Provider.of<ProjectsProvider>(context, listen: false)
    //         .getComments(context, widget.project.id.toString(), false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userAction = Provider.of<UserProvider>(context);
    final userListner = Provider.of<UserProvider>(context, listen: false);
    final ProjectAction = Provider.of<ProjectsProvider>(context, listen: false);
    final ProjectListner = Provider.of<ProjectsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 131,
        elevation: 5,
        toolbarHeight: SizeConfig().hieghtr(80, context),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BackButton(),
            UI.widthsizedBox(4, context),
            const Customtext(
              "إضافة مشروع",
              color: backgroundcolor,
              size: 18,
            ),
          ],
        ),
        backgroundColor: secondarybackgroundcolor,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                UI.highetsizedBox(8, context),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Textfieldcomponents(
                          tittle: "اسم المشروع",
                          ProjectNameController: ProjectNameController),
                      UI.highetsizedBox(8, context),
                      DropDownMenuCmponent(
                          tittle: "اسم المشروع",
                          dropdownmenuFunction: (val) {
                            setState(() {
                              ProjectTypeval = val;
                            });
                          },
                          ProjectTypeval: ProjectTypeval,
                          ProjectType: ProjectType),
                      DropDownMenuCmponent(
                          tittle: "المجال",
                          dropdownmenuFunction: (val) {
                            setState(() {
                              ProjectField = val;
                            });
                          },
                          ProjectTypeval: ProjectField,
                          ProjectType: ProjectType),
                      UI.highetsizedBox(8, context),
                      Textfieldcomponents(
                          number: true,
                          tittle: "رأس المال الكلى",
                          ProjectNameController: TotalCapitalController),
                      UI.highetsizedBox(8, context),
                      Textfieldcomponents(
                          number: true,
                          tittle: "رأس المال المطلوب",
                          ProjectNameController: NeededCapitalController),
                      UI.highetsizedBox(8, context),
                      Textfieldcomponents(
                          number: true,
                          tittle: "عدد الشركاء المطلوبين",
                          ProjectNameController: partnerNumberController),
                      Textfieldcomponents(
                          number: true,
                          tittle: "الربح المتوقع",
                          ProjectNameController: expectedRevenueController),
                      UI.highetsizedBox(8, context),
                      Textfieldcomponents(
                          tittle: "تفاصيل المشروع",
                          ProjectNameController: ProjectDetailsController),
                      UI.highetsizedBox(8, context),
                      Column(
                        children: [
                          Customtext(
                            "المرفقات",
                            color: textcolor,
                            size: 12,
                          ),
                          UI.highetsizedBox(8, context),
                          GestureDetector(
                            onTap: () async {
                              // Permessions.getStoragePerm(context);
                              // FilePickerResult result = await FilePicker
                              //     .platform
                              //     .pickFiles(allowMultiple: true);

                              // if (result != null) {
                              //   List<File> files = result.paths
                              //       .map((path) => File(path))
                              //       .toList();
                              //   Provider.of<ProjectsProvider>(context,
                              //           listen: false)
                              //       .setfiles(files);
                              // } else {
                              //   // User canceled the picker
                              // }
                            },
                            child: OnlyhightRelativecontainer(
                              35,
                              child: Center(
                                child: Icon(
                                  PhosphorIcons.plus,
                                  size: 16,
                                  color: textcolor,
                                ),
                              ),
                              borderd: true,
                              raduis: 30,
                            ),
                          ),
                          UI.highetsizedBox(10, context),
                          Column(
                            children: Provider.of<ProjectsProvider>(context)
                                .files
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: OnlywidthRelativecontainer(320,
                                          borderd: true,
                                          raduis: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.document_scanner),
                                                UI.widthsizedBox(8, context),
                                                OnlywidthRelativecontainer(
                                                  270,
                                                  child: Customtext(
                                                      e.path.split("/").last),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ))
                                .toList(),
                          ),
                          UI.highetsizedBox(8, context),
                          if (Provider.of<UserProvider>(context)
                                  .user
                                  .community !=
                              1)
                            Customtext(
                              "المجتمع المستهدف",
                              color: textcolor,
                              size: 12,
                            ),
                          UI.highetsizedBox(8, context),
                          if (Provider.of<UserProvider>(context)
                                  .user
                                  .community !=
                              1)
                            RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                title: const Customtext("رواد"),
                                value: 1,
                                groupValue: ProjectCommunity,
                                onChanged: (val) {
                                  setState(() {
                                    ProjectCommunity = val;
                                  });
                                }),
                          if (Provider.of<UserProvider>(context)
                                  .user
                                  .community >=
                              2)
                            RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                title: const Customtext("مستثمر"),
                                value: 2,
                                groupValue: ProjectCommunity,
                                onChanged: (val) {
                                  setState(() {
                                    ProjectCommunity = val;
                                  });
                                }),
                          if (Provider.of<UserProvider>(context)
                                  .user
                                  .community >=
                              3)
                            RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                title: const Customtext("مميز"),
                                value: 3,
                                groupValue: ProjectCommunity,
                                onChanged: (val) {
                                  setState(() {
                                    ProjectCommunity = val;
                                  });
                                }),
                        ],
                      ),
                      AnimatedAccentButton(
                        onpressed: (thiscontext) async {
                          if (_formKey.currentState.validate()) {
                            if (ProjectCommunity != null) {
                              Map input = {
                                "title": ProjectNameController.text,
                                "type": ProjectType.indexOf(ProjectTypeval) + 1,
                                "investment_field_id": 1,
                                "total_capital":
                                    int.parse(TotalCapitalController.text),
                                "requested_capital":
                                    int.parse(NeededCapitalController.text),
                                "expected_revenue":
                                    int.parse(expectedRevenueController.text),
                                "partner_required_number":
                                    int.parse(partnerNumberController.text),
                                "details": ProjectDetailsController.text,
                                "attachments": [""],
                                "community": ProjectCommunity,
                                "project_stage": 1
                              };
                              final res = await ProjectAction.addproject(
                                  thiscontext, input);
                              if (res != null) {
                                ProjectNameController.clear();
                                NeededCapitalController.clear();
                                expectedRevenueController.clear();
                                partnerNumberController.clear();
                                ProjectDetailsController.clear();
                                TotalCapitalController.clear();
                                Navigator.pop(context);
                              }
                            } else {
                              UI.toast("برجاء ملئ لالختيارات");
                            }
                          }
                        },
                        tittle: "إضافة مشروع",
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownMenuCmponent extends StatelessWidget {
  const DropDownMenuCmponent({
    Key key,
    @required this.ProjectTypeval,
    @required this.ProjectType,
    @required this.dropdownmenuFunction,
    this.tittle,
  }) : super(key: key);

  final String ProjectTypeval;
  final List<String> ProjectType;
  final Function(String val) dropdownmenuFunction;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return OnlyhightRelativecontainer(
      80,
      child: Column(
        children: [
          Customtext(
            tittle,
            color: textcolor,
            size: 12,
          ),
          UI.highetsizedBox(8, context),
          OnlyhightRelativecontainer(
            50,
            child: DropdownButton(
              onChanged: dropdownmenuFunction,
              isExpanded: true,
              value: ProjectTypeval,
              items: ProjectType.map((e) => DropdownMenuItem(
                    child: Customtext(
                      e,
                      size: 12,
                    ),
                    value: e,
                  )).toList(),
            ),
            borderd: true,
            raduis: 30,
          )
        ],
      ),
    );
  }
}

class Textfieldcomponents extends StatelessWidget {
  const Textfieldcomponents({
    Key key,
    @required this.ProjectNameController,
    this.tittle,
    this.number = false,
  }) : super(key: key);

  final TextEditingController ProjectNameController;
  final String tittle;
  final bool number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customtext(
          tittle,
          color: textcolor,
          size: 12,
        ),
        UI.highetsizedBox(8, context),
        Container(
          constraints: BoxConstraints(maxHeight: 80),
          child: CustomTextfield(
            validator: 0,
            isnumber: number,
            controller: ProjectNameController,
          ),
        )
      ],
    );
  }
}
