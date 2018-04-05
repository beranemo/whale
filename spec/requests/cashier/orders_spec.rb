RSpec.describe 'Cashier::Order', type: :request do
  let(:cashier_user) { create(:user, email: FFaker::Internet.email, name: 'cashier1') }
   let(:user_with_orders) { create(:user_with_orders) }
  let(:user_with_orders) { create(:user_with_orders) }


  context 'go to cashier order page' do
    describe 'if no user log in' do
      it 'should redirect to log in page' do
        
        get cashier_orders_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'if cashier user log in' do
      

      it 'should show today orders' do
        sign_in(cashier_user)
        
        user_with_orders
        get cashier_orders_path
        expect(response).to have_http_status 200
        expect(assigns(:orders).count).to eq 1
      end
    end
  end
end