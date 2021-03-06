# == Schema Information
#
# Table name: test_attempts
#
#  id              :bigint(8)        not null, primary key
#  next_attempt_at :datetime
#  test_level      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  referee_id      :integer
#  test_id         :integer
#

require 'rails_helper'

RSpec.describe TestAttempt, type: :model do
  context 'when test_level has changed' do
    let(:test_attempt) { build :test_attempt }

    subject { test_attempt.save! }

    before { Timecop.freeze(Time.now.utc) }

    context 'when test_level is snitch' do
      let(:expected_date) { Time.now.utc + 24.hours }

      it 'sets the next_attempt_at 24 hours from current time' do
        expect { subject }.to change { test_attempt.next_attempt_at }.to(expected_date)
      end
    end

    context 'when test_level is assistant' do
      let(:test_attempt) { build :test_attempt, test_level: :assistant }
      let(:expected_date) { Time.now.utc + 24.hours }

      it 'sets the next_attempt_at 24 hours from current time' do
        expect { subject }.to change { test_attempt.next_attempt_at }.to(expected_date)
      end
    end

    context 'when test_level is head' do
      let(:test_attempt) { build :test_attempt, test_level: :head }
      let(:expected_date) { Time.now.utc + 72.hours }

      it 'sets the next_attempt_at 72 hours from current time' do
        expect { subject }.to change { test_attempt.next_attempt_at }.to(expected_date)
      end
    end
  end
end
