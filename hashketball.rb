def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
  return game_hash
end

def num_points_scored(name)
  points_scored = -1
  game_hash.each do |location,team_info|
    if team_info[:players].keys.include?(name)
      points_scored = team_info[:players][name][:points]
    end
  end
  return points_scored
end

def shoe_size(name)
  shoe_size = -1
  game_hash.each do |location,team_info|
    if team_info[:players].keys.include?(name)
      shoe_size = team_info[:players][name][:shoe]
    end
  end
  return shoe_size
end

def team_colors(name)
  team_colors = []
  game_hash.each do |location,team_info|
    if team_info[:team_name] ==  name
      team_colors = team_info[:colors]
    end
  end
  return team_colors
end

def team_names
  team_names = []
  game_hash.each do |location,team_info|
    team_names << team_info[:team_name]
  end
  return team_names
end

def player_numbers(team)
  jerseys = []
  game_hash.each do |location,team_info|
    if team_info[:team_name] ==  team
      team_info[:players].each do |player,stat|
        jerseys << stat[:number]
      end
    end
  end
  return jerseys
end

def player_stats(name)
  stats = {}
  game_hash.each do |location,team_info|
    if team_info[:players].keys.include?(name)
      stats = team_info[:players][name]
    end
  end
  return stats
end

def big_shoe_rebounds
  shoe_sizes = []
  game_hash.each do |location,team_info|
    team_info[:players].each do |player,stat|
      shoe_sizes << stat[:shoe_size]
    end
  end

  biggest_shoe = shoe_sizes.max
  big_shoe_rebounds = -1

  game_hash.each do |location,team_info|
    team_info[:players].each do |player,stat|
      if stat[:shoe_size] == biggest_shoe
        big_shoe_rebounds = stat[:rebounds]
      end
    end
  end
  return big_shoe_rebounds
end

# Another solution option below

# def num_points_scored(name)
#
#   #iterate down into each location and then each players
#   game_hash.each do |location, info|
#
#     info[:players].each do |player_name, stats|
#
#       if player_name == name
#
#         return stats[:points]
#       end
#     end
#   end
# end
#
# def shoe_size(name)
#
#   #iterate down into each location and then each players
#   game_hash.each do |location, info|
#
#     info[:players].each do |player_name, stats|
#
#       if player_name == name
#
#         return stats[:shoe]
#       end
#     end
#   end
# end
#
# def team_colors(team_name)
#   game_hash.each do |location, info|
#
#     if info[:team_name] == team_name
#
#       return info[:colors]
#     end
#   end
#
# end
#
# def team_names
#
#   teams = []
#
#   game_hash.each do |location, info|
#
#     teams << info[:team_name]
#
#   end
#
# return teams
# end
#
# def player_numbers(team_name)
#
#   #iterate down into each location and then each players
#   jerseys = []
#
#   game_hash.each do |location, info|
#
#       if info[:team_name] == team_name
#
#         info[:players].each do |player_name, stats|
#
#           jerseys << stats[:number]
#         end
#       end
#     end
#
#   return jerseys
#
# end
#
# def player_stats(player)
#
#   game_hash.each do |location, info|
#
#     info[:players].each do |player_name, stats|
#
#       if player_name == player
#
#         return stats
#       end
#     end
#   end
#
#
# end
#
# def big_shoe_rebounds
#
#   biggest_shoe_size = 0
#
#   game_hash.each do |location, info|
#
#     info[:players].each do |player_name, stats|
#
#       if stats[:shoe] > biggest_shoe_size
#
#         biggest_shoe_size = stats[:shoe]
#       end
#
#       if stats[:shoe] == biggest_shoe_size
#
#         return stats[:rebounds]
#
#       end
#
#     end
#
#   end
#
#
# end
#
#
#
#
