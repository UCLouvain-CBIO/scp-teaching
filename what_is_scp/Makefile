all:
	make what_is_scp.html
	make web
	make clean

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$^', output_format = 'xaringan::moon_reader')"

web:
	cp *.html ../docs/.
	cp xaringan-themer.css ../docs/.
	cp -r what_is_scp_files ../docs/.


clean:
	rm *.html xaringan-themer.css
	rm -r what_is_scp_files
