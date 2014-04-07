require 'spec_helper'

describe SpotMail do
  it { should belong_to :booking}
  it { should belong_to :customer}
  it { should validate_presence_of :message_text}
end
