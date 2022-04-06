

begin
  ARGV.include?('-a') ? about : nil
  ARGV.include?('-l') ? list_all : nil
  ARGV.include?('-h') ? help : nil
  ARGV.include?('-r') ? report_all : nil
rescue Interrupt
  system "clear"
  puts 'You ended the program.'
rescue StandardError
  system "clear"
  puts 'Sorry, an unexpected error occured. Ending program.'
end