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
# Ненормализованная 
![Image alt](https://github.com/res0lut1on/DataBaseMusicPedia/blob/main/Diagram.png)

Сущности
1.	MusicMan 	
-	MusicianID (int, pk), NOT NULL
-	NameID (int, foreign_key -> Fml, one to one), NOT NULL
-	GenreID (int, foreign_key) //
-	Description (nvarchar(4000))
-	DateOfBirth (date)
-	PlaceOfBirth (nvarchar(100))
-	YearsActive (date) 
-	InstrumentID (инструменты) //
-	Labels (звукозаписывающая компания) //
-	MemberOf (состоит в) // 
-	RelatedGroups (группы с которыми связан) // 
-	Albums (альбомы) //
-	Views (отзывы) //

2.	FML 
-	FmlID (int, pk), NOT NULL
-	LastName (nvarchar(40)), NOT NULL
-	Name (nvarchar(20)), NOT NULL
-	MiddleName (nvarchar(20))
-	MusicianID (int, foreign_key ->, one to one), NOT NULL

3.	Band
-	BandID (int), NOT NULL
-	Name (nvarchar(30)), NOT NULL
-	Description (nvarchar(4000))
-	Genres // 
-	Albums //
-	Origin ((nvarchar(100)))
-	YearsActive(date)
-	Labels //
-	Members //
-	Website (nvarchar(100))
-	Views(int, foreign_key)

4.	Genres
-	GenresID (int, pk), NOT NULL
-	Name (nvarchar(30)), NOT NULL
-	Description (nvarchar(4000))

5.	Instrument
-	InstrumentID (int, pk), NOT NULL
-	Name (nvarchar(20)), NOT NULL
-	Description (nvarchar(4000))
-	Classification (классификация) // 
-	Developed (date) 

6.	Album 
-	AlbumID (int, pk), NOT NULL
-	Name (nvarchar(30)), NOT NULL
-	Description (nvarchar(4000))
-	Released (date)
-	StudioID (int,  foreign_key)
-	Genres //
-	List of comps (список песен)//
-	Length (time)
-	LabelID (int, foreign_key)
-	Producer (продюсер) // 

7.	Song 
-	SongID (int, pk), NOT NULL
-	Name (nvarchar(30)), NOT NULL
-	Description (nvarchar(4000))
-	Length (int)
-	Genres //
-	Author //
-	AlbumID (int, foreign_key)

8.	Mark
-	Value (int), NOT NULL
-	UserID (int, foreign_key), NOT NULL
-	PublicationID (int, foreign_key)
-	BadnID (int, foreign_key)
-	Musician (int, foreign_key)

9.	Publication
-	PublicationID(int, pk), NOT NULL
-	Title (nvarchar(30)), NOT NULL
-	Description (nvarchar(4000))
-	Comments // 
-	Mark (int)

10.	Review
-	ReviewID (int, pk), NOT NULL
-	Title (nvarchar(30)), NOT NULL
-	Text (nvarchar(4000))
-	UserID (int, foreign_key), NOT NULL
-	PublicationID (int, foreign_key)
-	BadnID (int, foreign_key)
-	Musician (int, foreign_key)

11.	 Labels
-	LabelsID (int, pk), NOT NULL
-	Name (nvarchar(30)), NOT NULL
-	Description (nvarchar(2000))

12.	 Studio
-	StudioID (int, pk), NOT NULL
-	Name (nvarchar(30)), NOT NULL
-	Description (nvarchar(2000))

13.	Log Review
-	ReviewID (int, foreign_key), NOT NULL
-	UserID (int, foreign_key), NOT NULL
-	DateReview (datetime), NOT NULL

14.	 Log UpdatePublication
-	LogUpdateID (int, pk), NOT NULL
-	FmlID (int, foreign_key), NOT NULL
-	Date (datetime), NOT NULL
-	PublicationID (int, foreign_key), NOT NULL

15.	UserRole
-	UserID (int, pk), NOT NULL
-	Date (datetime), NOT NULL
-	RoleID (int, foreign_key), NOT NULL

16.	Role
-	RoleID (int, pk), NOT NULL
-	Name (nvarchar(10)), NOT NULL

17.	UserData
-	UserDataID (int, pk), NOT NULL
-	NickName (nvarchar(30), NOT NULL
-	Date (datetime), NOT NULL
-	Description (nvarchar(50))

