require 'nokogiri'
require 'json'

data = []
File.open("cvarlist.html") do |file|
  doc = Nokogiri::HTML(file)
  doc.search('#cvarTable').each do |a|
    first = true
    a.xpath('//tr').each do |element|
      # first attribute, hl, cs only?
      game = element.children[0].attributes['class']
      if game == nil then
        game = "base"
      else
        game = game.text[0..1]
      end

      # second attribute, single player only?
      sp = element.children[1].attributes['class'] ? true : false

      # third attribute, cvar name
      cvar = element.children[2].text

      # forth attribute, default value
      default = element.children[3].text

      # fith attribute, min value
      min = element.children[4].text

      # sixth attribute, max value
      max = element.children[5].text

      # seventh attribute, type
      type = element.children[6].text

      # eigth attribute, supported on open glide?
      ogl = element.children[7].attributes['class'] ? true : false

      # ninth attribute, supported on direct 3D?
      d3d = element.children[8].attributes['class'] ? true : false

      # tenth attribute, supported on software renderer?
      sft = element.children[9].attributes['class'] ? true : false

      # eleventh attribute, category?
      category = element.children[10].text

      # twelth attribute, description
      description = element.children[11].text

      entry = { }
      entry['game'] = game
      entry['sp'] = sp
      entry['cvar'] = cvar
      entry['default'] = default
      value = { }
      value['min'] = min
      value['max'] = max
      value['default'] = default
      entry['value'] = value
      entry['type'] = type
      entry['category'] = category
      entry['description'] = description
      if category == 'video'
        renderer = { }
        renderer['sft'] = sft;
        renderer['d3d'] = d3d;
        renderer['ogl'] = ogl;
        entry['renderer'] = renderer
      end

      if first then
        first = false
      else
        data.push entry
      end
    end
  end
end

puts data.to_json
