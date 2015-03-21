THEME_TMPL = src/theme_tmpl.cfg
PIXMP_TMPL := $(wildcard src/pixmaps/*.xpmt)
PIXMAPS := $(addprefix pixmaps/,$(notdir $(PIXMP_TMPL:.xpmt=.xpm)))
PP = cpp

theme: ${PIXMAPS}
	${PP} -E ${THEME_TMPL} -o theme.cfg

pixmaps/%.xpm: src/pixmaps/%.xpmt
	cat $< | sed -e 's/XPM_COLOR_FG/XPM_COLOR_FG_HIGH/g' -e 's/\.\.\/\.\.\///' -e 's/\.\.\//src\//' | ${PP} -E | sed -e '1 i\/\* XPM \*\/' -e '/^#/ d' -e '/^$$/ d' > $(shell ./getpressedxpm.sh $@)
	${PP} -E $< | sed -e '1 i\/\* XPM \*\/' -e '/^#/ d' -e '/^$$/ d' > $@

clean:
	rm ${PIXMAPS} theme.cfg