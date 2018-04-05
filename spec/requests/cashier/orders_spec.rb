RSpec.describe 'Cashier::Order', type: :request do
  include OrdersHelper
  let(:cashier_user) { create(:user, email: FFaker::Internet.email, name: 'cashier1',role: "cashier") }
  let(:user_with_orders) { create(:user_with_orders) }



  context 'go to cashier order page' do
    

    describe 'if not user log in' do
      it 'should redirect to log in page' do
        
        get cashier_orders_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'if cashier user log in ' do
      before do 
        create_user_list
        create_orders
        user_with_orders

        sign_in(cashier_user)
      end

      it 'Go orders index page should redirect to cashier_root_path' do      
        get cashier_orders_path
        expect(response).to redirect_to(cashier_root_path)

      end


      it 'Go today orders page should show only today orders' do
        
        get today_cashier_orders_path
        expect(response).to have_http_status 200
        expect(assigns(:orders).count).to eq 2
        expect(Order.all.count).to eq 7
      end

      it 'Go not pick orders page should show orders not picked up' do
        
        get not_pick_cashier_orders_path
        expect(response).to have_http_status 200
        expect(assigns(:orders).count).to eq 1
        expect(Order.all.count).to eq 7
      end
    end
  end
end