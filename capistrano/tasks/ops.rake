#
# Requires the following configuration variables to be set in the stage file:
#
# ops_path
# ops_ansible_inventory
# ops_ansible_playbook
#

namespace :ops do

	desc "Update the ops submodule"
	task :update do
		on roles(:all), in: :parallel do
			within fetch(:ops_path) do
				execute :git, "submodule update --init"
			end
		end
	end

	desc "Perform local Ansible provisioning"
	task :provision do
		on roles(:all), in: :parallel do |server|
			within File.join(fetch(:ops_path), 'packer/ansible') do
				execute "ansible-playbook", "-i ", fetch(:ops_ansible_inventory), "--limit #{server.properties.name}", fetch(:ops_ansible_playbook)
			end
		end
	end

end
