require 'spec_helper'

describe Waiter do
	let(:waiter) { Waiter.new(:name => "Floyd Glass", :password => "123", :cpf => "73726742000172", :phone => "(71) 8202-7484") }

	it "is valid with a name" do
	  	waiter.should be_valid
	end

  	it "is not valid without a name" do
    	waiter.name = ""
    	waiter.should_not be_valid
  	end	
end