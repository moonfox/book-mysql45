# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

class Mysql45
  def self.load_require(dir)
    Dir.glob("#{dir}/*.rb") do |file|
      require File.expand_path(file)
      puts file
    end
  end

  def self.root
    %w[lib model app].each { |file| load_require(file) }
  end
end

Mysql45.root
