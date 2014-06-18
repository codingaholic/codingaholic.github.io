require 'fileutils'

files = Dir["_posts/*"]

categories = Array.new

for file in files do
    lines = open(file)
    for line in lines do
        if line.start_with? 'categories'
            line.sub! 'categories: ', ''
            categories.push line
        end
    end
end

FileUtils.rm_rf('categories')
Dir.mkdir("categories") unless File.exists?("categories")

for category in categories do
    begin
        category = category.strip

        Dir.mkdir("categories/" + category) unless File.exists?("categories/" + category)
        
        out_file = File.new("categories/" + category + "/index.markdown", "w")


        out_file.puts("---")
        out_file.puts("layout: category")
        out_file.puts("category: " + category)
        out_file.puts("---")
        out_file.close
    rescue
    end
end

