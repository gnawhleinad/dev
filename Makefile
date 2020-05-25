.PHONY: init
init:
	docker-machine create --driver xhyve --xhyve-virtio-9p --xhyve-virtio-9p-root="/" dev

.PHONY: clean
clean:
	docker-machine kill dev
	docker-machine rm --force dev
