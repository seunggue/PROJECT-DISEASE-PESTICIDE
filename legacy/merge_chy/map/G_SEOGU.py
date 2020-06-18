import pandas as pd

# PNU코드 ===> 광주광역시 서구 주소 변환
dong = {"104": "양동", "132": "매월동", "106": "농성동", "115": "광천동", "116":"유촌동", "117":"덕흥동", "118":"쌍촌동", "119":"화정동", "120":"치평동", "121":"내방동",
        "125": "서창동", "126":"세하동", "127":"용두동", "128":"풍암동", "129":"벽진동", "130":"금호동", "131":"마륵동", "133":"동천동"}
a = pd.read_csv('seogu.csv', encoding='CP949')
for i in a.loc():
    # PNU코드
    PNU_CODE = str(i[2])
    front = ""
    back = ""
    if PNU_CODE[10] == "1":
        for j in range(4):
            if PNU_CODE[11+j] != "0":
                front += PNU_CODE[11+j]
        for j in range(4):
            if PNU_CODE[15+j] != "0":
                back += PNU_CODE[15+j]
    else:
        front += "산 "
        for j in range(4):
            if PNU_CODE[11+j] != "0":
                front += PNU_CODE[11+j]
        for j in range(4):
            if PNU_CODE[15+j] != "0":
                back += PNU_CODE[15+j]

    print(PNU_CODE)
    if back == "":
        # 토양 API쏴야되는데 
        # 질소
        print(111)
        # 나트륨
        print(222)
        print(dong[PNU_CODE[5:8]], front)
    else:
        # 질소
        print(111)
        # 나트륨
        print(222)
        print(dong[PNU_CODE[5:8]], front + "-" + back)
    print()

