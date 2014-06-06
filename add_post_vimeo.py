import sys
import urllib2
import urllib
import json

idVideo = sys.argv[1]

url = 'http://vimeo.com/api/v2/video/{0}.json'.format(idVideo)
response = urllib2.urlopen(url)
json_object = json.loads(response.read())

title = json_object[0]['title']
videoUrl = "//player.vimeo.com/video/{0}?title=0&byline=0&portrait=0".format(idVideo)
thumbUrl = json_object[0]['thumbnail_large']
description = json_object[0]['description'] 
postUrl = '2014-06-04-' + urllib.quote_plus(title).replace('+','-')  

filePath = "_posts/{0}.markdown".format(postUrl)
output = open(filePath, 'w')

output.write('--- \n')
output.write('layout: post\n')
output.write('title: "' + title + '"\n')
output.write('videoUrl: "' + videoUrl + '"\n')
output.write('thumbUrl: "' + thumbUrl + '"\n')
output.write('categories: jekyll update\n')
output.write('description: "' + description + '"\n') 
output.write('---')


