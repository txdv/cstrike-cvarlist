# the page won't be different

all: site.json site.min.json

site.json: parse.rb
	ruby parse.rb | python -mjson.tool | sed 's/[ \t]*$$//' > site.json

site.min.json: parse.rb
	ruby parse.rb > site.min.json
