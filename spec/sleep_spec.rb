require File.expand_path("../spec_helper", __FILE__)

describe Sleep do

  before do
    @sleep = Sleep.new
  end

  it "settings" do
    assert_equal @sleep.delay, false
    assert_equal @sleep.sleep_delay, 14
    assert_equal @sleep.sleep_cycle, 90
  end

  it "#now" do
    assert_kind_of Array, @sleep.now
    assert_equal @sleep.now.size, 6
    assert @sleep.now.first =~ /\d+:\d+ (PM|AM)/
  end

  it "#next" do
    assert_kind_of String, @sleep.next(Time.now)
    assert_kind_of String, @sleep.next("in 15 minutes")
  end

  it "#previous" do
    assert_kind_of String, @sleep.previous(Time.now)
    assert_kind_of String, @sleep.previous("30 minutes ago")
  end

  it "#wakeup_at" do
    list = @sleep.wakeup_at("8:30pm")
    assert_kind_of Array, list
    assert_equal list.size, 6
    assert list.first =~ /\d+:\d+ (PM|AM)/
  end

  it "#sleep_at" do
    list = @sleep.sleep_at("11:30pm")
    assert_kind_of Array, list
    assert_equal list.size, 6
    assert list.first =~ /\d+:\d+ (PM|AM)/
  end

end
