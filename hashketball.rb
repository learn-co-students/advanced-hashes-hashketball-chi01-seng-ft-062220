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

def num_points_scored(player)
  game_hash.each do |team, all_stats| 
    all_stats[:players].each do |player_stats|
      if player_stats[:player_name] == player
        return player_stats[:points]
      end
    end 
  end 
end 

def shoe_size(player)
  game_hash.each do |team_info, all_stats|
    all_stats[:players].each do |player_stats|
      if player_stats[:player_name] == player
        return player_stats[:shoe]
      end
    end
  end
end

def team_colors(team)
  colors = []
  game_hash.each do |team_info, all_stats|
      if all_stats[:team_name] == team
       return all_stats[:colors]
    end
    colors = all_stats[:colors]
  end
  colors
end

def team_names
  teams = []
  game_hash.select do |team_info, all_stats|
    teams << all_stats[:team_name]
  end
  teams
end

def player_numbers(team)
  players = []
  game_hash.each do |team_info, all_stats|
    if all_stats[:team_name] == team
      all_stats[:players].each do |player_stats|
        players << player_stats[:number]
      end
    end
  end
  players
end

def player_stats(player)
  game_hash.each do |team_info, all_stats|
    all_stats[:players].each do |player_stats|
      if player_stats[:player_name] == player
        return player_stats
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_wearer = []
    game_hash.each do |team_info, all_stats|
      all_stats[:players].each do |player_stats|
        largest_shoe_wearer << player_stats[:shoe]
          end
        end
      shoe_size = largest_shoe_wearer.sort.last
        game_hash.each do |team_info, all_stats|
        all_stats[:players].each do |player_stats|
          if shoe_size == player_stats[:shoe]
            return player_stats[:rebounds]
          end
    end
  end
end

def most_points_scored
  individual_points = []
    game_hash.each do |team_info, all_stats|
      all_stats[:players].each do |player_stats|
        individual_points << player_stats[:points]
      end
    end
  high_score = individual_points.sort.last
    game_hash.each do |team_info, all_stats|
      all_stats[:players].each do |player_stats|
        if high_score == player_stats[:points]
          return player_stats[:player_name]
        end
      end
    end
end

def winning_team
  home_points = []
  away_points = []
    game_hash.each do |team_info, all_stats|
      if team_info == :home 
        all_stats[:players].each do |player_stats|
          home_points << player_stats[:points]
        end 
      else
        all_stats[:players].each do |player_stats|
          away_points << player_stats[:points]
        end
      end
    end
  home_points.sum > away_points.sum ? game_hash[:home][:team_name] : [:away][:team_name]
  end
  
def player_with_longest_name
name_length = []
longest_name = ""
game_hash.each do |team_info, all_stats|
  all_stats[:players].each do |player_stats|
    name_length << player_stats[:player_name].length
    end
    all_stats[:players].each do |player_stats|
      if name_length.sort.last == player_stats[:player_name].length
        longest_name = player_stats[:player_name]
      end
    end
  end
longest_name
end

def long_name_steals_a_ton?
  name_length = []
  longest_name = ""
  total_steals = []
  greatest_steals = ""
  game_hash.each do |team_info, all_stats|
    all_stats[:players].each do |player_stats|
      name_length << player_stats[:player_name].length
      end
      all_stats[:players].each do |player_stats|
        if name_length.sort.last == player_stats[:player_name].length
          longest_name = player_stats[:player_name]
        end
      end
    end
  longest_name
  total_steals = []
  greatest_steals = ""
    game_hash.each do |team_info, all_stats|
      all_stats[:players].each do |player_stats|
        total_steals << player_stats[:steals]
      end
    end
  most_steals = total_steals.sort.last
    game_hash.each do |team_info, all_stats|
      all_stats[:players].each do |player_stats|
        if most_steals == player_stats[:steals]
          greatest_steals = player_stats[:player_name]
        end
      end
    end
    longest_name == greatest_steals ? true : false
end