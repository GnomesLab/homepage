# encoding: UTF-8

require 'spec_helper'

describe User do

  subject { Factory.build(:user) }

  describe "validations" do

    it "recognises valid input data" do
      subject.should be_valid
    end

    describe "name" do
      it "defines name as a required attribute" do
        subject.name = nil
        subject.should_not be_valid
      end

      it "doesn't support two small names" do
        subject.name = "Pe Co"
        subject.should_not be_valid
      end

      it "doesn't support one big name" do
        subject.name = "PedroCoutinho"
        subject.should_not be_valid
      end
    end # name

    describe "devise" do
      it "enforces devise standard validations" do
        subject.email = nil
        subject.password = "123"

        subject.should_not be_valid
        subject.errors.should include :email
        subject.errors.should include :password
      end
    end #devise

  end # Validations

  describe "mass assignment protection" do
    it "only allows email and password to be mass-assignable" do
      User.new.sanitize_for_mass_assignment(:email => "hello@world.com",
                                            :password => "hello_world",
                                            :encrypted_password => "encrypted-stuff",
                                            :password_salt => "salting",
                                            :reset_password_token => "",
                                            :remember_token => "",
                                            :remember_created_at => Time.now,
                                            :sign_in_count => 1,
                                            :current_sign_in_at => Time.now,
                                            :last_sign_in_at => Time.now,
                                            :current_sign_in_ip => "",
                                            :last_sign_in_ip => "",
                                            :created_at => Time.now,
                                            :updated_at => Time.now,
                                            :name => "John Doe").should == { :email => "hello@world.com",
                                                                             :password => "hello_world" }
    end
  end # mass assignment

end
