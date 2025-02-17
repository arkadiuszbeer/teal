% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/module_nested_tabs.R
\name{ui_nested_tabs}
\alias{ui_nested_tabs}
\alias{ui_nested_tabs.default}
\alias{ui_nested_tabs.teal_modules}
\alias{ui_nested_tabs.teal_module}
\title{Create a UI of nested tabs of \code{teal_modules}}
\usage{
ui_nested_tabs(id, modules, datasets, depth = 0L)

\method{ui_nested_tabs}{default}(id, modules, datasets, depth = 0L)

\method{ui_nested_tabs}{teal_modules}(id, modules, datasets, depth = 0L)

\method{ui_nested_tabs}{teal_module}(id, modules, datasets, depth = 0L)
}
\arguments{
\item{id}{(\code{character(1)})\cr
module id}

\item{modules}{(\code{teal_modules}) the modules which will be displayed in the teal application.
See \code{\link[=modules]{modules()}} and \code{\link[=module]{module()}} for more details.}

\item{datasets}{(\code{FilteredData})\cr
object to store filter state and filtered datasets, shared across modules. For more
details see \code{\link[teal.slice:FilteredData]{teal.slice::FilteredData}}}

\item{depth}{(\code{integer(1)})\cr
number which helps to determine depth of the modules nesting.}
}
\value{
depending on class of \code{modules}:
\itemize{
\item \code{teal_module}: instantiated UI of the module
\item \code{teal_modules}: \code{tabsetPanel} with each tab corresponding to recursively
calling this function on it.
}
}
\description{
Each \code{teal_modules} is translated to a \code{tabsetPanel} and each
of its children is another tab-module called recursively. The UI of a
\code{teal_module} is obtained by calling the \code{ui} function on it.
}
\details{
The \code{datasets} argument is required to resolve the teal arguments in an
isolated context (with respect to reactivity)
}
\examples{
mods <- teal:::get_dummy_modules()
datasets <- teal:::get_dummy_datasets()
app <- shinyApp(
  ui = function() {
    tagList(
      teal:::include_teal_css_js(),
      textOutput("info"),
      fluidPage( # needed for nice tabs
        teal:::ui_nested_tabs("dummy", modules = mods, datasets = datasets)
      )
    )
  },
  server = function(input, output, session) {
    active_module <- teal:::srv_nested_tabs(
      "dummy",
      datasets = datasets,
      modules = mods
    )
    output$info <- renderText({
      paste0("The currently active tab name is ", active_module()$label)
    })
  }
)
\dontrun{
runApp(app)
}
}
\keyword{internal}
