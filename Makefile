# the page won't be different

site.json: parse.rb
	ruby parse.rb | python -mjson.tool | sed 's/[ \t]*$$//' > site.json
