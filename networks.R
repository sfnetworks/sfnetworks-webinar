library(tmap)
library(rnaturalearth)
library(sf)

rivers = ne_download(scale = 10, type = 'rivers_lake_centerlines', category = 'physical', returnclass = 'sf')
railroads = ne_download(scale = 10, type = 'railroads', category = 'cultural', returnclass = 'sf')
railroads_simple = st_simplify(railroads)

tm_rivers = tm_shape(rivers, projection = '+proj=robin') +
  tm_lines(col = 'blue') +
  tm_credits('Data from Natural Earth', size = 0.5, position = 'left') +
  tm_layout(title = 'Rivers', frame = F, bg.color = 'transparent')

tm_railroads = tm_shape(railroads, projection = '+proj=robin') +
  tm_lines(col = 'black', lwd = 0.5) +
  tm_layout(frame = F, bg.color = 'transparent')
