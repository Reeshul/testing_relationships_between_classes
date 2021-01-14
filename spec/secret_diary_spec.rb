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

  let(:read_locked_diary) { double :read => "reading my secret story" }
  let(:write_in_locked_diary) { double :write => "writing my secret story" }

  context "when locked" do 
    it "cannot be read" do
      diary = SecretDiary.new(read_locked_diary)
      expect(diary.read).to eq("Go away!")
    end

    it "cannot be written in" do
      diary = SecretDiary.new(write_in_locked_diary)
      expect(diary.write("writing my secret story")).to eq("Go away!")
    end
  end

  let(:read_unlocked_diary) { double :read => "reading my secret story" }
  let(:write_in_unlocked_diary) { double :write => "writing my secret story" }

  context "when unlocked" do
    it "can get read" do
      diary = SecretDiary.new(read_unlocked_diary)
      diary.unlock
      expect(diary.read).to eq("reading my secret story")
    end

    it "can get written in" do
      diary = SecretDiary.new(write_in_unlocked_diary)
      diary.unlock
      expect(diary.write("writing my secret story")).to eq(nil)
    end
  end
end
