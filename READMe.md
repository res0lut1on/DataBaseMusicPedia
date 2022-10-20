# Михайловский Андрей 053505

> Тема проекта — MusicPedia, поиск и добавление информации об исполнителях 

# Функциональные требования

>  Задача:

Система, позволяющая авторам, прошедшим валидацию загружать информацию о музыкантах и всё с чем они взаимодействуют, пользователи ставят оценки исполнителям и их шедеврам, пишут рецензии как исполнителям так и их творчеству, что продвигает их в рейтинге.
Также пользователи могут дополнять информацию об исполнителях, которую после проверки модератора добавляют в базу.

>  Роли: 

1.	Модератор:
	- Подтверждение авторов
	- Удаление авторов
	- Просмотор логов
	- Просмотор статей и новостных публикаций
	- Обработка жалоб
	- Удаление статей и новостных публикаций
	- Модерация рецензий и статей.
  
2.	Автор: 
  - Создание статей и новостных публикаций
  -	Создание новых жанров, и других элементов, относящихся к характеристике сущности исполнителя
  -	Редактирование статей как своих, так и чужих
  -	Одобрять вносимые изменения в свою статью
  -	Банить отзывы нарушающие правила «корректности» отзыва
  
3.	Пользователь:
 -	Аутентификация
 -	Создание, просмотр профиля,
 -	Выставлять оценки
 -	Писать рецензии
 -	Просматривать исполнителей и новости
 
4.	Незарегистрированный пользователь 
 -	Просмотр статей и новостей
 -	Регистрация 

# Сущности

1.	MusicMan
-	Name (наименование)
-	Genre (жанр)
-	Description (описание)
-	Date of Birth (дата рождения)
-	Place of Birth (место рождения)
-	Years active (годы активности)
-	Instrument/s (инструменты)
-	Labels (звукозаписывающая компания)
-	Member of (состоит в)
-	Related groups (группы с которыми связан)
-	Albums (альбомы)
-	Views (отзывы)
-	Mark (оценка)
2.	Band
-	Name 
-	Description
-	Genres
-	Albums
-	Origin (место основания)
-	Years active
-	Labels 
-	Members (настоящие члены)
-	Website (сайт)
-	Views
-	Mark
3.	Genres
-	Name 
-	Description
-	Stylistic origins (стилистическое происхождение)
-	Origins (происхождение)
-	Derivative forms (производные формы)
-	Subgenres (поджанры)
4.	Instrument
-	Name (nvarchar(20))
-	Description
-	Classification (классификация)
-	Developed (создан)
-	Derivative forms (производные формы)
5.	Album 
-	Name 
-	Description
-	Released (выпущен)
-	Studio (студия)
-	Genres
-	List of comps (список песен)
-	Length (длина альбома)
-	Label
-	Producer (продюсер)
-	Mark 
-	Reviews
6.	Song 
-	Name 
-	Description
-	Length
-	Genres
-	Author
-	Mark
-	Reviews
-	Album (альбом)
7.	Mark
-	Value (Значение)
8.	Publication
-	Title (Заголовок)
-	Description (Текст)
-	Comments
-	Mark (средняя оценка публикации)
9.	Review
-	Title (Заголовок)
-	Text (Текст)
-	Mark_value (Оценка отзыва)
10.     Log Review
-	Review
-	DateReview
11.	Log UpdatePublication
-	Author
-	Date
-	Publication


Сущности
1.	MusicMan 	
o	MusicianID (int, pk), NOT NULL
o	NameID (int, foreign_key -> Fml, one to one), NOT NULL
o	GenreID (int, foreign_key) //
o	Description (nvarchar(4000))
o	DateOfBirth (date)
o	PlaceOfBirth (nvarchar(100))
o	YearsActive (date) 
o	InstrumentID (инструменты) //
o	Labels (звукозаписывающая компания) //
o	MemberOf (состоит в) // 
o	RelatedGroups (группы с которыми связан) // 
o	Albums (альбомы) //
o	Views (отзывы) //
o	AvgMark (int) 
2.	FML 
o	FmlID (int, pk), NOT NULL
o	LastName (nvarchar(40)), NOT NULL
o	Name (nvarchar(20)), NOT NULL
o	MiddleName (nvarchar(20))
o	MusicianID (int, foreign_key ->, one to one), NOT NULL

3.	Band
o	BandID (int), NOT NULL
o	Name (nvarchar(30)), NOT NULL
o	Description (nvarchar(4000))
o	Genres // 
o	Albums //
o	Origin ((nvarchar(100)))
o	YearsActive(date)
o	Labels //
o	Members //
o	Website (nvarchar(100))
o	Views(int, foreign_key)
o	Mark (int)
4.	Genres
o	GenresID (int, pk), NOT NULL
o	Name (nvarchar(30)), NOT NULL
o	Description (nvarchar(4000))
o	Stylistic origins (стилистическое происхождение)//
o	Origins (происхождение) //
o	Derivative forms (производные формы) //
o	Subgenres (поджанры) //
5.	Instrument
o	InstrumentID (int, pk), NOT NULL
o	Name (nvarchar(20)), NOT NULL
o	Description (nvarchar(4000))
o	Classification (классификация) // 
o	Developed (date) 
o	Derivative forms (производные формы) // 
6.	Album 
o	AlbumID (int, pk), NOT NULL
o	Name (nvarchar(30)), NOT NULL
o	Description (nvarchar(4000))
o	Released (date)
o	StudioID (int,  foreign_key)
o	Genres //
o	List of comps (список песен)//
o	Length (time)
o	LabelID (int, foreign_key)
o	Producer (продюсер) // 
o	Mark (int)
o	Reviews // 
7.	Song 
o	SongID (int, pk), NOT NULL
o	Name (nvarchar(30)), NOT NULL
o	Description (nvarchar(4000))
o	Length (int)
o	Genres //
o	Author //
o	Mark (int)
o	Reviews //
o	AlbumID (int, foreign_key)
8.	Mark
o	Value (int), NOT NULL
o	UserID (int, foreign_key), NOT NULL
o	PublicationID (int, foreign_key)
o	BadnID (int, foreign_key)
o	Musician (int, foreign_key)
9.	Publication
o	PublicationID(int, pk), NOT NULL
o	Title (nvarchar(30)), NOT NULL
o	Description (nvarchar(4000))
o	Comments // 
o	Mark (int)
10.	Review
o	ReviewID (int, pk), NOT NULL
o	Title (nvarchar(30)), NOT NULL
o	Text (nvarchar(4000))
o	UserID (int, foreign_key), NOT NULL
o	PublicationID (int, foreign_key)
o	BadnID (int, foreign_key)
o	Musician (int, foreign_key)
o	Mark_value (int)
11.	 Labels
o	LabelsID (int, pk), NOT NULL
o	Name (nvarchar(30)), NOT NULL
o	Description (nvarchar(2000))
12.	 Studio
o	StudioID (int, pk), NOT NULL
o	Name (nvarchar(30)), NOT NULL
o	Description (nvarchar(2000))
13.	Log Review
o	ReviewID (int, foreign_key), NOT NULL
o	UserID (int, foreign_key), NOT NULL
o	DateReview (datetime), NOT NULL
14.	 Log UpdatePublication
o	LogUpdateID (int, pk), NOT NULL
o	FmlID (int, foreign_key), NOT NULL
o	Date (datetime), NOT NULL
o	PublicationID (int, foreign_key), NOT NULL
15.	UserRole
o	UserID (int, pk), NOT NULL
o	UserDataID (int, foreign_key), NOT NULL
o	Date (datetime), NOT NULL
o	RoleID (int, foreign_key), NOT NULL
16.	Role
o	RoleID (int, pk), NOT NULL
o	Name (nvarchar(10)), NOT NULL
17.	UserData
o	UserDataID (int, pk), NOT NULL
o	NickName (nvarchar(30), NOT NULL
o	Date (datetime), NOT NULL
o	Description (nvarchar(50))

