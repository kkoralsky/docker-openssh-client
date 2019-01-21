NS = kkoralsky
IMAGE = `basename $$PWD`

build: 
	docker build -t $(IMAGE)  .

push:
	docker tag $(IMAGE) $(NS)/$(IMAGE)
	docker push $(NS)/$(IMAGE)
