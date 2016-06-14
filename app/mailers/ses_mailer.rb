class SesMailer < ActionMailer::Base
	default from: 'mailer@gpmonline.com.br' 
	def welcome
	 mail(to:'rhsouza30@outlook.com', subject: 'I emailed from AmazonSES!') 
	end
end