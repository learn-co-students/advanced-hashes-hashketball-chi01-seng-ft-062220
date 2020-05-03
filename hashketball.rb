# Write your code below game_hash
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

def num_points_scored(player_name_input)
  points_to_return = []
  game_hash.each do |team_id, team_data|
    team_data.each do |team_attributes, attribute_data|
      if team_attributes == :players
        attribute_data.each do |player, player_data|
          if player[:player_name] == player_name_input
            points_to_return.push(player[:points])
          end
        end
      end  
    end
  end
  points_to_return[0]
end

def shoe_size(player_name_input)
  shoe_size_return = []
  game_hash.each do |team_id, team_data|
    team_data.each do |team_attributes, attribute_data|
      if team_attributes == :players
        attribute_data.each do |player, player_data|
          if player[:player_name] == player_name_input
            shoe_size_return.push(player[:shoe])
          end
        end
      end
    end
  end
  shoe_size_return[0]
end

def team_colors(team_name_input)
  game_hash.each do |team_id, team_data|
      if team_data[:team_name] == team_name_input
        return game_hash[team_id][:colors]
      end
  end
end

def team_names
  team_names_to_return = []
  game_hash.each do |team_id, team_data|
    team_data.each do |team_attributes, attribute_data|
      if team_attributes == :team_name
        team_names_to_return.push(attribute_data)
      end
    end
  end
  team_names_to_return
end

def player_numbers(team_name_input)
  jersey_numbers_to_return =[]
  game_hash.each do |team_id, team_data|
    if team_data[:team_name] == team_name_input
      team_data.each do |team_attributes, attribute_data|
        if team_attributes == :players
          attribute_data.each do |players, player_data|
            jersey_numbers_to_return.push(players[:number])
          end
        end
      end
    end
  end
  jersey_numbers_to_return
end

def player_stats(player_name_input)
  player_stats_return = Hash.new
  game_hash.each do |team_id, team_data|
    team_data.each do |team_attributes, attribute_data|
      if team_attributes == :players
        attribute_data.each do |player, player_data|
          if player[:player_name] == player_name_input
            player_stats_return = player
          end
        end
      end
    end
  end
  player_stats_return
end

def big_shoe_rebounds
  b_s_rebounds = 0
  b_s_shoe = 0
  game_hash.each do |team_id, team_data|
    team_data.each do |team_attributes, attribute_data|
      if team_attributes == :players
        attribute_data.each do |player, player_data|
          if player[:shoe] > b_s_shoe
            b_s_shoe = player[:shoe]
            b_s_rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  b_s_rebounds
end

def long_name_steals_a_ton?
  long_name = ""
  most_steals_amount = 0
  most_steals_name = ""
  game_hash.each do |location, attributes|
    attributes.each do |attributes, values|
      if attributes == :players
        values.each do |label, stat|
          if label[:player_name].length > long_name.length
            long_name = label[:player_name]
          end
          if label[:steals] > most_steals_amount
            most_steals_amount = label[:steals]
            most_steals_name = label[:player_name]
          end
        end
      end
    end
  end
  long_name == most_steals_name
end