require "csv"

puts "Creating Geozones"
['Maroc Tanger Passage Goix, 19ème',
 'Ménilmontant, 20ème',
 'Phillipe de Girard, 18ème',
 'Saint Charles, 15ème'].each { |i| Geozone.create(name: "#{i}", external_code: i.ord, census_code: i.ord) }

puts "Creating Budgets"
budget = Budget.create!(
    name: "Budget participatif 2018",
    currency_symbol: "€",
    phase: "accepting",
    description_accepting: "description_accepting ici",
    description_reviewing: "description_reviewing ici",
    description_selecting: "description_selecting ici",
    description_valuating: "description_valuating ici",
    description_balloting: "description_balloting ici",
    description_reviewing_ballots: "description_reviewing_ballots ici",
    description_finished: "description_finished ici")
puts budget.name

puts "Creating Groups"
group = budget.groups.create!(name: "Choisissez votre résidence")


print "Creating Groups & geozon"
file = File.expand_path('../prod_geozone_2018.csv', __FILE__)
CSV.foreach(file, {:headers => true, :col_sep => ';', :encoding => 'UTF-8'}) do |row|
  puts row[0]
  if Budget.last.groups.last.headings.where(name: row[0])[0] != nil
    puts "le site existe"
    site = Budget.last.groups.last.headings.where(name: row[0])
    p site[0][:name]
    p site[0].id
    # création de la geozone = esi
    Geozone.create(name: row[2], external_code: site[0].id, census_code: row[1])
    p "la géozone #{Geozone.last[:census_code]} à été créée"
  else
    puts "le site n'existe pas"
    p "création du site"
    site = group.headings.create!(name: row[0],
                                  # geozone: geozone,
                                  price: row[3])
    group.headings << site
    p "le site #{site[:name]} à été créé"
    #création du geozone
    Geozone.create(name: row[2], external_code: site.id, census_code: row[1])
    p "la géozone #{Geozone.last[:census_code]} à été créée"
  end

end