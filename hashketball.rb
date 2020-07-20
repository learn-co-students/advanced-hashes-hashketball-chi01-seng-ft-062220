# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(playerSearch)
  team = :home
  result = ""
  result = player_search(team, playerSearch, :points, result)
  if result == ""
    team = :away
    result = player_search(team, playerSearch, :points, result)
  end
  result
end

def player_search(team, name, symbol, res)
  result = res
  game_hash[team][:players].each do |player|
    if player[:player_name] == name
      result = player[symbol]
    end
  end
  result
end

def shoe_size(sizeSearch)
  team = :home
  result = ""
  result = player_search(team, sizeSearch, :shoe, result)
  if result == ""
    team = :away
    result = player_search(team, sizeSearch, :shoe, result)
  end
  result
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    result = game_hash[:home][:colors]
  else
    result = game_hash[:away][:colors]
  end
end

def team_names
  result = []
  game_hash.each do |key, value|
    result << game_hash[key][:team_name]
  end
  result
end

def player_numbers(team_name)
  result = []
  team = :home
  if game_hash[team][:team_name] != team_name
    team = :away
  end
  game_hash[team][:players].each do |player|
    result << player[:number]
  end
  result.sort!
end

def player_stats(search)
  result = {}
  roster = game_hash[:home][:players]
  roster.each do |player|
    if player.has_value? (search)
      result = player
    end
  end
  if result == {}
    roster = game_hash[:away][:players]
    roster.each do |player|
      if player.has_value? (search)
        result = player
      end
    end
  end
  result
end

def big_shoe_rebounds ()
  result = ""
  max_size = 0
  roster = game_hash[:home][:players]
  roster.each do |player|
    if player[:shoe] > max_size
      result = player[:rebounds]
      max_size = player[:shoe]
    end
  end
  roster = game_hash[:away][:players]
  roster.each do |player|
    if player[:shoe] > max_size
      result = player[:rebounds]
      max_size = player[:shoe]
    end
  end
  result
end