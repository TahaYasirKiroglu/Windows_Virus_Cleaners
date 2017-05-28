def ink_virus_cleaner
	require 'fileutils'

	print "Surucu harfini giriniz: "
	driver = STDIN.getc
	driver += ":"
	begin
	Dir.chdir(driver)
	rescue
		puts "Uyari: Driver bulunamadi!!!"
		puts "Cikmak icin bir tusa basiniz..."
		STDIN.getc
		return false
	end		
	
	dirs = Dir.glob('*')
	system('del *.Ink')
	
	system("attrib -h -r -s /s /d #{driver}\\*.*")
	
	dir_index = 0
	dirs.each do |dir|
		if dir.size < 2
			FileUtils.mv dir, 'kurtarilan_dosya#{dir_index}'
			dir_index += 1
		end
	end
end

ink_virus_cleaner
