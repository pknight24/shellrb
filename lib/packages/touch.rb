# simple implementation of the 'touch' command, which can be used to create empty text files
# Initially, this can be used for simple file creation in shellrb. Eventually, I would like to allow for access time manipulation
require_relative 'ls'

class Touch
  def self.main params
    # user passes the name of the file to be created as the first parameter
    new_file = params[0]
    
    # gets a list of the files and directories currently in the directory
    
    ls = Ls.show_hidden
    file_present = false
    
    # iterates through the files in the current directory to make sure that the desired file does not exist
    ls.each do |x|
      if new_file == x
          file_present = true
      end
    end

    # creates the file if it does not exist already
    # NOTE: I thought about showing an error message if the file already exists, but the original touch command does not do this.
    # That can be added easily if deemed necessary.
    unless file_present
      File.write(new_file, '')
    end
  end
end
