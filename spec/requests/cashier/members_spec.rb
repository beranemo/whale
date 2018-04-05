RSpec.describe 'Cashier::Member', type: :request do
  include MembersHelper
  let(:cashier_user) { create(:user, email: FFaker::Internet.email, name: 'cashier1',role: "cashier") }
  let(:user_with_orders) { create(:user_with_orders) }



  context 'go to cashier member page' do
    

    describe 'if no user log in.' do
      it 'should redirect to log in page' do
        
        get cashier_members_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'if cashier user log in. ' do
      before do 
        create_members
        sign_in(cashier_user)
      end

      it 'Go member index page should redirect to cashier_root_path' do
        
        get cashier_members_path
        expect(response).to redirect_to(cashier_root_path)

      end

      it 'Go member birth_day_this_month page should show member that birth_day in this month' do
        
        get birthday_this_month_cashier_members_path
        expect(response).to have_http_status 200
        expect(assigns(:members).count).to eq 3
      end

      it 'Go member birth_day_next_month page should show member that birth_day in next month' do
        
        get birthday_next_month_cashier_members_path
        expect(response).to have_http_status 200
        expect(assigns(:members).count).to eq 2
      end
    end
  end
end