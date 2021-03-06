% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add.R
\name{add_trace}
\alias{add_trace}
\alias{add_markers}
\alias{add_text}
\alias{add_paths}
\alias{add_lines}
\alias{add_segments}
\alias{add_polygons}
\alias{add_sf}
\alias{add_ribbons}
\alias{add_area}
\alias{add_pie}
\alias{add_bars}
\alias{add_histogram}
\alias{add_histogram2d}
\alias{add_histogram2dcontour}
\alias{add_heatmap}
\alias{add_contour}
\alias{add_boxplot}
\alias{add_surface}
\alias{add_mesh}
\alias{add_scattergeo}
\alias{add_choropleth}
\title{Add trace(s) to a plotly visualization}
\usage{
add_trace(p, ..., data = NULL, inherit = TRUE)

add_markers(p, x = NULL, y = NULL, z = NULL, ..., data = NULL,
  inherit = TRUE)

add_text(p, x = NULL, y = NULL, z = NULL, text = NULL, ...,
  data = NULL, inherit = TRUE)

add_paths(p, x = NULL, y = NULL, z = NULL, ..., data = NULL,
  inherit = TRUE)

add_lines(p, x = NULL, y = NULL, z = NULL, ..., data = NULL,
  inherit = TRUE)

add_segments(p, x = NULL, y = NULL, xend = NULL, yend = NULL, ...,
  data = NULL, inherit = TRUE)

add_polygons(p, x = NULL, y = NULL, ..., data = NULL, inherit = TRUE)

add_sf(p, ..., x = ~x, y = ~y, data = NULL, inherit = TRUE)

add_ribbons(p, x = NULL, ymin = NULL, ymax = NULL, ..., data = NULL,
  inherit = TRUE)

add_area(p, r = NULL, t = NULL, ..., data = NULL, inherit = TRUE)

add_pie(p, values = NULL, labels = NULL, ..., data = NULL,
  inherit = TRUE)

add_bars(p, x = NULL, y = NULL, ..., data = NULL, inherit = TRUE)

add_histogram(p, x = NULL, y = NULL, ..., data = NULL, inherit = TRUE)

add_histogram2d(p, x = NULL, y = NULL, z = NULL, ..., data = NULL,
  inherit = TRUE)

add_histogram2dcontour(p, x = NULL, y = NULL, z = NULL, ...,
  data = NULL, inherit = TRUE)

add_heatmap(p, x = NULL, y = NULL, z = NULL, ..., data = NULL,
  inherit = TRUE)

add_contour(p, z = NULL, ..., data = NULL, inherit = TRUE)

add_boxplot(p, x = NULL, y = NULL, ..., data = NULL, inherit = TRUE)

add_surface(p, z = NULL, ..., data = NULL, inherit = TRUE)

add_mesh(p, x = NULL, y = NULL, z = NULL, ..., data = NULL,
  inherit = TRUE)

add_scattergeo(p, ...)

add_choropleth(p, z = NULL, ..., data = NULL, inherit = TRUE)
}
\arguments{
\item{p}{a plotly object}

\item{...}{Arguments (i.e., attributes) passed along to the trace \code{type}.
See \code{\link[=schema]{schema()}} for a list of acceptable attributes for a given trace \code{type}
(by going to \code{traces} -> \code{type} -> \code{attributes}). Note that attributes
provided at this level may override other arguments
(e.g. \code{plot_ly(x = 1:10, y = 1:10, color = I("red"), marker = list(color = "blue"))}).}

\item{data}{A data frame (optional) or \link[crosstalk:SharedData]{crosstalk::SharedData} object.}

\item{inherit}{inherit attributes from \code{\link[=plot_ly]{plot_ly()}}?}

\item{x}{the x variable.}

\item{y}{the y variable.}

\item{z}{a numeric matrix}

\item{text}{textual labels.}

\item{xend}{"final" x position (in this context, x represents "start")}

\item{yend}{"final" y position (in this context, y represents "start")}

\item{ymin}{a variable used to define the lower boundary of a polygon.}

\item{ymax}{a variable used to define the upper boundary of a polygon.}

\item{r}{For polar chart only. Sets the radial coordinates.}

\item{t}{For polar chart only. Sets the radial coordinates.}

\item{values}{the value to associated with each slice of the pie.}

\item{labels}{the labels (categories) corresponding to \code{values}.}
}
\description{
Add trace(s) to a plotly visualization
}
\examples{

p <- plot_ly(economics, x = ~date, y = ~uempmed)
p
p \%>\% add_markers()
p \%>\% add_lines()
p \%>\% add_text(text = ".")

# attributes declared in plot_ly() carry over to downstream traces,
# but can be overwritten
plot_ly(economics, x = ~date, y = ~uempmed, color = I("red")) \%>\% 
  add_lines() \%>\%
  add_markers(color = ~pop) \%>\%
  layout(showlegend = FALSE)

txhousing \%>\% 
  group_by(city) \%>\% 
  plot_ly(x = ~date, y = ~median) \%>\%
  add_lines(fill = "black")

ggplot2::map_data("world", "canada") \%>\%
  group_by(group) \%>\%
  plot_ly(x = ~long, y = ~lat) \%>\%
  add_polygons(hoverinfo = "none") \%>\%
  add_markers(text = ~paste(name, "<br />", pop), hoverinfo = "text",
    data = maps::canada.cities) \%>\%
  layout(showlegend = FALSE)

if (requireNamespace("sf", quietly = TRUE)) {
  nc <- sf::st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)
  plot_ly() \%>\% add_sf(data = nc)
}

plot_ly(economics, x = ~date) \%>\% 
  add_ribbons(ymin = ~pce - 1e3, ymax = ~pce + 1e3)
p <- plot_ly(plotly::wind, r = ~r, t = ~t) \%>\% add_area(color = ~nms)
layout(p, radialaxis = list(ticksuffix = "\%"), orientation = 270)
ds <- data.frame(
  labels = c("A", "B", "C"),
  values = c(10, 40, 60)
)

plot_ly(ds, labels = ~labels, values = ~values) \%>\%
  add_pie() \%>\%
  layout(title = "Basic Pie Chart using Plotly")
library(dplyr)
mtcars \%>\%
  count(vs) \%>\%
  plot_ly(x = ~vs, y = ~n) \%>\%
  add_bars()

plot_ly(x = ~rnorm(100)) \%>\% add_histogram()
plot_ly(x = ~LETTERS, y = ~LETTERS) \%>\% add_histogram2d()
z <- as.matrix(table(LETTERS, LETTERS))
plot_ly(x = ~LETTERS, y = ~LETTERS, z = ~z) \%>\% add_histogram2d()
plot_ly(MASS::geyser, x = ~waiting, y = ~duration) \%>\% 
add_histogram2dcontour()
plot_ly(z = ~volcano) \%>\% add_heatmap()
plot_ly(z = ~volcano) \%>\% add_contour()
plot_ly(mtcars, x = ~factor(vs), y = ~mpg) \%>\% add_boxplot()
plot_ly(z = ~volcano) \%>\% add_surface()
plot_ly(x = c(0, 0, 1), y = c(0, 1, 0), z = c(0, 0, 0)) \%>\% add_mesh()
}
\references{
\url{https://plot.ly/r/reference/}
}
\seealso{
\code{\link[=plot_ly]{plot_ly()}}
}
\author{
Carson Sievert
}
