#!/bin/bash
set -eux

# Nuitkaビルドスクリプト (macOSユニバーサルバイナリ対応)

# 1. arm64向けにビルド
uv run python -m nuitka --onefile --standalone --macos-target-arch=arm64 chatbot.py
mv chatbot.bin chatbot_arm64.bin

# # 2. x86_64向けにビルド (AppleシリコンMacではRosetta経由で実行)
# arch -x86_64 uv run python -m nuitka --onefile --standalone --macos-target-arch=x86_64 chatbot.py
# mv chatbot.bin chatbot_x86_64.bin
