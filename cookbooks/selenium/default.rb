package "python-pip"

execute "install python selenium" do
  user "root"
  command "pip install selenium"
end

include_recipe "./xvfb.rb"
include_recipe "./chrome.rb"
