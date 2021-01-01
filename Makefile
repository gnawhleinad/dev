.PHONY: init
init:
	docker-machine create --driver xhyve --xhyve-virtio-9p /Users/gnawhleinad --xhyve-virtio-9p-root / dev

.PHONY: start
start:
	docker-machine start dev
	eval $(docker-machine env dev)

.PHONY: clean
clean:
	docker-machine stop dev
	docker-machine kill dev 2>/dev/null || true
	docker-machine rm --force dev
