#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'davewhiteland/thailand-national-assembly', table: 'wikinames', column: 'name')
ids = %w(Q13020617 Q13016121)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { th: names })
