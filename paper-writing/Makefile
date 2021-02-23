export PWD=`pwd`
export DIR_TEX=.
export FILENAME_TEX=main

c: ## compile LaTeX (aux作成 → bbl作成 → dvi作成1 → dvi作成2 → pdf作成)
	@make tex
	@make aux
	@make tex
	@make tex
	@make dvi
	@make clean
dvi:
	docker run --rm -v $(PWD)/$(DIR_TEX):/workdir pman0214/alpine-texlive-ja-epspdf dvipdfmx $(FILENAME_TEX).dvi
aux:
	docker run --rm -v $(PWD)/$(DIR_TEX):/workdir pman0214/alpine-texlive-ja-epspdf upbibtex $(FILENAME_TEX).aux
tex:
	docker run --rm -v $(PWD)/$(DIR_TEX):/workdir pman0214/alpine-texlive-ja-epspdf uplatex $(FILENAME_TEX).tex
clean:
	mv -f $(DIR_TEX)/$(FILENAME_TEX).blg \
		$(DIR_TEX)/$(FILENAME_TEX).bbl \
		$(DIR_TEX)/$(FILENAME_TEX).aux \
		$(DIR_TEX)/$(FILENAME_TEX).log \
		$(DIR_TEX)/$(FILENAME_TEX).dvi \
		$(DIR_TEX)/progress_files/

show: ## Show LaTex commands.
	cat latex_notation/dnn.txt

help: ## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
