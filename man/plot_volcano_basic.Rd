% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_volcano_basic.R
\name{plot_volcano_basic}
\alias{plot_volcano_basic}
\title{Plot basic volcano}
\usage{
plot_volcano_basic(
  df,
  col_significant = "#41AB5D",
  col_other = "grey",
  sig_text = "(significant)",
  insig_text = "(not significant)",
  size_gg = 3,
  shape = 21,
  stroke = 0.2,
  col_border = NULL,
  plot_segments = T
)
}
\arguments{
\item{df}{a data.frame with at least columns gene, logFC, pvalue and significant.}

\item{col_significant}{the color of significant proteins/rows.}

\item{col_other}{the color of non-significnt proteins/rows.}

\item{sig_text}{string. text for significant interactor to be displayed in legend.}

\item{insig_text}{string. Text for non-significant interactors to be displayed in legend.}

\item{size_gg}{the size of the points.}

\item{shape}{the shape of the points. Default is 21 corresponding to circles.}

\item{stroke}{numeric. stroke width.}

\item{col_border}{string. a color for the outline of points.}

\item{plot_segments}{plot volcano plot segments, i.e. two lines with x and y axis intercept.}
}
\description{
takes in a data.frane with the columns gene, logFC, pvalue and significant 
to draw a volcano. Optionally, a column indicating 'color' (string) can be supplied to 
indicate the volcano color scheme and whether to draw names of specific proteins. See
details section for plotting aesthetics.
}
\examples{
\dontrun{

# run example data
p = example_data \%>\% 
calc_mod_ttest() \%>\%
  id_significant_proteins(fdr_cutoff = 0.1) \%>\%
  plot_volcano_basic() \%>\%
  plot_overlay(as.bait('BCL2')) \%>\%
  volcano_theme()

# add a ggplot title
p + ggtitle('Example volcano plot') 

}
}
