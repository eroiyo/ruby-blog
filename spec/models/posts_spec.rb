# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validates' do
    subject { Post.new title: 'Starting validation', user_id: 1 }

    before { subject.save }

    it 'The title should not be bigger than' do
      subject.title = 'ZzzzzZZ' * 250
      expect(subject).to_not be_valid
    end

    it 'should have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'The comments number should not be negative' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'The likes number should not be negative' do
      subject.likes_counter = -2
      expect(subject).to_not be_valid
    end

    it 'should not have a blank title' do
      subject.title = ' '
      expect(subject).to_not be_valid
    end
  end

  # describe '#update_counter' do
  #  subject { Post.first }

  # it 'should update the user posts counter' do
  #   subject.update_counter(2)
  #   expect(subject.user.posts_counter).to be(2)
  #  end
  # end
end
