#####################################################################
# test_service.rb
#
# Test case for the Windows::Service module.
#####################################################################
require 'rubygems'
gem 'test-unit'
require 'windows/service'
require 'test/unit'

class TC_Windows_Service < Test::Unit::TestCase
  include Windows::Service

  def self.startup
    @@version = `ver`[/\d.\d/].to_f
  end

  def test_service_constants
    assert_equal(0, SC_ACTION_NONE)
    assert_equal(1, SC_ACTION_RESTART)
    assert_equal(2, SC_ACTION_REBOOT)
    assert_equal(3, SC_ACTION_RUN_COMMAND)
  end

  def test_service_functions_defined
    assert_respond_to(self, :ChangeServiceConfigA)
    assert_respond_to(self, :ChangeServiceConfigW)
    assert_respond_to(self, :ChangeServiceConfig2A)
    assert_respond_to(self, :ChangeServiceConfig2W)
    assert_respond_to(self, :CloseServiceHandle)
    assert_respond_to(self, :ControlService)
    assert_respond_to(self, :CreateServiceA)
    assert_respond_to(self, :CreateServiceW)
    assert_respond_to(self, :DeleteService)
    assert_respond_to(self, :EnumDependentServicesA)
    assert_respond_to(self, :EnumDependentServicesW)
    assert_respond_to(self, :EnumServicesStatusA)
    assert_respond_to(self, :EnumServicesStatusW)
    assert_respond_to(self, :EnumServicesStatusExA)
    assert_respond_to(self, :EnumServicesStatusExW)
    assert_respond_to(self, :GetServiceDisplayNameA)
    assert_respond_to(self, :GetServiceDisplayNameW)
    assert_respond_to(self, :GetServiceKeyNameA)
    assert_respond_to(self, :GetServiceKeyNameW)
    assert_respond_to(self, :LockServiceDatabase)
    assert_respond_to(self, :NotifyBootConfigStatus)
    assert_respond_to(self, :OpenSCManagerA)
    assert_respond_to(self, :OpenSCManagerW)
    assert_respond_to(self, :OpenServiceA)
    assert_respond_to(self, :OpenServiceW)
    assert_respond_to(self, :QueryServiceConfigA)
    assert_respond_to(self, :QueryServiceConfigW)
    assert_respond_to(self, :QueryServiceConfig2A)
    assert_respond_to(self, :QueryServiceConfig2W)
    assert_respond_to(self, :QueryServiceStatus)
    assert_respond_to(self, :QueryServiceStatusEx)
    assert_respond_to(self, :RegisterServiceCtrlHandlerA)
    assert_respond_to(self, :RegisterServiceCtrlHandlerW)
    assert_respond_to(self, :RegisterServiceCtrlHandlerExA)
    assert_respond_to(self, :RegisterServiceCtrlHandlerExW)
    assert_respond_to(self, :SetServiceBits)
    assert_respond_to(self, :SetServiceStatus)
    assert_respond_to(self, :StartServiceA)
    assert_respond_to(self, :StartServiceW)
    assert_respond_to(self, :StartServiceCtrlDispatcherA)
    assert_respond_to(self, :StartServiceCtrlDispatcherW)
    assert_respond_to(self, :UnlockServiceDatabase)
  end

  def test_service_functions_defined_vista_or_later
    msg = "service tests skipped except on Vista or later"
    omit_unless(@@version >= 6.0, msg)
    assert_respond_to(self, :ControlServiceExA)
    assert_respond_to(self, :ControlServiceExW)
    assert_respond_to(self, :NotifyServiceStatusChangeA)
    assert_respond_to(self, :NotifyServiceStatusChangeW)
  end

  def self.shutdown
    @@version = nil
  end
end
