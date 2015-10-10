require 'rubygems'
require 'mechanize'

mechanize = Mechanize.new
pageURL = "https://docs.google.com/forms/d/1WWWXyroezwki_2YfyB-ghmNiYcwHRgc5uoOVPShHu30/viewform?fbzx=7842822602668400182"

name = "daddy trump"
song = "darude-sandstorm"
iterations = 150

for i in 1..iterations
  page = mechanize.get(pageURL)
  form = mechanize.page.forms.first
  form['entry.1102043328']= name
  form['entry.376522754'] = song
  form['entry.164890914'] = 19
  
  page = form.submit
  if page.title != "Thanks!"
    puts "Darn, it didn't go thru :C"
  else
    puts "Submitted: #{i} times"
  end
end