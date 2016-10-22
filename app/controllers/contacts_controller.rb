class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    @company = @contact.company
    redirect_to company_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email, :company_id)
  end

end
