import json
from datetime import datetime

json = json.loads(open("/home/bracktus/bin/anime/anilist.json").read())
mediaList = json["data"]["Page"]["mediaList"]

listOfAnime = []

def insertionSort(animeList):
        for i in range(0, len(animeList) - 2):
                min = i
                for j in range(i + 1, len(animeList) - 1):
                        if len(animeList[j]) < len(animeList[min]):
                                min = j
                if i != min:
                        temp = animeList[i]
                        animeList[i] = animeList[min]
                        animeList[min] = temp
        return animeList

def genOutput(name, episode, time):
        return f"Episode {episode} of {name} @ {time}"
        #return f"{name} EP {episode} @ {time}"

for media in mediaList:
        show = media["media"]
        if show["status"] == "RELEASING":
                time = datetime.fromtimestamp(show["nextAiringEpisode"]["airingAt"])
                niceTime = time.strftime("%a %H:%M")
                nameOfTheShow = show["title"]["english"]
                episode = show["nextAiringEpisode"]["episode"]
                output = genOutput(nameOfTheShow, episode, niceTime)
                listOfAnime.append(output)

if len(listOfAnime) != 0:
    insertionSort(listOfAnime)

    max = len(listOfAnime[-1])
    for anime in listOfAnime:
            print(anime)



