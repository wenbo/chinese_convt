require 'chinese_convt'
require 'find'

path = Dir.pwd 

Find.find(path) do |path|
  @path  = path
  if FileTest.directory?(@path)
    if File.basename(@path)[0] == ?.
      Find.prune
    else
      next
    end
  else
  end
  puts  @path

  def read_file(file_name)



    #打开
    #file = File.open("/home/bob/dir1/file1.txt", "r")
    file = File.open(@path, "r")
    @cn_file_name = 'cn_' + File.basename(file)
    data = file.read
    file.close
    return Chinese.zh2cn data
  end

  #保存
  def save_file
    output = File.open( "#{File.dirname(@path)}/#{@cn_file_name}", "w" )
    #output = File.open( "#{@cn_file_name}", "w" )
    output << @data
    output.close
  end




  files = Dir.glob('*.txt')

  files.each do |item|
    @file_name = ARGV[0]

    open(item,"r+") {|f|
      puts "Open and read file..."
      @data = read_file(f)
      puts "Done"
      puts ''

      puts "Save to #{@cn_file_name}"
      save_file
      puts "Done"
      puts ''
    }
  end
end
