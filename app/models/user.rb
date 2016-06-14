class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :password, :password_confirmation
  before_create :create_ldap_user
  before_update :update_ldap_password

  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable 


	def create_ldap_user

		dn = "CN=#{self.email},OU=User,DC=gpmonline,DC=br"
		attrs = { cn: self.email , sn: self.email, objectClass: ["inetOrgPerson", "organizationalPerson", "top", "person" ], userPassword: self.password}
		#ldap = Devise::LDAP::Adapter.ldap_connect("cn=admin,dc=gpmonline,dc=br").ldap
		ldap = Devise::LDAP::Connection.admin
		ldap.add(dn: dn, attributes: attrs)
		

		if ldap.get_operation_result.code == 0
		     puts "[User]-->create_ldap_user: (0) inserido com sucesso" 
		     #errors.add(:email, "cannot be created to CA Directory")
		     
		else
		     puts "[User]-->create_ldap_user: #{ldap.get_operation_result.code}" 
		     errors.add(:email, "cannot be created to CA Directory")
		end

	
	end

	def update_ldap_password

		if(password.present? && password_confirmation.present?)
			dn = "#{self.email},OU=User,DC=gpmonline,DC=br"
			#attrs = { userPassword: self.password}
			#ldap = Devise::LDAP::Connection.admin
			ldap = Devise::LDAP::Adapter.update_password(self.email, password_confirmation)
			#ldap.update_ldap_password(self.email, password_confirmation.to_s)

			# if ldap.get_operation_result.code == 0
			#      puts "[User]-->update_ldap_password: (0) inserido com sucesso" 
			#      #errors.add(:email, "cannot be created to CA Directory")
			     
			# else
			#      puts "[User]-->update_ldap_password: #{ldap.get_operation_result.code}" 
			#      errors.add(:email, "cannot be created to CA Directory")
			# end		
		end
		
	end

end
