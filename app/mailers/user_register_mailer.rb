class UserRegisterMailer < Devise::Mailer

	def confirmation_instructions(record, token, opts={})
	  headers["Custom-header"] = "Bar"
	  opts[:from] = 'sew.info.2017@gmail.com'
	  opts[:reply_to] = 'sew.info.2017@gmail.com'
	  super
	end
end