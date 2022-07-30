class ContactsController < ApplicationController

  def new
    @contact = EmailContact.new
  end

  def create
    @contact = EmailContact.new(contact_params)

    if @contact.save
      ContactMailer.contact_mail(@contact, current_user).deliver
      redirect_to root_path, notice:"お問い合わせ内容を送信しました"
    else
      render :new
    end

  end


  private
  def contact_params
    params.require(:email_contact).permit(:name, :content, :replyaddress)
  end

end
