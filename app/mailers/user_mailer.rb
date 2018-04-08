class UserMailer < ApplicationMailer
  default from: "CRM系統發送 <service@whaledone.com>"

  def notify_order_deliver(order)
    @order = order
    
    mail(
      to: Setting.find_by(code: "EMAIL01").content,
      subject: "[茶籽堂] 訂單成立: #{@order.sn}"
      )
  end
end
