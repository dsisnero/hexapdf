require 'hexapdf'
require 'pry'


filename = 'wsa.work.release.form.pdf'
document = HexaPDF::Document.open(filename)

form = document.form
binding.pry

form_enum = forms

form = form_enum.next

puts form