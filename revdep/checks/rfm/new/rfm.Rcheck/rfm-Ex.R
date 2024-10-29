pkgname <- "rfm"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('rfm')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("rfm_barchart_data")
### * rfm_barchart_data

flush(stderr()); flush(stdout())

### Name: rfm_barchart_data
### Title: Bar chart data
### Aliases: rfm_barchart_data

### ** Examples

# using transaction data
analysis_date <- as.Date('2006-12-31')
rfm_order <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# bar chart data
rfm_barchart_data(rfm_order)

# using customer data
analysis_date <- as.Date('2007-01-01')
rfm_customer <- rfm_table_customer(rfm_data_customer, customer_id,
number_of_orders, recency_days, revenue, analysis_date)

# bar chart data
rfm_barchart_data(rfm_customer)




cleanEx()
nameEx("rfm_create_report")
### * rfm_create_report

flush(stderr()); flush(stdout())

### Name: rfm_create_report
### Title: RFM report
### Aliases: rfm_create_report

### ** Examples

## Not run: 
##D # analysis date
##D analysis_date <- as.Date('2006-12-31')
##D 
##D # generate rfm score
##D rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
##D revenue, analysis_date)
##D 
##D # segment names
##D segment_names <- c("Champions", "Potential Loyalist", "Loyal Customers",
##D                    "Promising", "New Customers", "Can't Lose Them",
##D                    "At Risk", "Need Attention", "About To Sleep", "Lost")
##D 
##D # segment intervals
##D recency_lower <-   c(5, 3, 2, 3, 4, 1, 1, 1, 2, 1)
##D recency_upper <-   c(5, 5, 4, 4, 5, 2, 2, 3, 3, 1)
##D frequency_lower <- c(5, 3, 2, 1, 1, 3, 2, 3, 1, 1)
##D frequency_upper <- c(5, 5, 4, 3, 3, 4, 5, 5, 3, 5)
##D monetary_lower <-  c(5, 2, 2, 3, 1, 4, 4, 3, 1, 1)
##D monetary_upper <-  c(5, 5, 4, 5, 5, 5, 5, 5, 4, 5)
##D 
##D # generate segments
##D segments <- rfm_segment(rfm_result, segment_names, recency_lower,
##D recency_upper, frequency_lower, frequency_upper, monetary_lower,
##D monetary_upper)
##D 
##D rfm_create_report(rfm_result, segments, FALSE,
##D "Customer Segmentation Report")
## End(Not run)




cleanEx()
nameEx("rfm_heatmap_data")
### * rfm_heatmap_data

flush(stderr()); flush(stdout())

### Name: rfm_heatmap_data
### Title: Heatmap data
### Aliases: rfm_heatmap_data

### ** Examples

# using transaction data
analysis_date <- as.Date('2006-12-31')
rfm_order <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# heat map data
rfm_heatmap_data(rfm_order)

# using customer data
analysis_date <- as.Date('2007-01-01')
rfm_customer <- rfm_table_customer(rfm_data_customer, customer_id,
number_of_orders, recency_days, revenue, analysis_date)

# heat map data
rfm_heatmap_data(rfm_customer)




cleanEx()
nameEx("rfm_launch_app")
### * rfm_launch_app

flush(stderr()); flush(stdout())

### Name: rfm_launch_app
### Title: Launch shiny app
### Aliases: rfm_launch_app

### ** Examples

## Not run: 
##D rfm_launch_app()
## End(Not run)



cleanEx()
nameEx("rfm_plot_bar_chart")
### * rfm_plot_bar_chart

flush(stderr()); flush(stdout())

### Name: rfm_plot_bar_chart
### Title: RFM bar chart
### Aliases: rfm_plot_bar_chart rfm_bar_chart

### ** Examples

# using transaction data
analysis_date <- as.Date('2006-12-31')
rfm_order <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# bar chart
rfm_plot_bar_chart(rfm_order)




cleanEx()
nameEx("rfm_plot_heatmap")
### * rfm_plot_heatmap

flush(stderr()); flush(stdout())

### Name: rfm_plot_heatmap
### Title: RFM heatmap
### Aliases: rfm_plot_heatmap rfm_heatmap

### ** Examples

# using transaction data
analysis_date <- as.Date('2006-12-31')
rfm_order <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# heat map
# ggplot2
rfm_plot_heatmap(rfm_order)

# plotly
rfm_plot_heatmap(rfm_order, interactive = TRUE)

# using customer data
analysis_date <- as.Date('2007-01-01')
rfm_customer <- rfm_table_customer(rfm_data_customer, customer_id,
number_of_orders, recency_days, revenue, analysis_date)

# heat map
rfm_plot_heatmap(rfm_customer)




cleanEx()
nameEx("rfm_plot_histogram")
### * rfm_plot_histogram

flush(stderr()); flush(stdout())

### Name: rfm_plot_histogram
### Title: RFM histograms
### Aliases: rfm_plot_histogram rfm_histograms

### ** Examples

# using transaction data
analysis_date <- as.Date('2006-12-31')
rfm_order <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# histogram
# ggplot2
rfm_plot_histogram(rfm_order, metric = "frequency")

# plotly
rfm_plot_histogram(rfm_order, metric = "frequency", interactive = TRUE)

# using customer data
analysis_date <- as.Date('2007-01-01')
rfm_customer <- rfm_table_customer(rfm_data_customer, customer_id,
number_of_orders, recency_days, revenue, analysis_date)

# histogram
rfm_plot_histogram(rfm_customer)




cleanEx()
nameEx("rfm_plot_median_recency")
### * rfm_plot_median_recency

flush(stderr()); flush(stdout())

### Name: rfm_plot_median_recency
### Title: Median plots
### Aliases: rfm_plot_median_recency rfm_plot_median_frequency
###   rfm_plot_median_monetary

### ** Examples

# analysis date
analysis_date <- as.Date('2006-12-31')

# generate rfm score
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# segment names
segment_names <- c("Champions", "Potential Loyalist", "Loyal Customers",
                   "Promising", "New Customers", "Can't Lose Them",
                   "At Risk", "Need Attention", "About To Sleep", "Lost")

# segment intervals
recency_lower <-   c(5, 3, 2, 3, 4, 1, 1, 1, 2, 1)
recency_upper <-   c(5, 5, 4, 4, 5, 2, 2, 3, 3, 1)
frequency_lower <- c(5, 3, 2, 1, 1, 3, 2, 3, 1, 1)
frequency_upper <- c(5, 5, 4, 3, 3, 4, 5, 5, 3, 5)
monetary_lower <-  c(5, 2, 2, 3, 1, 4, 4, 3, 1, 1)
monetary_upper <-  c(5, 5, 4, 5, 5, 5, 5, 5, 4, 5)

# generate segments
segments <- rfm_segment(rfm_result, segment_names, recency_lower,
recency_upper, frequency_lower, frequency_upper, monetary_lower,
monetary_upper)

# plots
# visualize median recency
rfm_plot_median_recency(segments)

# plotly
rfm_plot_median_recency(segments, interactive = TRUE)

# sort in ascending order
rfm_plot_median_recency(segments, sort = TRUE, ascending = TRUE)

# default sorting is in descending order
rfm_plot_median_recency(segments, sort = TRUE)

# horizontal bars
rfm_plot_median_recency(segments, flip = TRUE)

# median frequency
rfm_plot_median_frequency(segments)

# median monetary value
rfm_plot_median_monetary(segments)




cleanEx()
nameEx("rfm_plot_order_dist")
### * rfm_plot_order_dist

flush(stderr()); flush(stdout())

### Name: rfm_plot_order_dist
### Title: Customers by orders
### Aliases: rfm_plot_order_dist rfm_order_dist

### ** Examples

# using transaction data
analysis_date <- as.Date('2006-12-31')
rfm_order <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# order distribution
rfm_plot_order_dist(rfm_order)

# horizontal bars
rfm_plot_order_dist(rfm_order, flip = TRUE)

# plotly
rfm_plot_order_dist(rfm_order, interactive = TRUE)

# using customer data
analysis_date <- as.Date('2007-01-01')
rfm_customer <- rfm_table_customer(rfm_data_customer, customer_id,
number_of_orders, recency_days, revenue, analysis_date)

# order distribution
rfm_plot_order_dist(rfm_customer)




cleanEx()
nameEx("rfm_plot_revenue_dist")
### * rfm_plot_revenue_dist

flush(stderr()); flush(stdout())

### Name: rfm_plot_revenue_dist
### Title: Revenue distribution
### Aliases: rfm_plot_revenue_dist

### ** Examples

# analysis date
analysis_date <- as.Date('2006-12-31')

# generate rfm score
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# segment names
segment_names <- c("Champions", "Potential Loyalist", "Loyal Customers",
                   "Promising", "New Customers", "Can't Lose Them",
                   "At Risk", "Need Attention", "About To Sleep", "Lost")

# segment intervals
recency_lower <-   c(5, 3, 2, 3, 4, 1, 1, 1, 2, 1)
recency_upper <-   c(5, 5, 4, 4, 5, 2, 2, 3, 3, 1)
frequency_lower <- c(5, 3, 2, 1, 1, 3, 2, 3, 1, 1)
frequency_upper <- c(5, 5, 4, 3, 3, 4, 5, 5, 3, 5)
monetary_lower <-  c(5, 2, 2, 3, 1, 4, 4, 3, 1, 1)
monetary_upper <-  c(5, 5, 4, 5, 5, 5, 5, 5, 4, 5)

# generate segments
segments <- rfm_segment(rfm_result, segment_names, recency_lower,
recency_upper, frequency_lower, frequency_upper, monetary_lower,
monetary_upper)

# segment summary
segment_overview <- rfm_segment_summary(segments)

# revenue distribution
# ggplot2
rfm_plot_revenue_dist(segment_overview)

# flip
rfm_plot_revenue_dist(segment_overview, flip = TRUE)

# plotly
rfm_plot_revenue_dist(segment_overview, interactive = TRUE)




cleanEx()
nameEx("rfm_plot_segment")
### * rfm_plot_segment

flush(stderr()); flush(stdout())

### Name: rfm_plot_segment
### Title: RFM Segmentation Plot
### Aliases: rfm_plot_segment

### ** Examples

# analysis date
analysis_date <- as.Date('2006-12-31')

# generate rfm score
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# segment names
segment_names <- c("Champions", "Potential Loyalist", "Loyal Customers",
                   "Promising", "New Customers", "Can't Lose Them",
                   "At Risk", "Need Attention", "About To Sleep", "Lost")

# segment intervals
recency_lower <-   c(5, 3, 2, 3, 4, 1, 1, 1, 2, 1)
recency_upper <-   c(5, 5, 4, 4, 5, 2, 2, 3, 3, 1)
frequency_lower <- c(5, 3, 2, 1, 1, 3, 2, 3, 1, 1)
frequency_upper <- c(5, 5, 4, 3, 3, 4, 5, 5, 3, 5)
monetary_lower <-  c(5, 2, 2, 3, 1, 4, 4, 3, 1, 1)
monetary_upper <-  c(5, 5, 4, 5, 5, 5, 5, 5, 4, 5)

# generate segments
segments <- rfm_segment(rfm_result, segment_names, recency_lower,
recency_upper, frequency_lower, frequency_upper, monetary_lower,
monetary_upper)

# segment summary
segment_overview <- rfm_segment_summary(segments)

# treemaps
# default metric is customers
rfm_plot_segment(segment_overview)

# treemap of orders
rfm_plot_segment(segment_overview, metric = "orders")

# plotly
rfm_plot_segment(segment_overview, metric = "revenue", interactive = TRUE)




cleanEx()
nameEx("rfm_plot_segment_scatter")
### * rfm_plot_segment_scatter

flush(stderr()); flush(stdout())

### Name: rfm_plot_segment_scatter
### Title: Segment Scatter Plots
### Aliases: rfm_plot_segment_scatter

### ** Examples

# analysis date
analysis_date <- as.Date('2006-12-31')

# generate rfm score
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# segment names
segment_names <- c("Champions", "Potential Loyalist", "Loyal Customers",
                   "Promising", "New Customers", "Can't Lose Them",
                   "At Risk", "Need Attention", "About To Sleep", "Lost")

# segment intervals
recency_lower <-   c(5, 3, 2, 3, 4, 1, 1, 1, 2, 1)
recency_upper <-   c(5, 5, 4, 4, 5, 2, 2, 3, 3, 1)
frequency_lower <- c(5, 3, 2, 1, 1, 3, 2, 3, 1, 1)
frequency_upper <- c(5, 5, 4, 3, 3, 4, 5, 5, 3, 5)
monetary_lower <-  c(5, 2, 2, 3, 1, 4, 4, 3, 1, 1)
monetary_upper <-  c(5, 5, 4, 5, 5, 5, 5, 5, 4, 5)

# generate segments
segments <- rfm_segment(rfm_result, segment_names, recency_lower,
recency_upper, frequency_lower, frequency_upper, monetary_lower,
monetary_upper)

# visualize
# ggplot2
rfm_plot_segment_scatter(segments, "monetary", "recency")

# plotly
rfm_plot_segment_scatter(segments, "monetary", "recency", interactive = TRUE)




cleanEx()
nameEx("rfm_plot_segment_summary")
### * rfm_plot_segment_summary

flush(stderr()); flush(stdout())

### Name: rfm_plot_segment_summary
### Title: Visulaize segment summary
### Aliases: rfm_plot_segment_summary

### ** Examples

# analysis date
analysis_date <- as.Date('2006-12-31')

# generate rfm score
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# segment names
segment_names <- c("Champions", "Potential Loyalist", "Loyal Customers",
                   "Promising", "New Customers", "Can't Lose Them",
                   "At Risk", "Need Attention", "About To Sleep", "Lost")

# segment intervals
recency_lower <-   c(5, 3, 2, 3, 4, 1, 1, 1, 2, 1)
recency_upper <-   c(5, 5, 4, 4, 5, 2, 2, 3, 3, 1)
frequency_lower <- c(5, 3, 2, 1, 1, 3, 2, 3, 1, 1)
frequency_upper <- c(5, 5, 4, 3, 3, 4, 5, 5, 3, 5)
monetary_lower <-  c(5, 2, 2, 3, 1, 4, 4, 3, 1, 1)
monetary_upper <-  c(5, 5, 4, 5, 5, 5, 5, 5, 4, 5)

# generate segments
segments <- rfm_segment(rfm_result, segment_names, recency_lower,
recency_upper, frequency_lower, frequency_upper, monetary_lower,
monetary_upper)

# segment summary
segment_overview <- rfm_segment_summary(segments)

# plot segment summary
# summarize metric for all segments
# ggplot2
rfm_plot_segment_summary(segment_overview)

# plotly
rfm_plot_segment_summary(segment_overview, interactive = TRUE)

# select metric to be visualized
rfm_plot_segment_summary(segment_overview, metric = "orders")

# sort the metric in ascending order
rfm_plot_segment_summary(segment_overview, metric = "orders", sort = TRUE,
  ascending = TRUE)

# default sorting is in descending order
rfm_plot_segment_summary(segment_overview, metric = "orders", sort = TRUE)

# horizontal bars
rfm_plot_segment_summary(segment_overview, metric = "orders", flip = TRUE)




cleanEx()
nameEx("rfm_segment")
### * rfm_segment

flush(stderr()); flush(stdout())

### Name: rfm_segment
### Title: Segmentation
### Aliases: rfm_segment

### ** Examples

# analysis date
analysis_date <- as.Date('2006-12-31')

# generate rfm score
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# segment names
segment_names <- c("Champions", "Potential Loyalist", "Loyal Customers",
                   "Promising", "New Customers", "Can't Lose Them",
                   "At Risk", "Need Attention", "About To Sleep", "Lost")

# segment intervals
recency_lower <-   c(5, 3, 2, 3, 4, 1, 1, 1, 2, 1)
recency_upper <-   c(5, 5, 4, 4, 5, 2, 2, 3, 3, 1)
frequency_lower <- c(5, 3, 2, 1, 1, 3, 2, 3, 1, 1)
frequency_upper <- c(5, 5, 4, 3, 3, 4, 5, 5, 3, 5)
monetary_lower <-  c(5, 2, 2, 3, 1, 4, 4, 3, 1, 1)
monetary_upper <-  c(5, 5, 4, 5, 5, 5, 5, 5, 4, 5)

# generate segments
segments <- rfm_segment(rfm_result, segment_names, recency_lower,
recency_upper, frequency_lower, frequency_upper, monetary_lower,
monetary_upper)

segments




cleanEx()
nameEx("rfm_segment_summary")
### * rfm_segment_summary

flush(stderr()); flush(stdout())

### Name: rfm_segment_summary
### Title: Segment summary
### Aliases: rfm_segment_summary

### ** Examples

# analysis date
analysis_date <- as.Date('2006-12-31')

# generate rfm score
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# segment names
segment_names <- c("Champions", "Potential Loyalist", "Loyal Customers",
                   "Promising", "New Customers", "Can't Lose Them",
                   "At Risk", "Need Attention", "About To Sleep", "Lost")

# segment intervals
recency_lower <-   c(5, 3, 2, 3, 4, 1, 1, 1, 2, 1)
recency_upper <-   c(5, 5, 4, 4, 5, 2, 2, 3, 3, 1)
frequency_lower <- c(5, 3, 2, 1, 1, 3, 2, 3, 1, 1)
frequency_upper <- c(5, 5, 4, 3, 3, 4, 5, 5, 3, 5)
monetary_lower <-  c(5, 2, 2, 3, 1, 4, 4, 3, 1, 1)
monetary_upper <-  c(5, 5, 4, 5, 5, 5, 5, 5, 4, 5)

# generate segments
segments <- rfm_segment(rfm_result, segment_names, recency_lower,
recency_upper, frequency_lower, frequency_upper, monetary_lower,
monetary_upper)

# segment summary
rfm_segment_summary(segments)




cleanEx()
nameEx("rfm_table_customer")
### * rfm_table_customer

flush(stderr()); flush(stdout())

### Name: rfm_table_customer_2
### Title: RFM table (customer data)
### Aliases: rfm_table_customer_2 rfm_table_customer

### ** Examples

analysis_date <- as.Date('2007-01-01')

# data includes days since last visit
rfm_table_customer(rfm_data_customer, customer_id, number_of_orders,
recency_days, revenue, analysis_date)

# data includes last visit date
rfm_table_customer(rfm_data_customer, customer_id, number_of_orders,
most_recent_visit, revenue, analysis_date)

# access rfm table
result <- rfm_table_customer(rfm_data_customer, customer_id, number_of_orders,
recency_days, revenue, analysis_date)
result$rfm

# using custom threshold
rfm_table_customer(rfm_data_customer, customer_id, number_of_orders,
recency_days, revenue, analysis_date, recency_bins = c(115, 181, 297, 482),
frequency_bins = c(4, 5, 6, 8), monetary_bins = c(256, 382, 506, 666))




cleanEx()
nameEx("rfm_table_order")
### * rfm_table_order

flush(stderr()); flush(stdout())

### Name: rfm_table_order
### Title: RFM table (transaction data)
### Aliases: rfm_table_order

### ** Examples

analysis_date <- as.Date("2006-12-31")
rfm_table_order(
  rfm_data_orders, customer_id, order_date, revenue,
  analysis_date
)

# access rfm table
result <- rfm_table_order(
  rfm_data_orders, customer_id, order_date,
  revenue, analysis_date
)
result$rfm

# using custom threshold
rfm_table_order(rfm_data_orders, customer_id, order_date, revenue,
  analysis_date,
  recency_bins = c(115, 181, 297, 482), frequency_bins = c(4, 5, 6, 8),
  monetary_bins = c(256, 382, 506, 666)
)




### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
