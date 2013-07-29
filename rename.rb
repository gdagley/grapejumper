
app_name = ARGV[0]

unless app_name
  puts "Usage: ruby rename.rb new_app_name"
  exit
end

# In case someone uses CamelCaseAppName
app_name = app_name.gsub(/(.)([A-Z])/,'\1_\2')
app_name.downcase!

underscore_project_name = app_name.gsub(/\W/, '_').squeeze('_')
camel_project_name = underscore_project_name.split('_').map {|w| w.capitalize }.join
hyphen_project_name = underscore_project_name.gsub('_', '-')
title_project_name = underscore_project_name.split('_').map {|w| w.capitalize }.join(' ')
lower_project_name = camel_project_name.downcase

replacements = [
  ['grape_jumper', underscore_project_name],
  ['GrapeJumper', camel_project_name],
  ['grape-jumper', hyphen_project_name],
  ['Grape Jumper', title_project_name],
  ['grapejumper', lower_project_name],
]

system "mv grapejumper.fdoc.meta #{lower_project_name}.fdoc.meta"

files = Dir.glob("**/*.*")
#these files need to be manually added because they will not be picked up by the glob
files << ".ruby-gemset"
files << "Rakefile"
files.each do |filename|
  next if filename == "rename.rb" || File.directory?(filename)

  puts filename
  replacements.each do |orig_name, new_name|
    puts "    Replacing #{orig_name} with #{new_name}"
    content = File.binread(filename)
    content.gsub!(orig_name, new_name)
    File.open(filename, 'wb') { |file| file.write(content) }
  end
end
