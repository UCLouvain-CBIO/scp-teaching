%.html: %.Rmd
	Rscript -e "rmarkdown::render('$^', output_format = 'xaringan::moon_reader')"

web:
	cp *.html ../docs/.
	cp xaringan-themer.css ../docs/.
	cp -r *_files ../docs/.


clean:
	rm *.html xaringan-themer.css
	rm -r *_files
