class UserMailer < ApplicationMailer
  default from: "My Cart <info@alphacamp.co>"

  def notify_order_deliver(order)
    @order = order
   

    mail to: User.find_by(role: "storehouse").email,
    subject: "茶籽堂 | 訂單成立: #{@order.id}"
  end
end
