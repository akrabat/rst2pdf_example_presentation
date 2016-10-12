.PHONY: clean make watch

THIS_MAKEFILE_PATH:=$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
THIS_DIR:=$(shell cd $(dir $(THIS_MAKEFILE_PATH));pwd)

INPUT = presentation.rst
OUTPUT = $(THIS_DIR)/rst2pdf_example_presentation.pdf

make:
	cd "$(THIS_DIR)"
	rst2pdf "$(INPUT)" \
		-b1 \
		--fit-background-mode=scale \
		--smart-quotes=0 \
		--fit-literal-mode=overflow \
		-s borland.style,style-main.style \
		--output="$(OUTPUT)" \
		--strip-elements-with-class=handout \
		-e preprocess

clean:
	rm -f "$(OUTPUT)"
	rm -f "$(THIS_DIR)/*.build_temp"


watch:
	fswatch -o *.rst -o *.style -o images/* | xargs -n1 -I{} make
