%.html: %.Rmd
	Rscript -e "rmarkdown::render('$^', output_format = 'xaringan::moon_reader')"

web: 
	cp *.html ../docs/.

