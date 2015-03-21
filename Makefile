#
#    a8             8a
#   d8'         88  `8b
#  d8'          88   `8b
# d8'           88    `8b
# 88            88     88
# 88            88     88
# Y8,           88    ,8P
#  Y8,  88,   ,d88   ,8P
#   Y8,  "Y8888P"   ,8P
#    "8             8"
#  COPYRIGHT 2015
#  JACK ENGQVIST JOHANSSON
# 

THEME_TMPL = src/theme.cfgt
PIXMP_TMPL := $(wildcard src/pixmaps/*.xpmt)
PIXMAPS := $(addprefix pixmaps/,$(notdir $(PIXMP_TMPL:.xpmt=.xpm)))
PP = cpp

theme: ${PIXMAPS}
	${PP} -E ${THEME_TMPL} -o theme.cfg

pixmaps/%.xpm: src/pixmaps/%.xpmt
	cat $< | sed -e 's/XPM_COLOR_FG/XPM_COLOR_FG_HIGH/g' \
                     -e 's/\.\.\/\.\.\///' \
                     -e 's/\.\.\//src\//' | ${PP} -E \
               | sed -e '1 i\/\* XPM \*\/' \
                     -e '/^#/ d' -e '/^$$/ d' > $(shell src/getpressedxpm.sh $@)
	${PP} -E $< | sed -e '1 i\/\* XPM \*\/' -e '/^#/ d' -e '/^$$/ d' > $@

clean:
	rm ${PIXMAPS} theme.cfg
