require 'spec_helper'

describe User do

  it 'should have authored surveys' do

    frank = User.create!(
      name: 'Frank Rizzo',
      email: 'frank@example.com',
      password: 'password',
    )

    expect(frank.authored_surveys).to eq []

    survey = frank.authored_surveys.create!(
      title: 'Favorites'
    )

    expect(frank.authored_surveys).to eq [survey]
    expect(survey.user).to eq frank

    question1 = survey.questions.create!(
      description: 'Whats your favorite color'
    )

    expect(question1.survey).to eq survey
    expect(survey.questions).to include question1

    answers = %w(red yellow orange blue green).map do |color|
      question1.answers.create!(description: color)
    end

    expect(question1.answers).to eq answers

    answers.each do |answer|
      expect(answer.question).to eq question1
      expect(answer.survey).to eq survey
    end

  end
end
