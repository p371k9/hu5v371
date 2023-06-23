PUBLICDIR = docs

all: index simple nyuszi

index: index.html index.py README.md
	python index.py $(PUBLICDIR)/index.html

simple: simple.css/simple.css
	cp simple.css/simple.css $(PUBLICDIR)/

nyuszi:	nyuszi.png
	cp nyuszi.png $(PUBLICDIR)/


commit:
	git commit --file message.txt

push:
	git push -u origin main

stru:
	mkdir $(PUBLICDIR)

clean:
	rm $(PUBLICDIR)/*	

server:
	python -m http.server --directory $(PUBLICDIR)/

grip:	README.md
	grip README.md