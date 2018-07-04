VERSION = '1.1.1'
class InkCleaner
  require 'fileutils'
  SYSTEM_FILES = ['Thumbs.db', 'System Volume Information']  
  def self.start
    @dirs = []
    choose_driver
    return false unless change_dir
    clear_ink
    clear_dirs
    remove_permissions
  end
  
  def self.choose_driver
    puts 'Kullanilabilir Diskler: '
    system 'wmic logicaldisk get caption, volumename, description'
    print 'Surucu harfini giriniz: '
    @driver = STDIN.getc.upcase + ':'
  end
  
  def self.clear_ink
    puts "ink dosyalari temizleniyor..."
    Dir.glob('*').each do |w|
      if w.downcase.end_with? 'ink'
        File.delete w
      else
        @dirs << w
      end
    end
  end
  
  def self.clear_dirs
    SYSTEM_FILES.each { |f| @dirs.delete f if @dirs.include? f }
  end
  
  def self.remove_permissions
    puts "Dosya izinleri ayarlaniyor..."
    @dirs.each { |d| system 'attrib +h -r -s /s /d ' + d }
  end
  
  def self.change_dir
    Dir.chdir @driver
    true
  rescue
    puts "Uyari: Driver bulunamadi!!!"
    puts "Cikmak icin bir tusa basiniz..."
    STDIN.getc
    false
  end
  
  def self.change_name
    dir_index = 1
    @dirs.each do |dir|
      if dir.size < 2
        FileUtils.mv dir, "kurtarilan_dosya_#{dir_index}"
        dir_index += 1
      end
    end
  end
end

InkCleaner.start
