namespace :haml do
    desc 'Convert ERB files to HAML'
    task :replace_erbs do
      Dir.glob('app/views/**/*.erb').each do |erb_file|
        haml_file = erb_file.sub(/\.erb$/, '.haml')
        puts "Converting #{erb_file} to #{haml_file}"
        system("html2haml -e #{erb_file} #{haml_file}")
      end
    end
  end
