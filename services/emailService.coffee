mailchimp = require('mailchimp').MailChimpAPI

listID = 'ab363500c3'
apiKey = '61d2aefddb3b94eed01d060e1182d8c7-us7'
api = null

exports.subscribe = (email, done) ->
  data =
    id: listID
    email_address: email
    update_existing: true

  api.listSubscribe data, done

exports.init =  ->
  api = new mailchimp apiKey, version : '1.3', secure : true
