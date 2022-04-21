const getMoviesMock = '''
{
    "average_rating": 6.96797,
    "backdrop_path": "/bYimqNnizPUCnL5HOdoCW02IGmH.jpg",
    "comments": {
        "movie:44826": null,
        "movie:50014": null,
        "movie:57212": null,
        "movie:59436": null,
        "movie:60308": null,
        "movie:64685": null,
        "movie:65057": null,
        "movie:74643": "🏆 Winner!",
        "movie:8967": null
    },
    "created_by": {
        "gravatar_hash": "c9e9fc152ee756a900db85757c29815d",
        "id": "4bc8892a017a3c0f92000002",
        "name": "Travis Bell",
        "username": "travisbell"
    },
    "description": "A list of the films that were nominated at the 2012 Oscars for best picture.",
    "id": 2,
    "iso_3166_1": "US",
    "iso_639_1": "en",
    "name": "2012 Oscar Nominations for Best Picture - 84th Academy Awards",
    "object_ids": {
        "movie:44826": "4c8521205e73d664d3000168",
        "movie:50014": "4ce5ce145e73d60f6e0008a7",
        "movie:57212": "4d610bfc5e73d60c5a002f77",
        "movie:59436": "4d83ccf85e73d653a10001d4",
        "movie:60308": "4d90ec565e73d67c4400102a",
        "movie:64685": "4dd7b1bc5e73d65a03001574",
        "movie:65057": "4ddc4f1f5e73d65a030046c6",
        "movie:74643": "4e75adc37b9aa13f880002b3",
        "movie:8967": "4bc8a705017a3c122d0425a0"
    },
    "page": 1,
    "poster_path": "/zRqBleU93WncYnIwt8LAanQerZ7.jpg",
    "public": true,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/bYimqNnizPUCnL5HOdoCW02IGmH.jpg",
            "genre_ids": [
                18,
                35,
                10749
            ],
            "id": 74643,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "The Artist",
            "overview": "Hollywood, 1927: As silent movie star George Valentin wonders if the arrival of talking pictures will cause him to fade into oblivion, he sparks with Peppy Miller, a young dancer set for a big break.",
            "popularity": 15.108,
            "poster_path": "/khtVL4abxYczXAWbo1wAz13CLx3.jpg",
            "release_date": "2011-10-12",
            "title": "The Artist",
            "video": false,
            "vote_average": 7.4,
            "vote_count": 2678
        },
        {
            "adult": false,
            "backdrop_path": "/afC5IhoNZb8MqDHuiWOAcLjqi6b.jpg",
            "genre_ids": [
                35,
                18
            ],
            "id": 65057,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "The Descendants",
            "overview": "With his wife Elizabeth on life support after a boating accident, Hawaiian land baron Matt King takes his daughters on a trip from Oahu to Kauai to confront a young real estate broker, who was having an affair with Elizabeth before her misfortune.",
            "popularity": 30.91,
            "poster_path": "/mCpYsKQNOtaBYJWCRYYuFmLsB6X.jpg",
            "release_date": "2011-09-09",
            "title": "The Descendants",
            "video": false,
            "vote_average": 6.8,
            "vote_count": 2266
        },
        {
            "adult": false,
            "backdrop_path": "/hTc55dlCPMP4oqrUU66GjKjSblp.jpg",
            "genre_ids": [
                18
            ],
            "id": 64685,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "Extremely Loud & Incredibly Close",
            "overview": "A year after his father's death, Oskar, a troubled young boy, discovers a mysterious key he believes was left for him by his father and embarks on a scavenger hunt to find the matching lock.",
            "popularity": 15.336,
            "poster_path": "/6pszViNvKr1r31pP7gJNYDHEx5P.jpg",
            "release_date": "2011-12-25",
            "title": "Extremely Loud & Incredibly Close",
            "video": false,
            "vote_average": 7,
            "vote_count": 1727
        },
        {
            "adult": false,
            "backdrop_path": "/wyvUmyzqGOBDyqLHRSukGDjI7bH.jpg",
            "genre_ids": [
                18
            ],
            "id": 50014,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "The Help",
            "overview": "Aibileen Clark is a middle-aged African-American maid who has spent her life raising white children and has recently lost her only son; Minny Jackson is an African-American maid who has often offended her employers despite her family's struggles with money and her desperate need for jobs; and Eugenia Skeeter Phelan is a young white woman who has recently moved back home after graduating college to find out her childhood maid has mysteriously disappeared. These three stories intertwine to explain how life in Jackson, Mississippi revolves around the help; yet they are always kept at a certain distance because of racial lines.",
            "popularity": 149.537,
            "poster_path": "/7XLSwxpfpPoJyTdJVot6a42TS2V.jpg",
            "release_date": "2011-08-09",
            "title": "The Help",
            "video": false,
            "vote_average": 8.2,
            "vote_count": 6243
        },
        {
            "adult": false,
            "backdrop_path": "/jlh5bNiSPcbQ79Nt31kE2GxIR3h.jpg",
            "genre_ids": [
                12,
                18,
                10751
            ],
            "id": 44826,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "Hugo",
            "overview": "Orphaned and alone except for an uncle, Hugo Cabret lives in the walls of a train station in 1930s Paris. Hugo's job is to oil and maintain the station's clocks, but to him, his more important task is to protect a broken automaton and notebook left to him by his late father. Accompanied by the goddaughter of an embittered toy merchant, Hugo embarks on a quest to solve the mystery of the automaton and find a place he can call home.",
            "popularity": 29.522,
            "poster_path": "/vDAhBTIHvIoNOlgCfmLirVgUK2p.jpg",
            "release_date": "2011-11-22",
            "title": "Hugo",
            "video": false,
            "vote_average": 7.2,
            "vote_count": 6099
        },
        {
            "adult": false,
            "backdrop_path": "/b5bcKhvN6VP82U5ztNdPfOLiolD.jpg",
            "genre_ids": [
                14,
                35,
                10749
            ],
            "id": 59436,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "Midnight in Paris",
            "overview": "A romantic comedy about a family traveling to the French capital for business. The party includes a young engaged couple forced to confront the illusion that a life different from their own is better.",
            "popularity": 19.417,
            "poster_path": "/4wBG5kbfagTQclETblPRRGihk0I.jpg",
            "release_date": "2011-05-11",
            "title": "Midnight in Paris",
            "video": false,
            "vote_average": 7.5,
            "vote_count": 6190
        },
        {
            "adult": false,
            "backdrop_path": "/molRDQpn4BgEViBDwq3poCndVvg.jpg",
            "genre_ids": [
                18
            ],
            "id": 60308,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "Moneyball",
            "overview": "The story of Oakland Athletics general manager Billy Beane's successful attempt to put together a baseball team on a budget, by employing computer-generated analysis to draft his players.",
            "popularity": 19.645,
            "poster_path": "/4yIQq1e6iOcaZ5rLDG3lZBP3j7a.jpg",
            "release_date": "2011-09-22",
            "title": "Moneyball",
            "video": false,
            "vote_average": 7.2,
            "vote_count": 3963
        },
        {
            "adult": false,
            "backdrop_path": "/tM4lA66Bt2jDI2kRmwZISh1GK1e.jpg",
            "genre_ids": [
                18,
                14
            ],
            "id": 8967,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "The Tree of Life",
            "overview": "The impressionistic story of a Texas family in the 1950s. The film follows the life journey of the eldest son, Jack, through the innocence of childhood to his disillusioned adult years as he tries to reconcile a complicated relationship with his father. Jack finds himself a lost soul in the modern world, seeking answers to the origins and meaning of life while questioning the existence of faith.",
            "popularity": 16.33,
            "poster_path": "/l8cwuB5WJSoj4uMAsnzuHBOMaSJ.jpg",
            "release_date": "2011-05-17",
            "title": "The Tree of Life",
            "video": false,
            "vote_average": 6.7,
            "vote_count": 2559
        },
        {
            "adult": false,
            "backdrop_path": "/64YOcrslrijllDRCpQvXkSKvXQV.jpg",
            "genre_ids": [
                10752,
                18,
                28
            ],
            "id": 57212,
            "media_type": "movie",
            "original_language": "en",
            "original_title": "War Horse",
            "overview": "Follows a young man named Albert and his horse, Joey, and how their bond is broken when Joey is sold to the cavalry and sent to the trenches of World War One. Despite being too young to enlist, Albert heads to France to save his friend.",
            "popularity": 27.294,
            "poster_path": "/7KHz6JlJhrFAPesmUkgdnLrSr8Y.jpg",
            "release_date": "2011-12-25",
            "title": "War Horse",
            "video": false,
            "vote_average": 7.3,
            "vote_count": 2832
        }
    ],
    "revenue": 1169550746,
    "runtime": 1128,
    "sort_by": "original_order.asc",
    "total_pages": 1,
    "total_results": 9
}''';
