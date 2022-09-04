module main

import vweb

const (
	version = "0.0.1"
	storage_file_location = "./storage.data"
	vebview_js_art = "\n█   █ ████ ████  █   █ █ ████ █   █   █     █  ███\n█   █ █    █   █ █   █ █ █    █   █   █     █ █   \n ▓ ▓  ▓▓▓▓ ▓▓▓▓   ▓ ▓  ▓ ▓▓▓▓  ▓ ▓ ▓ ▓      ▓  ▓▓ \n ▒ ▒  ▒    ▒   ▒  ▒ ▒  ▒ ▒     ▒ ▒ ▒ ▒   ▒  ▒    ▒\n  ░   ░░░░ ░░░░    ░   ░ ░░░░   ░   ░  ░  ░░  ░░░ \n"
)

struct Server {
    vweb.Context
}

struct Size{
	width	int		= 640
	height	int		= 480
}

type WindowPlacement=voidptr //for windows

struct WebviewManager{
mut:
	id					int				= latest_id++
	config				Config			= app_config
	webview				Webview_t
    is_fullscreen       bool
    is_always_on_top    bool
	hwnd_style			int							//for windows
	hwnd_style_ex		int							//for windows
	window_placement	WindowPlacement				//for windows
	is_decorated		bool						//for windows
	title				string						//for windows
}

struct Config {
	title			string	= "Vebview.JS"
	debug			bool	//= false
	port			int		= 7001
	main_page		string	= "index.html"
	default_size	Size	= Size{}
	maximized		bool	//= false
	decorated		bool	= true
	resizable		bool	= true
	localhost		bool	= true
	custom_backend	string	//= ""
}

__global (
	latest_id			int
	app_config			Config
	user_data_storage	map[string]string
	webviews			[]WebviewManager
	alive_windows		map[int]bool
	active_window_count	int
)

fn cstr(the_string string) &char {
	return &char(the_string.str)
}