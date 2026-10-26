# Memoriê — gerar APK pelo GitHub

1. Crie um repositório no GitHub chamado `memorie`.
2. Envie todos os arquivos e pastas deste projeto para a raiz do repositório. Confirme que `lib/main.dart`, `pubspec.yaml` e `.github/workflows/build-apk.yml` aparecem no GitHub.
3. Abra a aba **Actions** do repositório.
4. Escolha **Gerar APK do Memorie** e pressione **Run workflow** (ou envie os arquivos para disparar automaticamente).
5. Quando terminar com sucesso, abra a execução e, na área **Artifacts**, baixe `memorie-apk`.
6. Extraia o ZIP baixado para encontrar `app-release.apk`.

Observação: esta versão já inclui um jogo funcional e uma estrutura Flutter válida. Para compilar, use o repositório inteiro, não apenas `main.dart`.
