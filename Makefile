PUBLICDIR = docs
BB = /bin/busybox

all: index nyuszi

index: index.tpl README.md 
	$(BB) sh index.sh > $(PUBLICDIR)/index.html

nyuszi:	nyuszi.png
	$(BB) cp nyuszi.png $(PUBLICDIR)

commit:
	git commit -a --file message.txt

push:
	git push -u origin main

stru:
	$(BB) mkdir $(PUBLICDIR)

clean:
	$(BB) rm $(PUBLICDIR)/*	

server:
	$(BB) httpd -f -v -p 1414 -h $(PUBLICDIR)/

grip:	README.md
	grip README.md
