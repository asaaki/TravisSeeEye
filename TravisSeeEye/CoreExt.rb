module CoreExt
  def load_image(name, type = :png)
    resource = NSBundle.mainBundle.pathForResource(name, ofType: "#{type}")
    NSImage.alloc.initWithContentsOfFile(resource)
  end
  
  def load_build_image(repo)
    NSImage.alloc.initByReferencingURL(NSURL.URLWithString("http://travis-ci.org/#{repo}.png"))
  end
  
  def start_timer(interval, selector)
    NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "#{selector}:", userInfo: nil, repeats: true)
  end
end

puts "mixing in core extensions"
Object.send :include, CoreExt