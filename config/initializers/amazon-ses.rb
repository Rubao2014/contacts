ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  #access_key_id: ENV['AMAZON_ACCESS_KEY_GPM_MAILER'],
  #secret_access_key: ENV['AMAZON_SECRET_KEY_GPM_MAILER']
     :access_key_id => 'AKIAIAR4L6YBWZDGKINQ',
   :secret_access_key => 'Ar149k4qAMnwBy1AlqnrGTFb2GvK4GQuGA4b9uGA4SHY'

#    ses = AWS::SES::Base.new(
#   :access_key_id     => 'AKIAJ7XHQCX4FYQSAJRQ', 
#   :secret_access_key => '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'
# )

#    ses.send_email(
#              :to        => ['rhsouza30@gmail.com'],
#              :source    => 'rubens.desouza@ca.com',
#              :subject   => 'Teste SES AWS',
#              :text_body => 'Email de Teste'
# )