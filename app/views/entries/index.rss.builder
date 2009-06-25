xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Entradas en #{PLANETOID_CONF[:site][:title]}"
    xml.description "Últimas entradas de los miembros de #{PLANETOID_CONF[:site][:title]}"
    xml.link entries_url
    
    for entry in @entries
      xml.item do
        xml.title "#{entry.feed.user.name} :: #{entry.title}"
        xml.description entry.content
        xml.pubDate entry.created_at.to_s(:rfc822)
        xml.link entry.url
        xml.guid entry.url
      end
    end
  end
end