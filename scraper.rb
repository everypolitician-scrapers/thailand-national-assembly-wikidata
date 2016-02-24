#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'davewhiteland/thailand-national-assembly', column: 'name')
EveryPolitician::Wikidata.scrape_wikidata(names: { th: names }, output: false)
