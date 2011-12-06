# Encoding: UTF-8

require 'rubygems'
require 'sinatra'
require 'haml'
require File.expand_path("../helpers/a", __FILE__)

class NettsundereWeb < Sinatra::Application
  include Helpers::A
  
  attr_reader :page

  get '/' do
    @description = "nettsundere (aka Vladimir Kiselev) кратко"
    @keywords = "nettsundere, homepage, web, vladimir kiselev"
    @title = "кратко"
    
    @page = :main
    haml :index
  end

  get "/резюме" do
    @description = "nettsundere (aka Vladimir Kiselev) резюме"
    @keywords = "nettsundere, cv, резюме, rue-m, web, vladimir kiselev"
    @title = "резюме"
  
    @page = :cv
    haml :index
  end

  get "/работы" do
    @description = "nettsundere (aka Vladimir Kiselev) работы"
    @keywords = "nettsundere, работы, rue-m, works, web, vladimir kiselev"
    @title = "работы"
  
    @page = :works
    haml :index
  end

  get "/контакты" do
    @description = "nettsundere (aka Vladimir Kiselev) контакты"
    @keywords = "nettsundere, cv, rue-m, web, vladimir kiselev"
    @title = "контакты"
  
    @page = :contacts
    haml :index
  end
end
