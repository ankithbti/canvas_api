class GetAccessTokensController < ApplicationController
  def index
    @get_access_tokens = GetAccessToken.all
      
    if ( !params[:code].nil? && !params[:code].empty?)
      # raise params[:code]
    else
      raise "No code comes!!!"
    end
    #access_token = "access_token=GtEXBYtduzmZbhrB6SHTSEqWZ3GhpORGIsArBzh6MyuGtJeVYBo4FcjX1BAemzpV"
    devKey = ENV['DEVELOPER_KEY']
    clientId = ENV['CLIENT_ID']
    # raise fdn
    # To get account details
    uri = URI.parse(ENV['POST_FDN_LINK'])

    
    ### General HTTP Request
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data({ 'client_id'=> clientId, 
                        'code' => params[:code],
                        'redirect_uri' =>  ENV['REDIRECT_URI'],
                        'client_secret' => devKey
                      })
    res = http.request(req)
    raise res.body

    #--------------------GET REq
    # request = Net::HTTP::Get.new(uri.request_uri)
    # response = http.request(request)
    # raise response.to_yaml
    #raise response.to_yaml
    #-----End Get----------------
    #Save Cookies-------
    # cookie = response.response['set-cookie']
    #---------
    
    #Working Post------
    # req = Net::HTTP::Post.new(uri.path + '?' + access_token)
    # req.set_form_data({'account_id'=>'2', 'course[name]' => 'ByPOSTCourse'})
    # res = http.request(req)
    # raise res.to_yaml
    #-----------End of Post--------


  end

  def show
    @get_access_token = GetAccessToken.find(params[:id])
  end

  def new
    @get_access_token = GetAccessToken.new
  end

  def create
    @get_access_token = GetAccessToken.new(params[:get_access_token])
    if @get_access_token.save
      redirect_to @get_access_token, :notice => "Successfully created get access token."
    else
      render :action => 'new'
    end
  end

  def edit
    @get_access_token = GetAccessToken.find(params[:id])
  end

  def update
    @get_access_token = GetAccessToken.find(params[:id])
    if @get_access_token.update_attributes(params[:get_access_token])
      redirect_to @get_access_token, :notice  => "Successfully updated get access token."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @get_access_token = GetAccessToken.find(params[:id])
    @get_access_token.destroy
    redirect_to get_access_tokens_url, :notice => "Successfully destroyed get access token."
  end
end
