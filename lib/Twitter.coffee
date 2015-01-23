OAuth = require "oauth"

module.exports = class Twitter
  constructor: (@config)->
    @oauth = new OAuth.OAuth(
      'https://api.twitter.com/oauth/request_token',
      'https://api.twitter.com/oauth/access_token',
      @config.Twitter.consumer_key,
      @config.Twitter.consumer_secret,
      '1.0a',
      null,
      'HMAC-SHA1',
      null,
      {"X-Powered-By":""}
    )

  create_account:(data, cb)->
    @oauth.post 'https://api.twitter.com/1/account/generate.json',
      @config.Twitter.access_token,
      @config.Twitter.access_token_secret,
      data,
      cb
