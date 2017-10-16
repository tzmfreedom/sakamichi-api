APP_PORT = 3000

.PHONY: server
server:
	bundle exec rails s -b 0.0.0.0 -p $(APP_PORT)
