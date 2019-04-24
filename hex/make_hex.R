library(magick)
library(magrittr)
library(showtext)

## Loading Google fonts (http://www.google.com/fonts)
font_add_google("Gochi Hand", "gochi")
## Automatically use showtext to render text for future devices
showtext_auto()

waldo_uri <- "https://s3.amazonaws.com/baristanet/baristanetnew/wp-content/uploads/2018/07/whereswaldo.jpg"
logo_uri <- "https://jeroen.github.io/images/Rlogo.png"

waldo <- waldo_uri%>%
  image_read()

logo <- logo_uri%>%
  image_read()%>%
  image_background("none")%>%
  image_rotate(25)%>%
  image_scale("x25")

waldoR <- waldo%>%
  image_scale("x400")%>%
  image_composite(logo, offset = "+125+283")

image_write(waldoR,path = 'waldoR.png')
image_write(waldo,path = 'waldo.png')
image_write(logo,path = 'logoR.png')

waldoR%>%
  hexSticker::sticker(
    package = 'whereami',
    s_x=1,
    s_y=.75,
    s_width = 1,
    s_height = 1,
    h_fill='white',
    p_family = "gochi",
    p_color = "#870C0E",
    h_color = "#870C0E",
    filename = 'hex/whereami.png'
)

image_read('hex/whereami.png')%>%
  image_scale('x200')%>%
  image_write(path = 'hex/whereami_small.png')
