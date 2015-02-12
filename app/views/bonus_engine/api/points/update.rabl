object @point
attributes :id, :message, :quantity
node(:info) { {balance: @balance, pending: @pending} }
