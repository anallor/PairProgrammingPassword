require 'rspec'


class PasswordChecker
	def check_password email, password
		@email = email.to_s
		@password = password.to_s
		if check_length(@password) == true && check_characters(@password) == true && check_words(@email, @password)
			true
		else
			false
		end

	end

	def check_length password
		if @password.length < 7
			false
		else
			true
		end
	end

	def check_characters password
		special = "?<>',?[]}{=-)(*&^%$#`~{}"
		regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/

		if @password =~ regex && @password =~ /\d/ && @password =~ /[a-z]/ && @password =~ /[A-Z]/ 
			true
		else
			false
		end
	end

	def check_words email, password
		email_parts = []
		domain = []
		email_parts = @email.split("@")
		domain = email_parts[1].to_s.split(".")

		if @password.include?(email_parts[0].to_s) || @password.include?(domain[0].to_s)
			false
		else
			true
		end
	
	end
end