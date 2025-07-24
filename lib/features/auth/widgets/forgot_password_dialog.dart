import 'package:flutter/material.dart';
import 'package:rumo/features/auth/repositories/auth_repository.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({super.key});

  @override
  State<ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? _feedback;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text("Esqueci minha senha"),
    content: Form(
      key: _formKey,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'E-mail'),
            controller: _emailController,
            validator: (value) {
              final invalidEmailText = 'Insira um e-mail válido';

              if (value == null || value.trim().isEmpty) {
                return invalidEmailText;
              }

              final email = value.trim();

              if (!email.contains('@') || !email.contains('.')) {
                return invalidEmailText;
              }

              final parts = email.split('@');
              final firstPart = parts[0];

              if (firstPart.trim().isEmpty) {
                return invalidEmailText;
              }

              final lastPart = parts[1];

              if (lastPart.trim().isEmpty || !lastPart.contains('.')) {
                return invalidEmailText;
              }

              if (lastPart.startsWith('.') || lastPart.endsWith('.')) {
                return invalidEmailText;
              }
              return null;
            },
            enabled: !isLoading,
          ),
          if (isLoading)
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: CircularProgressIndicator(),
            ),
          if (_feedback != null)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                _feedback!,
                style: TextStyle(
                  color:
                      _feedback ==
                          'Enviamos um link de redefinição para seu e-mail.'
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
        ],
      ),
    ),

    actions: [
      TextButton(
        onPressed: isLoading
            ? null
            : () async {
                if (!_formKey.currentState!.validate()) return;
                setState(() {
                  isLoading = true;
                  _feedback = null;
                });
                try {
                  final authRepository = AuthRepository();
                  await authRepository.sendPasswordResetEmail(
                    email: _emailController.text.trim(),
                  );
                  setState(() {
                    _feedback =
                        "Enviamos um link de redefinição para seu e-mail.";
                  });
                } on AuthException catch (error) {
                  setState(() {
                    _feedback = error.getMessage();
                  });
                } catch (error) {
                  setState(() {
                    _feedback = "Ocorreu um erro inesperado.";
                  });
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
        child: Text("Enviar email"),
      ),
    ],
  );
}
