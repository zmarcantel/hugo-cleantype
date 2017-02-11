OUTDIR=static
SRCDIR=src

CSS_TARGETS=static/css/main.css
MINTARGETS=$(CSS_TARGETS:%.css=%.min.css)

default: minified

# TODO: depending on clean is gross, but it works
css: clean $(CSS_TARGETS)
minified: css $(MINTARGETS)

$(OUTDIR)/%.css: $(SRCDIR)/%.less
	lessc $< $@

$(OUTDIR)/%.min.css: $(OUTDIR)/%.css
	cleancss -o $@ $<

clean:
	rm -f $(CSS_TARGETS) $(MINTARGETS)

.PHONY: clean
