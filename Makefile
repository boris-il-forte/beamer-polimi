#installer makefile

root_dir = /usr/local/share/texmf
style_dir = tex/latex
package_name = polimi-beamer

style_files = $(wildcard *.sty)
image_dir = gfx
all: install

install: directory copy hash

directory:
	@echo "Creating directory..."
	@mkdir -p $(root_dir)/$(style_dir)/$(package_name)
	
copy: copystyle copyimg
	
copystyle: $(style_files)
	@echo "Moving style files..."
	@cp $^ $(root_dir)/$(style_dir)/$(package_name)

copyimg: $(image_dir)
	@cp -r  $(image_dir) $(root_dir)/$(style_dir)/$(package_name)/$(image_dir)

hash:
	@echo "rebuilding texlive hash"
	@texhash