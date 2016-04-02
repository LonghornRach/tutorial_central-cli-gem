require 'spec_helper'

describe TutorialCentral do

  it 'has a version number' do
    expect(TutorialCentral::VERSION).not_to be nil
  end

  it 'offers the option of listing categories or recent tutorials' do
    pending
  end

  it 'reprompts user after incorrect input' do
    pending
  end

  it 'lists all recent tutorials' do
    latest = "http://hackr.io/latest"
    expect(TutorialCentral::Scraper.new.scrape_tutorials(latest).class).to eq Array
  end

  it 'lists all tutorials in a category' do
    pending
  end

  it 'responds to user tutorial choice by displaying url' do
    pending
  end

  it 'asks user if they would like to return to main menu or quit' do
    pending
  end
end
