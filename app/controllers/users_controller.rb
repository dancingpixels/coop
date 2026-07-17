class UsersController < ApplicationController
  def index
    @user = User.find_by(name: Current.user.name)
    @transaction_date = @user.transactions.last.date
    @savings_balance  = @user.transactions.last.savings_balance
    @savings_debit    = @user.transactions.last.savings_debit
    @loan_balance     = @user.transactions.last.loan_balance
    @loan_repayment   = @user.transactions.last.loan_repayment
   end

   def transactions
      @user = User.find_by(name: Current.user.name)
      @transactions = @user.transactions
   end

   def edit
    @user = User.find(params[:id])
   end

   def update
    @user = User.find(params[:id])
    user_params = params.require(:user).permit(:email_address, :telephone)
    if @user.update(user_params)
       redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
   end
end
