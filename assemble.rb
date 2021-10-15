#!/usr/bin/env ruby

require 'sassc'

# Read the SCSS stylesheet source
scss_src = File.read("stylesheet.scss")

# Compile to CSS and minify the result
raw_css = SassC::Engine.new(scss_src).render
raw_css.gsub!(/\s+/, " ")

# Read the theme JSON source
theme_json = File.read("theme.json")

# Insert the compiled CSS
theme_json.gsub!("/* STYLESHEET */", raw_css)

# Write the assembled theme file to disk
File.write("Nova.bntheme", theme_json)
