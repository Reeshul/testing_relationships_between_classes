require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do

  context "when locked" do 
    it "cannot be read" do
      # create a double of the diary
      read_locked_diary = double
      # we're expecting that diary double shouldn't be able to be read
      expect(read_locked_diary).not_to receive(:read)
      # create a new instance of SecretDiary using this double and attempt to read it
      secret_diary = SecretDiary.new(read_locked_diary)
      secret_diary.read
    end

    it "cannot be written in" do
      # create a double of the diary 
      write_in_locked_diary = double
      # we're expecting that diary double shouldn't be able to be written in
      expect(write_in_locked_diary).not_to receive(:write)
      # create a new instance of SecretDiary using this double and attempt to write in it
      secret_diary = SecretDiary.new(write_in_locked_diary)
      secret_diary.write("writing my secret story")
    end
  end
  
  context "when unlocked" do
    it "can get read" do
      # create a double of the diary 
      read_unlocked_diary = double
      # we're expecting that diary double should be able to be read as it will be unlocked
      expect(read_unlocked_diary).to receive(:read)
      # create a new instance of SecretDiary using this double, unlock it, and then attempt to read it
      secret_diary = SecretDiary.new(read_unlocked_diary)
      secret_diary.unlock
      secret_diary.read
    end

    it "can get written in" do
      # create a double of the diary 
      write_in_unlocked_diary = double
      # we're expecting that diary double should be able to be written in as it will be unlocked
      expect(write_in_unlocked_diary).to receive(:write)
      # create a new instance of SecretDiary using this double, unlock it, and then attempt to write in it
      secret_diary = SecretDiary.new(write_in_unlocked_diary)
      secret_diary.unlock
      secret_diary.write("writing my secret story")
    end
  end
end
