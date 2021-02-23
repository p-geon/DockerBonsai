export PWD=`pwd`
export DIR=.
export FILENAME=main_jp
# ===========================================
en: ## compile LaTeX with English
	@make tex CONTAINER=pman0214/alpine-texlive-ja-epspdf
	@make aux CONTAINER=pman0214/alpine-texlive-ja-epspdf
	@make tex CONTAINER=pman0214/alpine-texlive-ja-epspdf
	@make tex CONTAINER=pman0214/alpine-texlive-ja-epspdf
	@make dvi CONTAINER=pman0214/alpine-texlive-ja-epspdf
	@make clean
jp: ## compile LaTex with JP
	@make tex CONTAINER=paperist/alpine-texlive-ja
	@make aux CONTAINER=paperist/alpine-texlive-ja
	@make tex CONTAINER=paperist/alpine-texlive-ja
	@make tex CONTAINER=paperist/alpine-texlive-ja
	@make dvi CONTAINER=paperist/alpine-texlive-ja
	@make clean
tex:
	echo $(CONTAINER)
	docker run --rm -v $(PWD)/$(DIR):/workdir $(CONTAINER) uplatex $(FILENAME).tex
dvi:
	docker run --rm -v $(PWD)/$(DIR):/workdir $(CONTAINER) dvipdfmx $(FILENAME).dvi
aux:
	docker run --rm -v $(PWD)/$(DIR):/workdir $(CONTAINER) upbibtex $(FILENAME).aux
clean:
	mv -f $(DIR)/$(FILENAME).blg \
		$(DIR)/$(FILENAME).bbl \
		$(DIR)/$(FILENAME).aux \
		$(DIR)/$(FILENAME).log \
		$(DIR)/$(FILENAME).dvi \
		$(DIR)/progress_files/
# ===========================================
show: ## Show LaTex commands.
	cat latex_notation/dnn.txt

help: ## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
