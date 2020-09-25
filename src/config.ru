# frozen_string_literal: true

require 'rubygems'
require 'bundler'
require 'sinatra'

Bundler.require

require_relative 'config/app'

app = SinatraTemplate::App.new
run app.app
