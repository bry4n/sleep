require 'minute'

# Sleep - A basic sleep-cycle calculator
#
# Example:
#
#   require 'sleep'
#
#   sleep = Sleep.new
#
#   p sleep.now
#   #=> [...]
#
class Sleep

  attr_accessor :delay, :sleep_delay, :sleep_cycle

  def initialize
    @delay        = false
    @sleep_delay  = 14 # average sleep delay minutes
    @sleep_cycle  = 90 # sleep cycle minutes
  end

  def now
    sleep_cycles(Time.now)
  end

  def sleep_at(time)
    time = Minute.parse(time)
    sleep_cycles(time)
  end

  def wakeup_at(time)
    time = Minute.parse(time)
    sleep_cycles(time, true)
  end

  def next(time)
    time = time.is_a?(String) ? Minute.parse(time) : time
    next_cycle(time).strftime("%l:%M %p")
  end

  def previous(time)
    time = time.is_a?(String) ? Minute.parse(time) : time
    prev_cycle(time).strftime("%l:%M %p")
  end

  private

  def next_cycle(time = Time.now)
    cycle = @delay ? @sleep_cycle + @sleep_delay : @sleep_cycle
    Minute.parse("in #{cycle} minutes", now: time)
  end

  def prev_cycle(time = Time.now)
    cycle = @delay ? @sleep_cycle + @sleep_delay : @sleep_cycle
    Minute.parse("#{cycle} minutes ago", now: time)
  end

  def time_distance(from_time, to_time)
    minutes = (to_time - from_time).abs/60
    (minutes / 60).round(1)
  end

  def sleep_cycles(time, past = false)
    cycles = []
    cycle_time = time
    6.times do |i|
      cycle_time  = if !past
                      next_cycle(cycle_time)
                    else
                      prev_cycle(cycle_time)
                    end
      dist        = if !past
                      time_distance(time, cycle_time)
                    else
                      time_distance(cycle_time, time)
                    end
      cycles      << cycle_time.strftime("%l:%M %p (#{dist}h)").gsub(/^\s+/, '')
    end
    cycles
  end

end
