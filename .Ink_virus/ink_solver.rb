def ink_virus_cleaner
	require 'fileutils'

	print "Surucu harfini giriniz: "
	driver = STDIN.getc
	driver += ":"
	begin
		state = (Dir.chdir(driver) == 0)? true:false
	rescue
		puts "Uyari: Driver bulunamadi!!!"
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
