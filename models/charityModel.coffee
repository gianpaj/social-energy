_        = require 'underscore'
mongoose = require 'mongoose'

#### Client Schema
CharitySchema = mongoose.Schema
  name:           { type: String, required: true }


exports.Charity = mongoose.model 'Charity', CharitySchema