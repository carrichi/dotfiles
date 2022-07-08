-- Hightlight using all available possible hightlight modes in every filetype
require 'colorizer'.setup(nil, {
  css = true;
  javascript = true;
  html = {
    mode = 'foreground'
  }
})

