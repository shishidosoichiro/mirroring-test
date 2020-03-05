USERNAME=
TOKEN=
REMOTE=https://$(USERNAME):$(TOKEN)@github.com/shishidosoichiro/mirroring-test.git
REF_NAME=master

remote:
	git remote add remote $(REMOTE)

push:
	git fetch remote
	git push remote $(REF_NAME)

pull:
	git pull remote $(REF_NAME)
	git push origin $(REF_NAME)
