regions = ['North America', 'South America', 'Europe', 'Asia', 'Australia/Oceania', 'Africa']
regions.each do |region|
  Region.where(name: region).first_or_create
end

consoles = ['PC', 'Xbox One', 'Playstation 4', 'Xbox 360', 'Playstation 3']
consoles.each do |console|
  Console.where(name: console).first_or_create
end

games = [{name: 'Destiny', short_name: ''},
         {name: 'Battlefield Hardline', short_name: 'BF Hardline'},
         {name: 'Halo: The Master Chief Collection', short_name: 'Halo MCC'}]
games.each do |game|
  Game.where(name: game[:name], short_name: game[:short_name]).first_or_create
end

games_consoles = [{game: 'Destiny', consoles: ['Xbox One', 'Playstation 4', 'Xbox 360', 'Playstation 3']},
                  {game: 'Battlefield Hardline', consoles: ['PC', 'Xbox One', 'Playstation 4', 'Xbox 360', 'Playstation 3']},
                  {game: 'Halo: The Master Chief Collection', consoles: ['Xbox One']}]

games_consoles.each do |game_console|
  game = Game.where(name: game_console[:game]).first
  game_console[:consoles].each do |console|
    console = Console.where(name: console).first
    GameConsole.where(console_id: console.id, game_id: game.id).first_or_create
  end
end

game_options  = [{game: 'Destiny',
                  options: [{name: 'level', input_type: 'number', placeholder: 'Level', min_value: '1', max_value: '32', required: true},
                            {name: 'class', input_type: 'text', placeholder: 'Guardian Class', min_value: nil, max_value: nil, required: false}]},
                 {game: 'Battlefield Hardline',
                  options: [{name: 'level', input_type: 'number', placeholder: 'Level', min_value: '1', max_value: '150', required: true}]}]

game_options.each do |game_option|
  game = Game.where(name: game_option[:game]).first
  game_option[:options].each do |option|
    option[:game_id] = game.id
    Option.where(option).first_or_create
  end
end