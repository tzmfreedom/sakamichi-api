module Nogizaka
  MEMBERS = YAML.load_file('config/nogizaka/members.yml')
  SONGS = YAML.load_file('config/nogizaka/songs.yml')
end

module Keyakizaka
  MEMBERS = YAML.load_file('config/keyakizaka/members.yml')
  SONG = YAML.load_file('config/keyakizaka/songs.yml')
end

module HiraganaKeyaki
  MEMBERS = YAML.load_file('config/hiragana-keyaki/members.yml')
  SONGS = YAML.load_file('config/hiragana-keyaki/songs.yml')
end
