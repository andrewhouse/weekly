class ItemMailer < ActionMailer::Base
  default from: "from@example.com"

  def item_email_update projection
    @item = projection.item
    mail(to: projection.user.email, subject: "#{@item.title} From Weekly Has Been Updated!")
  end
end
