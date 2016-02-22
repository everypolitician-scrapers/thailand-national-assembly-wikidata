#!/bin/env ruby
# encoding: utf-8

require 'json'
require 'pry'
require 'rest-client'
require 'scraperwiki'
require 'wikidata/fetcher'
require 'mediawiki_api'

def names
  morph_api_url = 'https://api.morph.io/davewhiteland/thailand-national-assembly/data.json'
  morph_api_key = ENV["MORPH_API_KEY"]
  result = RestClient.get morph_api_url, params: {
    key: morph_api_key,
    query: "select DISTINCT(name) AS wikiname from wikinames"
  }
  JSON.parse(result, symbolize_names: true)
end

EveryPolitician::Wikidata.scrape_wikidata(names: { th: names.map { |n| n[:wikiname] } }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder
