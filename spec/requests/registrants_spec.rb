require 'spec_helper'

describe "Registration pages" do
  describe "validate field should exist" do
    subject {page}

    context "visit registration url" do
      before {visit '/registrants/new'}
      describe "should have title BugDay 2013" do
        it {should have_selector 'title', text: 'BugDay 2013'}
      end

      describe "should have input type text and id = registrant_name" do
        it {should have_selector 'input#registrant_name[type="text"]'}
      end

      describe "should have input type text and id = registrant_email" do
        it {should have_selector 'input#registrant_email[type="text"]'}
      end

      describe "should have submit button" do
        #it {should have_selector 'input[type="submit"]'}
        it { should have_button 'Register' }
      end
    end
  end

  describe "fill form" do
    before {visit '/registrants/new'}
    subject {page}
    describe "fill form with valid name and invalid email" do
      before do
        fill_in 'registrant_name', with: 'pitsanu'
        fill_in 'registrant_email', with: 'invalid_email_address'
        click_button 'Register'
      end
      it{ should have_button 'Register' }
      it{ should have_content 'Email is invalid' }
    end

    describe "fill form with blank name and invalid email" do
      before do
        fill_in 'registrant_name', with: ''
        fill_in 'registrant_email', with: 'invalid_email_address'
        click_button 'Register'
      end
      it{ should have_content 'Name can\'t be blank' }
      it{ should have_content 'Email is invalid' }
    end


    describe "fill form with valid name and valid email" do
      before do
        fill_in 'registrant_name', with: 'pitsanu'
        fill_in 'registrant_email', with: 'roong.p@ppteam.net'
      end
      it 'should create new registrant' do
        expect { click_button 'Register' }.to change(Registrant, :count).by(1)
      end
    end
  end
end
