# 날씨  API 로 가져오기
import requests
import json
import datetime

zone_weather = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?"
service_key = "NpK80f5ZwAD0mk%2BZjfrgUPTG3JLqubh%2FIYXSEzEou0kvKMi8ZnNIsv9ud8YF%2Bvyz4oBURYsKS09uXwASEHdr%2FA%3D%3D"
now = datetime.datetime.today()
base_date = now.strftime('%Y%m%d')
base_time = "0200"
nowtime = int(now.strftime('%H%M'))

# 맨처음에 front에서 동기화? 자동입력? 버튼 누르면 코드 실행(현재 시간 계산하기 == > 현재시간 기상이 어떻게 되는지 체크
#                                                              최저기온, 최고기온은 0200 basetime에서 추출)

# 주소 정보 front에서 줄거임 ~면까지 줘야돼


# 면까지 주면 변환하는 코드 작성 
nx = "58"
ny = "72"


payload = "serviceKey=" + service_key + "&" +\
    "numOfRows=62" + "&" +\
    "dataType=json" + "&" +\
    "base_date=" + base_date + "&" +\
    "base_time=" + base_time + "&" +\
    "nx=" + nx + "&" +\
    "ny=" + ny
res = requests.get(zone_weather + payload)

weather = res.json().get('response').get('body').get('items')

# sky 1 == 맑음 3 == 구름많음 4 == 흐림 
for item in weather['item']:
    if item['category'] == "TMN":
        print("최저기온" + item['fcstValue'])
    elif item['category'] == "TMX":
        print("최고기온" + item['fcstValue'])
    
    # 하늘 상태
    elif item['category'] == "SKY": 
        if int(item['fcstTime']) <= nowtime < int(item['fcstTime']) + 300:
            # print(item['fcstTime'], nowtime)
            if int(item['fcstValue']) == 1:
                print("맑음")
            elif int(item['fcstValue']) == 3:
                print("구름 많음")
            elif int(item['fcstValue']) == 4:
                print("흐림")
    
    # 강수형태(PTY) 코드 : 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4)
    elif item['category'] == "PTY": 
        if int(item['fcstTime']) <= nowtime < int(item['fcstTime']) + 300:
            if int(item['fcstValue']) == 0:
                print("특이사항 없음")
            elif int(item['fcstValue']) == 1:
                print("비")
            elif int(item['fcstValue']) == 2:
                print("진눈개비")
            elif int(item['fcstValue']) == 3:
                print("눈")
            elif int(item['fcstValue']) == 4:
                print("소나기")

    # 6시간 강수량
    elif item['category'] == "R06":
        if int(item['fcstTime']) <= nowtime < int(item['fcstTime']) + 600:
            print("강수량: "  + item['fcstValue'] + "mm")
    # 6시간 적설량
    elif item['category'] == "S06":
        if int(item['fcstTime']) <= nowtime < int(item['fcstTime']) + 600:
            print("적설량: " + item['fcstValue'] + "mm")


