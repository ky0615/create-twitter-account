require 'colors'
path = require 'path'
fs = require 'fs'
yaml = require 'js-yaml'

config = yaml.safeLoad fs.readFileSync path.join __dirname, 'config.yml'

unless config
  console.error 'I can not find the config file. Please copy the example file.'.red.underline
  console.error '    hint:'
  console.error '          $ cp config.yml.example config.yml'
  console.error '          $ vim config.yml'
  return

Twitter = require './lib/Twitter'
tw = new Twitter config

sn = config.Twitter.account.screen_name
email = config.Twitter.account.email
pw = config.Twitter.account.password

tw.create_account
    'screen_name': sn
    'password': pw
    'email': email
    'name': sn
  , (err, data, res)->
      console.log err
