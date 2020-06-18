import requests
from bs4 import BeautifulSoup

# namelist = ['가지', '감', '감귤', '감자', '감초', '갓', '개나리', '거베라', '고구마', '고추'
#             , '고추냉이', '곰취', '과꽃', '관음죽', '구기자', '국화', '군자란', '글라디올러스', '금어초', '금잔화', '은빛담쟁이덩굴', '꽃양배추', '논벼', '다알리아', '당근'
#             , '금잔화', '은빛담쟁이덩굴', '꽃양배추', '논벼', '다알리아', '당근', '대추', '더덕', '도라지', '동백나무', '동양심비', '드라세나', '디펜바키아', '딸기', '마', '마늘'
#             , '매실', '맥문동', '메리골드', '모과', '모란', '몬스테라', '무', '무궁화', '무화과', '문주란', '미나리', '밤', '배', '배추', '백일홍', '백합', '복숭아', '봉선화', '부추', '붓꽃'
#             , '블루베리', '비파', '사과', '산수유', '살구', '삽주', '상추', '샐러리', '샐비어', '생강', '선인장', '소철', '수국', '수박', '순무', '쉐프렐라', '스파티필럼', '시금치', '시써스', '식나무'
#             , '심비디움', '쑥갓', '아나시스', '아레카야자', '아마릴리스', '아스파라가스', '아스파라거스', '아욱', '아이비', '안개꽃', '앵두', '양배추', '양파', '오미자', '오이', '옥수수', '우엉', '유자'
#             , '자두', '작약', '장미', '제라늄', '종려죽', '지치', '지황', '진달래', '참다래', '참당귀(당귀)', '참외', '천궁', '천일홍', '치자나무', '카네이션', '칸나', '케일', '켄차야자', '콩', '클레로덴드럼'
#             , '토마토', '튤립', '파', '파슬리', '팔손이', '패랭이꽃', '팬지', '페튜니아', '포도', '피닉스야자', '해바라기', '협죽도', '호두나무', '호박', '황기'
#               ] 

# namelist = ['사과', '감귤', '감자', '고추', '논벼', '마늘', '배', '파', '포도']
namelist = ['사과']

# 병 검색
for i in namelist:
    url = "http://ncpms.rda.go.kr/npmsAPI/service?apiKey=2020bc251a4e18ca0830201bff4ebe390037&serviceCode=SVC01&serviceType=XML&cropName={}".format(i)
    res = requests.get(url)
    soup = BeautifulSoup(res.content, 'html.parser')
    final = []
    for item in soup.findAll("item"):
        sickcode = item.select('sicKKey')
        sickcode = sickcode[0].get_text()
        final.append(sickcode)
    for code in final:
        ans = []
        url = "http://ncpms.rda.go.kr/npmsAPI/service?apiKey=2020bc251a4e18ca0830201bff4ebe390037&serviceCode=SVC05&sickKey={}".format(code)
        res = requests.get(url)
        soup = BeautifulSoup(res.content, 'html.parser')

        symptom = soup.select('symptoms')
        symptom = symptom[0].text
        symptom = symptom.replace('<br/>', '\n')
        
        condition = soup.select('developmentCondition')
        condition = condition[0].text
        condition = condition.replace('<br/>', '\n')

        cropname = soup.select('cropName')
        cropname = cropname[0].text

        sickname = soup.select('sickNameKor')
        sickname = sickname[0].text

        prevent = soup.select('preventionMethod')
        prevent = prevent[0].text
        prevent = prevent.replace('<br/>', '')

        temp = soup.select("imageList > item")[0].text
        image = ""
        checkpoint = 0
        for im in range(len(temp)):
            if temp[im] == "h" and temp[im+1] == "t":
                for x in range(im, len(temp)):
                    image += temp[x]
                    if temp[x] == "g" and temp[x-1] == "p" and temp[x-2] == "j" and temp[x-3] == ".":
                            checkpoint = 1
                            break
                if checkpoint == 1:
                    break



# 해충 검색

for i in namelist:
    url = "http://ncpms.rda.go.kr/npmsAPI/service?apiKey=2020bc251a4e18ca0830201bff4ebe390037&serviceCode=SVC03&serviceType=XML&cropName={}".format(i)
    res = requests.get(url)
    soup = BeautifulSoup(res.content, 'html.parser')
    insectKorName = []
    for item in soup.findAll("item"):
        temp = item.select('insectKey')
        temp = temp[0].get_text()
        insectKorName.append(temp)

    for code in insectKorName:
        ans = []
        url = "http://ncpms.rda.go.kr/npmsAPI/service?apiKey=2020bc251a4e18ca0830201bff4ebe390037&serviceCode=SVC07&insectKey={}".format(code)
        res = requests.get(url)
        soup = BeautifulSoup(res.content, 'html.parser')

        print(soup)



# 뭔 해충인지(insectkey)
# url = "http://ncpms.rda.go.kr/npmsAPI/service?apiKey=2020bc251a4e18ca0830201bff4ebe390037&serviceCode=SVC07&insectKey=H00000594"













# 병원체 검색
# url = http://ncpms.rda.go.kr/npmsAPI/service?apiKey=2020bc251a4e18ca0830201bff4ebe390037&serviceCode=SVC02&cropName=%EC%82%AC%EA%B3%BC



