class User < ActiveRecord::Base
    before_create :generate_token
    has_many :roles

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    def to_s
        "#{email} (#{admin? ? "Admin" : "User"})"
    end

    def role_on(project)
        roles.find_by(project_id: project).try(:name)
    end

    private
        def generate_token
            self.token = SecureRandom.uuid
        end
end
