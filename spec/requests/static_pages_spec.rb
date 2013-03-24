require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    subject {page}

    context 'visit home page url' do
      before {visit '/static_pages/home'}
      describe "should has title 'BugDay 2013'" do
        it {should have_selector 'title', text: 'BugDay 2013'}
      end
      describe "should has content 'Celebrate when we found Bug'" do
        it {should have_content 'Celebrate when we found Bug'}
      end
      describe "should has link to registration page" do
        it {should have_link 'Registration', href: '/registrants/new'}
      end
    end

    context 'click on registration link' do
      before {visit '/static_pages/home'}
      describe 'should show registration page' do
        before {click_link 'Registration'}
        it {current_path.should == '/registrants/new'}
        it {should have_selector 'h1', text: 'Registration Page'}
      end
    end

  end
end
