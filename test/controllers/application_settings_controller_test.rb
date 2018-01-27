require 'test_helper'

class ApplicationSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @application_setting = application_settings(:one)
  end

  test "should get index" do
    get application_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_application_setting_url
    assert_response :success
  end

  test "should create application_setting" do
    assert_difference('ApplicationSetting.count') do
      post application_settings_url, params: { application_setting: { setting: @application_setting.setting, value: @application_setting.value } }
    end

    assert_redirected_to application_setting_url(ApplicationSetting.last)
  end

  test "should show application_setting" do
    get application_setting_url(@application_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_application_setting_url(@application_setting)
    assert_response :success
  end

  test "should update application_setting" do
    patch application_setting_url(@application_setting), params: { application_setting: { setting: @application_setting.setting, value: @application_setting.value } }
    assert_redirected_to application_setting_url(@application_setting)
  end

  test "should destroy application_setting" do
    assert_difference('ApplicationSetting.count', -1) do
      delete application_setting_url(@application_setting)
    end

    assert_redirected_to application_settings_url
  end
end
