#!/bin/bash

APP_NAME="macOS屏蔽更新补丁"

echo "开始创建DMG文件..."

# 清理之前的临时文件
rm -rf "temp_dmg"
rm -f "$APP_NAME.dmg"

# 创建临时目录
mkdir -p "temp_dmg"

# 复制文件到临时目录
cp "安装屏蔽更新" "temp_dmg/"
cp "卸载屏蔽更新" "temp_dmg/"
cp "docs/README.pdf" "temp_dmg/安装:卸载说明.pdf"
cp -r ".background.jpg" "temp_dmg/"

# 设置文件权限
chmod +x "temp_dmg/安装屏蔽更新"
chmod +x "temp_dmg/卸载屏蔽更新"

# 创建DMG文件
echo "正在创建DMG文件..."
hdiutil create -volname "$APP_NAME" -srcfolder "temp_dmg" -ov -format UDRW "test.dmg"

hdiutil attach "test.dmg" -mountpoint /Volumes/"$APP_NAME"
osascript set_view.scpt
SetFile -a C "/Volumes/$APP_NAME"
hdiutil detach "/Volumes/$APP_NAME"
hdiutil convert test.dmg -format UDZO -imagekey zlib-level=9 -o "$APP_NAME.dmg"
rm -rf temp_dmg test.dmg
