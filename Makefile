NAME = camagru

CLEAN_IMAGES	= --rmi all
CLEAN_ORPHANS	= --remove-orphans
CLEAN_VOLUMES	= --volumes

all:
	npm install && \
	npx --package typescript tsc && \
	npx tailwindcss -i ./public/static/styles.css -o ./public/static/global.css
	docker compose up --build -d

dev:
	npm install && \
	npx --package typescript tsc && \
	npx tailwindcss -i ./public/static/styles.css -o ./public/static/global.css
	docker compose --profile development -f compose.yaml -f compose.override.yaml up --build -d

start:
	docker compose start

down:
	docker compose down

stop:
	docker compose stop

restart:
	docker compose restart

clear:
	docker compose down $(CLEAN_VOLUMES)

clean:
	docker compose down $(CLEAN_IMAGES) $(CLEAN_VOLUMES)

fclean:
	docker compose down $(CLEAN_IMAGES) $(CLEAN_ORPHANS) $(CLEAN_VOLUMES)

re:	fclean all

.PHONY:	all clean fclean re down restart stop start restart
