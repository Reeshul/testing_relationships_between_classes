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
      read_locked_diary = double
      expect(read_locked_diary).not_to receive(:read)
      secret_diary = SecretDiary.new(read_locked_diary)
      secret_diary.read
    end

    it "cannot be written in" do
      write_in_locked_diary = double
      expect(write_in_locked_diary).not_to receive(:write)
      secret_diary = SecretDiary.new(write_in_locked_diary)
      secret_diary.lock
      secret_diary.write("writing my secret story")
    end
  end
  
  context "when unlocked" do
    it "can get read" do
      read_unlocked_diary = double
      expect(read_unlocked_diary).to receive(:read)
      secret_diary = SecretDiary.new(read_unlocked_diary)
      secret_diary.unlock
      secret_diary.read
    end

    it "can get written in" do
      write_in_unlocked_diary = double
      expect(write_in_unlocked_diary).to receive(:write)
      secret_diary = SecretDiary.new(write_in_unlocked_diary)
      secret_diary.unlock
      secret_diary.write("writing my secret story")
    end
  end
end
