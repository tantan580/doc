grab协议

能获取窗口外的鼠标键盘事件，wayland架构下，鼠标键盘事件只传给当前焦点所在窗口，其他窗口想拿，就要通过grab协议获取。