APP_PORT = 3000

.PHONY: db/migrate
db/migrate:
	bundle exec rake db:migrate
	bundle exec annotate

.PHONY: server
server:
	bundle exec rails s -b 0.0.0.0 -p $(APP_PORT)
