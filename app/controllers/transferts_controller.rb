class TransfertsController< ApplicationController
  #purpose: for showing the home page for the application

  protect_from_forgery with: :exception


  def debit

    session[:user]=User.find(1)
    carte= session[:user].carte
    article = Article.find(params[:id])
    somme=article.prix
    message=params[:message]

    ##instancie le client et appele l action soap debit

    client = Savon::Client.new("http://localhost:1234/api/transactions/wsdl")
    client.wsdl.soap_actions
    client.request(:debit) do
      soap.body = { :numero_compte => carte, :somme => somme, :message => message}
    end[:value]

    rebuy(session[:user],params[:id])

    redirect_to "/articles"
  end


  def credit

    session[:user]=User.find(1)
    carte= session[:user].carte
    article = Article.find(params[:id])
    somme=article.prix
    message=params[:message]

    ##instancie le client et appele l action soap debit

    client = Savon::Client.new("http://localhost:1235/api/transactions/wsdl")
    client.wsdl.soap_actions
    client.request(:credit) do
      soap.body = { :numero_compte => carte, :somme => somme, :message => message}
    end[:value]

    puts "toto"
    buy(session[:user],params[:id])

    redirect_to "/articles"
  end


  def buy(user,id_article)
    order=Order.new()
    order.numero=""
    order.user_id=user.id
    order.article_id=id_article
    order.save()
  end


  def rebuy(user,id_article)
    order=Order.where(user_id: user.id).last
    order.delete()
  end

end
