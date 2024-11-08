require "rails_helper"

RSpec.describe Idea do
  it "has a name" do # yep, you can totally use 'it'
    idea = Idea.create!(name: "My Awesome Idea Name") # creating a new idea 'instance'
    expect(idea.name).to eq("My Awesome Idea Name") # this is our expectation
  end

  it "has a description" do
    idea = Idea.create!(description: "My Awesome Idea Description")
    expect(idea.description).to eq("My Awesome Idea Description")
  end

  it "has comments" do
    idea = Idea.create!(name: "My Awesome Idea Name")
    comment = Comment.create!(
      user_name: "My name",
      body: "My helpful comment",
      idea: idea # Link the comment to the idea
    )

    expect(comment.idea).to eq(idea)
  end

  it "has a picture" do
    test_image = Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/test_image.jpg"), "image/jpg")

    idea = Idea.create!(picture: test_image)

    expect(idea.picture).to be_present
    expect(idea.picture.filename).to eq("test_image.jpg")
  end

  #test for name and description
  it "has a name and a description" do
    idea = Idea.create!(name: "My Awesome Idea Name", description: "My Awesome Idea Description")

    expect(idea.name).to eq("My Awesome Idea Name")
    expect(idea.description).to eq("My Awesome Idea Description")
  end

  #test for name, description and picture
  it "has a name, description, and picture" do
    # Use a test image for the picture attribute
    test_image = Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/test_image.jpg"), "image/jpg")

    idea = Idea.create!(
      name: "My Awesome Idea Name",
      description: "My Awesome Idea Description",
      picture: test_image
    )

    # Expectations for each attribute
    expect(idea.name).to eq("My Awesome Idea Name")
    expect(idea.description).to eq("My Awesome Idea Description")
    expect(idea.picture).to be_present
    expect(idea.picture.filename).to eq("test_image.jpg")
  end
end