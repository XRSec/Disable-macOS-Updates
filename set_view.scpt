tell application "Finder"
	tell disk "macOS屏蔽更新补丁"
		-- 打开卷宗确保视图可设置
		open
		-- 等待窗口完全打开
		delay 1
		
		-- 获取容器窗口引用
		set theWindow to container window
		
		-- 设置视图选项
		set current view of theWindow to icon view
		set toolbar visible of theWindow to false
		set statusbar visible of theWindow to false
		set sidebar width of theWindow to 0
		
		-- 设置图标视图选项
		set iconViewOptions to icon view options of theWindow
		set arrangement of iconViewOptions to not arranged
		
		-- 设置图标大小
		set icon size of iconViewOptions to 128
		
		-- 设置背景图（如果存在）
		try
            set theOptions to icon view options of theWindow
            set background picture of theOptions to file ".background.jpg"
			log "背景图片设置成功"
		on error
			log "请先显示隐藏文件，然后重新运行"
		end try
		
		-- 设置图标位置（根据您的文件修改）
		set position of item "安装屏蔽更新" to {200, 66}
		set position of item "卸载屏蔽更新" to {536, 66}
		set position of item "安装/卸载说明.pdf" to {368, 246}
		set position of item ".background.jpg" to {200, 500}
		set position of item ".fseventsd" to {400, 500}
		
		-- 设置窗口大小和位置
		set bounds of theWindow to {200, 200, 936, 636}
		
		-- 关闭窗口保存设置
		#close
	end tell
end tell