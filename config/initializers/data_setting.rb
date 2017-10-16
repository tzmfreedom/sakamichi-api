module Nogizaka
  MEMBERS = YAML.load_file('config/data/nogizaka/members.yml')
  SONGS = YAML.load_file('config/data/nogizaka/songs.yml')
end

module Keyakizaka
  MEMBERS = YAML.load_file('config/data/keyakizaka/members.yml')
  SONG = YAML.load_file('config/data/keyakizaka/songs.yml')
end

module HiraganaKeyaki
  MEMBERS = YAML.load_file('config/data/hiragana-keyaki/members.yml')
end
