
RED = \033[0;31m
GREEN = \033[0;32m
RESET = \033[0m

COMPOSE_FILE = ./srcs/docker-compose.yml
VOLUME = /home/junyopar/data

build:
	sudo docker compose -f $(COMPOSE_FILE) build --no-cache --force-rm
up:
	@ echo "$(GREEN)Creating local volume directory ... $(RESET)" 
	@ mkdir -p $(VOLUME)/db $(VOLUME)/wordpress
	sudo docker compose -f $(COMPOSE_FILE) up -d  
# imgeas list
ilist:
	sudo docker images
# container ps
cpsa:
	sudo docker ps -a
cps:
	sudo docker ps 
# volume ls
vlist:
	sudo docker volume ls

# network ls
nlist:
	docker network ls
clean:
	@ echo "$(GREEN)clean ... $(RESET)"
	@./clean.sh
fclean: clean
	@ echo "$(GREEN)all remove cache etc.. ... $(RESET)"
	@ sudo docker system prune -a -f 
down:
	@ echo "$(GREEN)docker compose down ... $(RESET)"
	@ sudo docker compose -f $(COMPOSE_FILE) down
stop:
	@ echo "$(GREEN)docker compose stop ... $(RESET)"
	@ sudo docker compose -f $(COMPOSE_FILE) stop

re: fclean up

.PHONY: up,build,re,stop,down,fclean,clean,nlist,vlist,cps, cpsa,ilist