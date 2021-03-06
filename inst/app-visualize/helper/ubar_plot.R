# activity flow
# Step 1: Upload data or use demo data

# Step 2: Choose the type of data being plotted
#	Options: a. Grouped Data
#			 b. Ungrouped Data

# Step 3: Choose whether a single plot should be built or multiple plots based on a grouping variable
#	Options: Select a grouping variable



# barplot
# univariate
bar_plotu <- function(x, horizontal = FALSE, color = NULL, border = "black",
	title = NA, xlab = NA, labels = NA, space = NA, width = 1,
	axes = TRUE, axislty = 0, offset = 0,
	ylab = NA, colmain = "black", colsub = "black", colaxis = "black",
	collab = "black", fontmain = 1, fontsub = 1, fontaxis = 1, fontlab = 1, 
	cexmain = 1, cexsub = 1, cexaxis = 1, cexlab = 1, leg = FALSE, leg_x, leg_y, legend,
	leg_point, leg_colour, leg_boxtype, leg_boxcol, leg_boxlty, leg_boxlwd,
	leg_boxborcol, leg_boxxjust, leg_boxyjust, leg_textcol, leg_textfont,
	leg_textcolumns, leg_texthoriz, leg_title, leg_titlecol, leg_textadj, text_p = NA,
	text_x_loc = NA, text_y_loc = NA, text_col = "black", text_font = NA,
	text_size = NA, m_text = NA, m_side = 3, m_line = 0.5, m_adj = 0.5,
	m_col = "black", m_font = 1, m_cex = 1) {

	counts <- table(x)

	# bar plot
	barplot(counts, horiz = horizontal, col = color, border = border,
	main = title, xlab = xlab, names.arg = labels, space = space, 
	width = width, density = NULL, angle = 45, axes = axes,
	axis.lty = axislty, offset = offset,
	ylab = ylab, col.main = colmain, col.sub = colsub,
  	col.axis = colaxis, col.lab = collab, font.main = fontmain,
  	font.sub = fontsub, font.axis = fontaxis, font.lab = fontlab,
  	cex.main = cexmain, cex.sub = cexsub, cex.axis = cexaxis,
  	cex.lab = cexlab)

	# legend
  	if (leg == TRUE) {
  		legend(leg_x, leg_y, 
               legend = legend, pch = leg_point, col = leg_colour,
               bty = leg_boxtype, bg = leg_boxcol,
               box.lty = leg_boxlty, box.lwd = leg_boxlwd,
               box.col = leg_boxborcol, xjust = leg_boxxjust,
               yjust = leg_boxyjust, text.col = leg_textcol,
               text.font = leg_textfont, ncol = leg_textcolumns,
               horiz = leg_texthoriz, title = leg_title,
               title.col = leg_titlecol, title.adj = leg_textadj)
  	}


	# add text inside the plot
   	text(text_x_loc, text_y_loc, text_p, font = text_font, col = text_col,
  		cex = text_size)
  
	# add text on the mar-gins of the plot
   	mtext(m_text, side = m_side, line = m_line, adj = m_adj,
  		col = m_col, font = m_font, cex = m_cex)
}


