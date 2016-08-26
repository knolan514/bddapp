require 'rails_helper'

RSpec.feature 'LandingPages', type: :feature do

  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content("Welcome to the Car Simulator")
      end
    end
  end

  context 'Filling in car info' do
    Steps 'Fill in Make, Model and Year' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can fill in the car Make, Model, and Year' do
        fill_in 'make', with: 'Toyota'
        fill_in 'model', with: 'Camry'
        fill_in 'year', with: '2007'
      end
      And 'I can submit the information' do
        click_button 'Simulate Car'
      end
      Then 'I can see the cars info' do
        expect(page).to have_content('Make: Toyota')
        expect(page).to have_content('Model: Camry')
        expect(page).to have_content('Year: 2007')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed: 0mph')
      end
      And 'I can see the lights status' do
        expect(page).to have_content('Lights: off')
      end
    end
  end

  context 'Accelerating the car' do
    Steps 'push the accelerate button' do
      Given 'I am on the status page' do
        visit 'cars/create'
      end
      Then 'I can accelerate the car' do
        click_button 'Accelerate'
      end
      And 'the speed will raise by 10' do
        expect(page).to have_content('Speed: 10mph')
      end
    end
  end

  context 'Braking the car' do
    Steps 'push the brake button' do
      Given 'I am on the status page' do
        visit 'cars/create'
      end
      Then 'I can accelerate and then brake the car' do
        click_button 'Accelerate'
        click_button 'Brake'
      end
      And 'the speed will decrease by 7' do
        expect(page).to have_content('Speed: 3mph')
      end
      And 'the speed will not go below zero.' do
        click_button 'Brake'
        expect(page).to have_content('Speed: 0mph')
      end
    end
  end


  context 'Turning the lights on and off' do
    Steps 'Toggle the lights button' do
      Given 'I am on the status page' do
        visit 'cars/create'
      end
      Then 'I can turn the lights on' do
        click_button 'Lights'
      end
      And 'The lights will show that they are on' do
        expect(page).to have_content('Lights: on')
      end
      Then 'I can turn them back off' do
        click_button 'Lights'
      end
      And 'I can expect the lights to show off' do
        expect(page).to have_content('Lights: off')
      end
    end
  end

  context 'Setting and releasing the parking brake' do
    Steps 'Hit the radio button and submit' do
      Given 'I am on the status page' do
        visit 'cars/create'
      end
      Then 'I can select a radio button and submit' do
        # visit 'parking_brake?set_release=set'
        choose 'set_release_set'
      end
      Then ''do
        click_button 'Change Brake'
      end
      And 'The brake will show that it is set' do
        expect(page).to have_content("Parking Brake: set")
      end
      Then 'I can release the brake' do
        # visit 'parking_brake?set_release=release'
        choose 'set_release_release'
      end
      Then ''do
        click_button 'Change Brake'
      end
      And 'I can expect the brake to show release' do
        expect(page).to have_content("Parking Brake: release")
      end
      Then 'I can accelerate the car and set the brake' do
        click_button 'Accelerate'
        choose 'set_release_set'
        click_button 'Change Brake'
      end
      And 'I can expect the brake not to function' do
        expect(page).to have_content("Parking Brake: release")
      end
    end
  end

  # context 'Changing color of car' do
  #   Steps 'I can pick a color from the color wheel' do
  #     Given 'I am on the landing page' do
  #       visit '/'
  #     end
  #     Then 'I can choose a color' do
  #       fill_in 'color', with: '#D2D2D2'
  #     end
  #     And 'The background of Make text will show that color' do
  #       click_button 'Simulate Car'
        # expect(page.find_by_id("make")).has_css?('div, li', text: 'FAQ')

        #  expect(page).to have_selector("div#make_#{@car.color}":style => 'background-color: #D2D2D2')

         #
        #  .find_by_id('make')).have_css('background-color').to eq('#D2D2D2')

        # expect(page.td_element(:class => "MenuItem").attribute(class).MenuItem).to be == "#c0c0c0"


      end

    end
  end



end
