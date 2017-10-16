APP_PORT = 3000

.PHONY: server
server:
	bundle exec rails s -b 0.0.0.0 -p $(APP_PORT)

.PHONY: heroku
heroku:
ifeq ($(shell command -v heroku 2>/dev/null),)
	brew install heroku
endif

.PHONY: deploy
deploy: heroku
	git push heroku master

.PHONY: heroku/create
heroku/create: heroku
	heroku apps:create $(APP_NAME)

.PHONY: heroku/console
heroku/console: heroku
	heroku run bash

.PHONY: heroku/logs
logs: heroku
	heroku logs

.PHONY: open
open: heroku
	heroku open

