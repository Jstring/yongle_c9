require 'uri'  
require 'open-uri'

require 'nokogiri'
require 'open-uri'

class YongleController < ApplicationController
  def index
    # encoding: utf-8
     @address = "https://www.google.co.kr/#q="
     @query = params[:query]
     
     @path = "https://www.google.co.kr"
  end
  
  def result
    if params[:query].nil?
      params[:query] = ""
      
    end
    @utf_url = CGI::escape("연세대학교 "+params[:query])
    #@utf_url = CGI::escape(params[:query])

    @crawlerUrl_google = "https://www.google.co.kr/#q=#{@utf_url}"
    @crawlerUrl_naver = "https://search.naver.com/search.naver?where=nexearch&query=#{@utf_url}&sm=top_hty&fbm=1&ie=utf8"
    @crawlerUrl_daum = "http://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&q=#{@utf_url}"

    #redirect_to "https://www.google.co.kr/#q=#{@url}"
  end
  
  def crawler
    @titles = Array.new
   
    doc = Nokogiri::HTML(open("http://www.yonsei.ac.kr/sc/support/notice.jsp"))
    doc.at_css(".board_list a").each do |x|
      @titles << x
    end

  end
  
  def selenium 
    
      
      driver = Selenium::WebDriver.for :firefox
      driver.navigate.to "http://google.com"
      
      element = driver.find_element(:name, 'q')
      element.send_keys "Hello WebDriver!"
      element.submit
      
      puts driver.title
      
      driver.quit
  
  end
  
  
  
  def cre8s


    

      @iframe = Array.new

     

      i_doc = Nokogiri::HTML(open("http://adv.imadrep.co.kr/750_01.html"))
      i_doc.css('a').each do |p|
        @iframe.push(p.text)
      end

      @iframe2 = Array.new

       i_doc2 = Nokogiri::HTML(open("http://ad.adinc.kr/cgi-bin/PelicanC.dll?impr?pageid=02Xv&out=iframe"))
      i_doc2.css('a').each do |p|
        @iframe2.push(p.text)
      end
     
     

      cr_address = "http://www.tvreport.co.kr/?c=news&m=newsview&idx=499848"


      @img = Array.new
      @img_selected = Array.new
      
      doc = Nokogiri::HTML(open(cr_address))
      
      doc.css('img/@src').each do |p|
        @img.push(p) 
      end
      
      @img.each do |p|
        if p.text.include? "jpg"
          @img_selected.push(p)
        end
      
      end    
        
      
      


      @head = doc.css('.view_cont//.title//h2').text
      
      @article = doc.css('#CmAdContent').text


    
  end
  
  
  
  
  
  def test



      ad_yonhap = "http://www.yonhapnews.co.kr/international/2016/11/09/0619000000AKR20161109109251009.HTML?template=2085"
      ad_segye = "http://www.segye.com/content/html/2016/11/09/20161109003724.html"
      ad_newsis = "http://www.newsis.com/ar_detail/view.html?ar_id=NISX20161109_0014506702&cID=10101&pID=10100"
      ad_ytn = "http://www.ytn.co.kr/_ln/0104_201611100009472056"
      ad_khan = "http://news.khan.co.kr/kh_news/khan_art_view.html?artid=201611092252015&code=970201"
      ad_hani = "http://www.hani.co.kr/arti/international/america/769615.html?_fr=mt1"
      ad_sedaily = "http://www.sedaily.com/NewsView/1L3WKOOTFB"
      ad_donga = "http://news.ichannela.com/inter/3/02/20161109/81253942/1"
      ad_jtbc = "http://news.jtbc.joins.com/html/587/NB11352587.html?cloc=jtbc|news|index_showcase"
     

      ad_pop = "http://pop.heraldcorp.com/view.php?ud=201611100756316694117_1"
      ad_xspo ="http://www.xportsnews.com/jsports/?ac=article_view&entry_id=788507&_REFERER=http%3A%2F%2Fwww.xportsnews.com%2F"
      ad_osen ="http://osen.mt.co.kr/article/G1110532866"
      ad_tvreport = "http://www.tvreport.co.kr/?c=news&m=newsview&idx=498070"
      ad_spodonga ="http://sports.donga.com/home/3/all/20161110/81266475/2"
      ad_new1 ="http://news1.kr/articles/?2827779"
      ad_mydaily ="http://www.mydaily.co.kr/new_yk/html/read.php?newsid=201611131613781116"
      ad_star = "http://star.mt.co.kr/stview.php?no=2016111014430937849"
      ad_seoul = "http://www.sportsseoul.com/news/read/455543"
      ad_joins ="http://isplus.joins.com/"

      @address_list_norm = [ad_yonhap,ad_segye,ad_newsis,ad_ytn,ad_khan,ad_hani,ad_sedaily,ad_donga,ad_jtbc]
      @address_list_ent = [ad_pop,ad_xspo,ad_osen,ad_tvreport,ad_spodonga,ad_new1,ad_mydaily,ad_star,ad_seoul,ad_joins]
    
    
    @crawler_list  = []
    for i in @address_list_ent
      doc = Nokogiri::HTML(open(i))
      
      
      @crawler_list.push(doc)
    end
    
    
    


  
    
  end













  def pop

      ad_yonhap = "http://www.yonhapnews.co.kr/international/2016/11/09/0619000000AKR20161109109251009.HTML?template=2085"
      ad_segye = "http://www.segye.com/content/html/2016/11/09/20161109003724.html"
      ad_ytn = "http://www.ytn.co.kr/_ln/0104_201611100009472056"
      ad_newsis = "http://www.newsis.com/ar_detail/view.html?ar_id=NISX20161109_0014506702&cID=10101&pID=10100"
      ad_hani = "http://www.hani.co.kr/arti/international/america/769615.html?_fr=mt1"
      ad_khan = "http://news.khan.co.kr/kh_news/khan_art_view.html?artid=201611092252015&code=970201"
      ad_jtbc = "http://news.jtbc.joins.com/html/587/NB11352587.html?cloc=jtbc|news|index_showcase"
      ad_donga = "http://news.ichannela.com/inter/3/02/20161109/81253942/1"
      ad_sedaily = "http://www.sedaily.com/NewsView/1L3WKOOTFB"
      ad_mbc = "http://imnews.imbc.com/replay/2016/nwdesk/article/4162316_19842.html?XAREA=pcmain_headline"

      ad_pop = "http://pop.heraldcorp.com/view.php?ud=201611100756316694117_1"
      ad_xspo ="http://www.xportsnews.com/jsports/?ac=article_view&entry_id=788507&_REFERER=http%3A%2F%2Fwww.xportsnews.com%2F"
      ad_osen ="http://osen.mt.co.kr/article/G1110532866"
      ad_tvreport = "http://www.tvreport.co.kr/?c=news&m=newsview&idx=498070"
      ad_spodonga ="http://sports.donga.com/home/3/all/20161110/81266475/2"
      ad_new1 ="http://news1.kr/articles/?2827779"
      ad_star = "http://star.mt.co.kr/stview.php?no=2016111014430937849"
      ad_seoul = "http://www.sportsseoul.com/news/read/455543"
      ad_joins ="http://isplus.joins.com/"

    doc = Nokogiri::HTML(open(ad_mbc))
    
    @img_list = Array.new
    @text_list = Array.new
    
    doc.css('a//img').each do |p|
	     @img_list.push(p) 

    end  

  end
  

  def workshopd
  end
  
end