export PWD=`pwd`
export NAME_APP=my_app

.ONESHELL: r# Only applies to all target
r:	## Build docker.
	@flutter upgrade
	@flutter create $(NAME_APP)
	@cd $(NAME_APP)
	@flutter config --enable-linux-desktop
	@flutter run -v -d linux
	#@git clone https://github.com/google/flutter-desktop-embedding.git
	#@cd flutter-desktop-embedding/testbed
	#@flutter run -d linux
#	
# --------------------------------------------------------
# help
.PHONY:	help
help:	## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'