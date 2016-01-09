for i=1,8 do
    if get_window_name() == "DesktopConsole" .. i then
        set_window_workspace(i)
        set_window_below()
        undecorate_window()
        set_skip_pager(true)
        set_skip_tasklist(true)
        set_window_type("WINDOW_TYPE_UTILITY")
        set_window_geometry2(50,50,1180,680)
    end
end
