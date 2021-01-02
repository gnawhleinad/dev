.PHONY: iso
iso:
	cd ~/.docker/machine/cache/ && \
		[[ $$(md5sum boot2docker.iso | awk '{print $$1}') != "7be437b191dddfe40d6f9ef85684cce0" ]] && \
		curl -LO https://github.com/boot2docker/boot2docker/releases/download/v19.03.5/boot2docker.iso || \
	true

.PHONY: init
init: iso
	docker-machine create \
		--driver xhyve \
		--xhyve-boot2docker-url ~/.docker/machine/cache/boot2docker.iso \
		--xhyve-virtio-9p /Users/gnawhleinad \
		--xhyve-virtio-9p-root / \
		--xhyve-memory-size 2048 \
		dev

.PHONY: start
start:
	docker-machine start dev
	eval $(docker-machine env dev)

.PHONY: clean
clean:
	docker-machine stop dev || true
	docker-machine kill dev 2>/dev/null || true
	docker-machine rm --force dev
