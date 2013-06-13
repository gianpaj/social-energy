mongoose   = require 'mongoose'
_          = require 'underscore'

SignupSchema = mongoose.Schema
  email: { type: String, required: true, index: { unique: true } }

exports.Signup = mongoose.model 'Signup', SignupSchema