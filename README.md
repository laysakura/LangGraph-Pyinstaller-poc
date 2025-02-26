LangGraphを使ったプロダクトをPyinstallerでシングルバイナリにして配布するPoC

## ビルド

```bash
% pip install pyinstaller
% ./build_mac.sh

% ll -h chatbot_arm64.bin
-rwxr-xr-x@ 1 sho.nakatani  staff    40M Feb 26 09:01 chatbot_arm64.bin
```

なかなか大きい。依存がたくさんあるからだろう。

## 実行

```bash
% export OPENAI_API_KEY="sk-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

% ./chatbot_arm64.bin
User (q/Q to quit): hi
================================== Ai Message ==================================

Hello! How can I assist you today?
User (q/Q to quit): Great!
================================== Ai Message ==================================

That's wonderful to hear! How can I help you today?
User (q/Q to quit): q
AI: Byebye
```

## ビルド結果


## Nuitka vs PyInstaller

PyInstaller は実行ファイルにスクリプトを圧縮し、実行時にファイルに展開してインタプリタ実行するアーキテクチャ。
ウィルススキャンに引っかかりやすい。

Nuitka はCにトランスパイルしてからコンパイル。

検討中の用途的に Nuitka の方が良い。
