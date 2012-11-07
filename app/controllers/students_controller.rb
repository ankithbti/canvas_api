class StudentsController < ApplicationController

  require 'faraday'
  require 'net/http'
  require 'net/https'

  def index
    @students = Student.all
    @fdn =  ENV['FDN_LINK'] + ENV['GET_DATA']
    access_token = "access_token=" + ENV['ACCESS_TOKEN']
    fdn = "https://localhost//api/v1/accounts/2/courses?" + access_token
    
    # To get account details
    uri = URI.parse(fdn)

    
    ### General HTTP Request
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #--------------------GET REq
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    raise response.to_yaml
    #-----End Get----------------
    #Save Cookies-------
    # cookie = response.response['set-cookie']
    #---------
    
    #Working Post------
    # req = Net::HTTP::Post.new(uri.path + '?' + access_token)
    # req.set_form_data({'account_id'=>'2', 'course[name]' => 'ByPOSTCourse'})
    # res = http.request(req)
    #raise res.to_yaml
    #-----------End of Post--------
 
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to @student, :notice => "Successfully created student."
    else
      render :action => 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to @student, :notice  => "Successfully updated student."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_url, :notice => "Successfully destroyed student."
  end
end
