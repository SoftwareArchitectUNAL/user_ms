class WsusersController < ApplicationController
soap_service namespace: 'urn:WashOutUser', camelize_wsdl: :lower

      # Check user existence in DB by searching its username... returns (true/false) + id
      soap_action "checkUsername",
                     :args => { :username => :string },
                     :return => { :userValid => :boolean, :userId => :integer}
      def checkUsername
          if (User.exists?(username: params[:username]))
              user = User.where(username: params[:username]).first
              render :soap => { :userValid => true, :userId => user.id}
          else
              render :soap => { :userValid => false, :userId => -1}
          end
      end

      # Check user existence in DB by searching its id... returns (true/false) + username
      soap_action "checkUserId",
                     :args => { :userId => :integer },
                     :return => { :userValid => :boolean, :username => :string }
      def checkUserId
          if(User.exists?(id: params[:userId]))
              user = User.find(params[:userId])
              render :soap => { :userValid => true, :username => user.username }
          else
              render :soap => { :userValid => false, :username => "" }
          end
      end
end
