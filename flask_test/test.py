# -*- coding: utf8 -*-

import urllib.request
import urllib.parse

text = '<?xml version="1.0" encoding="UTF-8"?>\r\n<service><kncrListData><item><kncrNm>%EB%85%BC%EB%B2%BC</kncrNm><kncrCode>FC010101</kncrCode></item><item><kncrNm>%EA%B0%90%EC%9E%90</kncrNm><kncrCode>FC050501</kncrCode></item><item><kncrNm>%EC%82%AC%EA%B3%BC</kncrNm>'
# text= '%EB%85%BC%EB%B2%BC'
kor = '한글'
unicodekor =urllib.parse.quote_plus('한글')
print(urllib.parse.unquote_plus(text))
# print(unicodekor.encode('utf-8'))
# print(text.encode('UTF-8'
# print(text.encode('utf8').decode('utf-8'))

# print(text.encode('utf8'))
# print(type(text))