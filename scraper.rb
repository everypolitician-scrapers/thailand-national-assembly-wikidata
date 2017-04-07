#!/bin/env ruby
# encoding: utf-8

require 'everypolitician'
require 'wikidata/fetcher'

existing = EveryPolitician::Index.new.country("Thailand").lower_house.popolo.persons.map(&:wikidata).compact

names = EveryPolitician::Wikidata.morph_wikinames(source: 'davewhiteland/thailand-national-assembly', table: 'wikinames', column: 'name')

EveryPolitician::Wikidata.scrape_wikidata(ids: existing, names: { th: names })
