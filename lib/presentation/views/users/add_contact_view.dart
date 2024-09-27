import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/presentation/widgets/custom_text_field.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/formatters.dart';

class AddContactView extends StatefulWidget {
  const AddContactView({super.key, required this.bloc});
  final UsersBloc bloc;

  @override
  State<AddContactView> createState() => _AddContactViewState();
}

class _AddContactViewState extends State<AddContactView> {
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new contact")),
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<UsersBloc, UsersState>(
          bloc: widget.bloc,
          builder: (context, state) {
            return WButton(
              margin: const EdgeInsets.all(16).copyWith(top: 8),
              onTap: () {
                String phoneNumber = controllerPhone.text;
                phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

                if (!phoneNumber.startsWith("998")) {
                  phoneNumber = "998$phoneNumber";
                }
                widget.bloc.add(PostContactEvent(
                  phone: phoneNumber,
                  name: controllerName.text,
                  onSucces: () {
                    Navigator.pop(context);
                  },
                ));
              },
              isLoading: state.status.isInProgress,
              text: "Add contact",
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.color.contColor,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                title: "Full name",
                fillColor: Colors.transparent,
                controller: controllerName,
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              CustomTextField(
                title: "Phone number",
                hintText: "+998",
                fillColor: Colors.transparent,
                controller: controllerPhone,
                prefixIcon: AppIcons.phone.svg(),
                keyboardType: TextInputType.phone,
                formatter: [Formatters.phoneFormatter],
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
