#####################################################################
# test_eventlog.rb
#
# Test case for the Windows::EventLog module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/eventlog'
require 'test/unit'

class TC_Windows_EventLog < Test::Unit::TestCase
  include Windows::EventLog

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end
   
  def test_eventlog_constants
    assert_equal(1, EVENTLOG_SEQUENTIAL_READ)
    assert_equal(2, EVENTLOG_SEEK_READ)
    assert_equal(4, EVENTLOG_FORWARDS_READ)
    assert_equal(8, EVENTLOG_BACKWARDS_READ)
    assert_equal(0, EVENTLOG_SUCCESS)
    assert_equal(1, EVENTLOG_ERROR_TYPE)
    assert_equal(2, EVENTLOG_WARNING_TYPE)
    assert_equal(4, EVENTLOG_INFORMATION_TYPE)
    assert_equal(8, EVENTLOG_AUDIT_SUCCESS)
    assert_equal(16, EVENTLOG_AUDIT_FAILURE)
    assert_equal(0, EVENTLOG_FULL_INFO)
  end
   
  def test_eventlog_functions_defined
    assert_respond_to(self, :BackupEventLogA)
    assert_respond_to(self, :BackupEventLogW)
    assert_respond_to(self, :ClearEventLogA)
    assert_respond_to(self, :ClearEventLogW)
    assert_respond_to(self, :CloseEventLog)
    assert_respond_to(self, :DeregisterEventSource)
    assert_respond_to(self, :GetEventLogInformation)
    assert_respond_to(self, :GetNumberOfEventLogRecords)
    assert_respond_to(self, :GetOldestEventLogRecord)
    assert_respond_to(self, :NotifyChangeEventLog)
    assert_respond_to(self, :OpenBackupEventLogA)
    assert_respond_to(self, :OpenBackupEventLogW)
    assert_respond_to(self, :OpenEventLogA)
    assert_respond_to(self, :OpenEventLogW)
    assert_respond_to(self, :ReadEventLogA)
    assert_respond_to(self, :ReadEventLogW)
    assert_respond_to(self, :RegisterEventSourceA)
    assert_respond_to(self, :RegisterEventSourceW)
    assert_respond_to(self, :ReportEventA)
    assert_respond_to(self, :ReportEventW)
  end

  def test_eventlog_functions_defined_on_vista_and_later
    msg = "eventlog tests skipped on XP and earlier"
    omit_if(@@version < 6.0, msg)
    assert_respond_to(self, :EvtCancel)
  end

  def self.shutdown
    @@version = nil
  end
end
