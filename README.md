Sleep
=====

A basic bedtime calculator to find 6 sleep-cycle times for good night's sleep


## Install


**Gemfile**

	gem 'sleep'

**RubyGem**

	gem install sleep


## Command Line Interface

List of commands

	> bedtime help

Sleep now

	> bedtime now
	
	Wake up at one of the following times (Set your alarm clock):

	10:28 PM (1.5h)
	11:58 PM (3.0h)
	1:28 AM (4.5h)
	2:58 AM (6.0h)
	4:28 AM (7.5h)
	5:58 AM (9.0h)

Wake up at

	> bedtime wakeup_at 8:30 AM
	
	Sleep at one of the following times:

	7:00 AM (1.5h)
	5:30 AM (3.0h)
	4:00 AM (4.5h)
	2:30 AM (6.0h)
	1:00 AM (7.5h)
	11:30 PM (9.0h)

## Usage

	require 'sleep'
	
	sleep = Sleep.new
	
	
#### Optionals
	
	sleep.delay = true
	sleep.sleep_delay = 14 # minutes
	
	
#### Sleep now

	p sleep.now
	

#### Next wake up time

	p sleep.next(Time.now)


#### Previous wake up time

	p sleep.previous(Time.now)

#### Wake up at

	p sleep.wakeup_at("6:30am")

	p sleep.wakeup_at("in 2 hours")
	
#### Sleep at

	p sleep.sleep_at("10:30pm"")
	
	p sleep.sleep_at("in 15 minutes")


## References

* [The Power of the Sleep Cycle](http://www.glenrhodes.com/?p=132)


## Credits

* [Chronic](https://github.com/mojombo/chronic) for amazing natural language date/time parser

## License

Sleep is licensed under the MIT license.
