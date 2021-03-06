USERNAME=
TOKEN=
REMOTE=https://$(USERNAME):$(TOKEN)@github.com/shishidosoichiro/mirroring-test.git
REF_NAME=master

remote:
	git remote -v
	git remote remove remote || true
	git remote add remote $(REMOTE)

push:
	git fetch remote
	git log --oneline --decorate --graph -10
	git push remote HEAD:$(REF_NAME)

pull:
	git fetch remote
	git merge remote/$(REF_NAME)
	git push origin HEAD:$(REF_NAME)
