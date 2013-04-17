require 'test_helper'

class PayrollsControllerTest < ActionController::TestCase
  setup do
    @payroll = payrolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payrolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payroll" do
    assert_difference('Payroll.count') do
      post :create, payroll: { bonus: @payroll.bonus, end_date: @payroll.end_date, irpf: @payroll.irpf, no_bonuses: @payroll.no_bonuses, overtime: @payroll.overtime, payment_in_kind: @payroll.payment_in_kind, salary: @payroll.salary, salary_bonus: @payroll.salary_bonus, social_sec_contribution: @payroll.social_sec_contribution, start_date: @payroll.start_date }
    end

    assert_redirected_to payroll_path(assigns(:payroll))
  end

  test "should show payroll" do
    get :show, id: @payroll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payroll
    assert_response :success
  end

  test "should update payroll" do
    put :update, id: @payroll, payroll: { bonus: @payroll.bonus, end_date: @payroll.end_date, irpf: @payroll.irpf, no_bonuses: @payroll.no_bonuses, overtime: @payroll.overtime, payment_in_kind: @payroll.payment_in_kind, salary: @payroll.salary, salary_bonus: @payroll.salary_bonus, social_sec_contribution: @payroll.social_sec_contribution, start_date: @payroll.start_date }
    assert_redirected_to payroll_path(assigns(:payroll))
  end

  test "should destroy payroll" do
    assert_difference('Payroll.count', -1) do
      delete :destroy, id: @payroll
    end

    assert_redirected_to payrolls_path
  end
end
