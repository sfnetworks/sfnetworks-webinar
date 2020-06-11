library(tmap)
library(rnaturalearth)
library(sf)

rivers = ne_download(scale = 10, type = 'rivers_lake_centerlines', category = 'physical', returnclass = 'sf')
roads = ne_download(scale = 10, type = 'roads', category = 'cultural', returnclass = 'sf')

tm_rivers = tm_shape(rivers, projection = '+proj=robin') +
  tm_lines(col = '#48a2cf') +
  tm_credits('Data from Natural Earth.', size = 0.5, position = 'left') +
  tm_layout(frame = F, bg.color = 'transparent')

tmap_save(
  tm_rivers, '../figs/river_network.png', bg="transparent",
  dpi = 350, width = 2600, height = 1400, units = 'px'
)

tm_roads = tm_shape(roads, projection = '+proj=robin') +
  tm_lines(col = '#cf1325', lwd = 0.5) +
  tm_credits('Data from Natural Earth.', size = 0.5, position = 'left') +
  tm_layout(frame = F, bg.color = 'transparent')

tmap_save(
  tm_roads, '../figs/road_network.png', bg="transparent",
  dpi = 350, width = 2600, height = 1400, units = 'px'
)
