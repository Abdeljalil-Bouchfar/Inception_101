all:
	@mkdir -p /home/abouchfa/data/mariadb
	@mkdir -p /home/abouchfa/data/wordpress
	@docker compose -f srcs/docker-compose.yml up -d --build

down:
	@docker compose -f srcs/docker-compose.yml down

re: clean
	@docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

ls_ps:
	docker ps -a

ls_images:
	docker images a

ls_all: ls_ps ls_images

.PHONY: all re down clean