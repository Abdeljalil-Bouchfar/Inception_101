all:
	@mkdir -p /home/abouchfa/data/mariadb
	@mkdir -p /home/abouchfa/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f srcs/docker-compose.yml down

re: clean all

clean: down
	@docker volume rm -f srcs_mariadb
	@docker volume rm -f srcs_wordpress
	@docker system prune -af
	sudo rm -rf /home/abouchfa/data/mariadb
	sudo rm -rf /home/abouchfa/data/wordpress

ls_ps:
	docker ps -a

ls_images:
	docker images

ls_all: ls_ps ls_images

.PHONY: all re down clean