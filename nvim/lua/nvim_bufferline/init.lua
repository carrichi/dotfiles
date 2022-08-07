require('bufferline').setup{
	options = {
		mode = "tabs",
		diagnostics = "nvim_lsp",
		offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
		show_close_icon = false,
		always_show_bufferline = false
	}
}
