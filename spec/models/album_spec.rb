require 'spec_helper'

describe Album do 
  it { should validate_presence_of(:name) }
  it { should belong_to(:customer)}
end