require 'spec_helper'

describe Picture do 
  it { should validate_presence_of(:name)}
  it { should belong_to(:album)}
end