-- Seed data for USERS
INSERT INTO users VALUES 
(1, 'anilshrestha7@gmail.com', 'Anil', 'Shrestha', 'Anilshrestha', 'ADMIN', 'ACTIVE', '1980-01-01', '$2a$12$cok1KRG73DbEK2ok/J5MDz.eoiI80oegFBnm8mCBROwr...', '2025-05-03', 'default.png', '9812345678', 'male', 'Kathmandu'),
(2, 'amritagurung23@gmail.com', 'Amrita', 'Gurung', 'amritagurung3', 'CUSTOMER', 'ACTIVE', '2000-02-05', '$2a$12$cok1KRG73DbEK2ok/J5MDz.eoiI80oegFBnm8mCBROwr...', '2025-05-03', 'uploads/pp1.jfif', '9824280681', 'female', 'Kathmandu'),
(3, 'ritakumari123@gmail.com', 'Rita', 'Gurung', 'ritakumari2', 'CUSTOMER', 'ACTIVE', '1999-12-03', '$2a$12$cok1KRG73DbEK2ok/J5MDz.eoiI80oegFBnm8mCBROwr...', '2025-05-04', 'uploads/pp3.jfif', '9813170551', 'female', 'pokhara'),
(4, 'priyatamang456@gmail.com', 'Priya', 'Tamang', 'priyatmg01', 'CUSTOMER', 'ACTIVE', '2005-02-02', '$2a$12$lsic8fdMyM51EYxy88x/.Ex4zLR0Tj9XmpIBdGGYXOz...', '2025-05-04', 'uploads/pp3.jfif', '9803052198', 'female', 'Pokhara'),


-- Seed data for GENRE
INSERT INTO genre VALUES
(1, 'Fiction', 'Fiction'),
(2, 'Novel', 'Fiction'),
(3, 'Children', 'Fiction'),
(4, 'Thriller', 'Fiction'),
(5, 'Biography', 'Non-Fiction'),
(6, 'Education', 'Non-Fiction');

-- Other seed data will be added in follow-up code blocks due to size limits.
-- BOOKS
INSERT INTO `books`(`bookId`, `title`, `author`, `language`, `publishedYear`, `isbn`, `bookQuantity`, `bookImage`, `edition`, `genreId`, `description`, `price`) VALUES 
(1,'The Scum Villain\'s Self-Saving System: Ren Zha Fanpai Zijiu Xitong','Mo Xiang Tong Xiu','English',2021,'9781638589332',10,'asset/images/books/The Scum Villain\'s Self-Saving System.jpg','1st',1,'Half-demon Luo Binghe rose from humble beginnings and a tortured past ... a true scum villain!',399),

(2,'The Perks of Being A Wallflower','Stephen Chbosky','English',1999,'9781451696196',8,'asset/images/books/The Perks of Being A Wallflower.jpg','1st',1,'This haunting novel about the dilemma of passivity vs. passion marks the stunning debut of a provocative new voice...',299),

(3,'We are All Perfectly Imperfect','Muniba Mazari','English',2020,'789697020159',7,'asset/images/books/We are All Perfectly Imperfect.jpg','1st',5,'Mazari emphasizes the importance of gratitude and self-acceptance... our hardships can be transformative.',500),

(4,'A Flower in the Midst of Thorns: Autobiographical Essays','Jhamak Ghimire','Nepali',2015,'9789937895821',5,'asset/images/books/A Flower in the Midst of Thorns.jpg','1st',5,'Book by Ghimire, Jhamak',560),

(5,'Twilight','Stephenie Meyer','English',2005,'9780316015844',12,'asset/images/books/Twilight.png','1st',1,'About three things I was absolutely positive. First, Edward was a vampire... Twilight is a love story with bite.',550),

(6,'Catherine the Princess of Wales: The Biography','Robert Jobson','English',2023,'9781915347006',5,'asset/images/books/Catherine the Princess of Wales.jpg','1st',5,'Through the author’s extensive connections within the royal household, this dynamic new biography tells the full story...',965),

(7,'The Psychology of Money','Morgan Housel','English',2020,'9789390166268',15,'asset/images/books/The Psychology of Money.jpg','1st',6,'Doing well with money isn\'t necessarily about what you know. It\'s about how you behave...',499),

(8,'Harry Potter and the Deathly Hallows','J.K. Rowling','English',2007,'9780545010221',20,'asset/images/books/Harry Potter and the Deathly Hallows.jpg','1st',4,'It\'s no longer safe for Harry at Hogwarts... The satisfying conclusion offers shocking last-minute twists...',350),

(9,'Green Thumb Poppy','Harish L','English',2023,'9781636408932',9,'asset/images/books/Green Thumb Poppy.jpg','1st',3,'\'Green Thumb Poppy\' is a heartwarming tale of a young girl named Poppy who possesses an extraordinary gift for gardening...',499),

(10,'A Tempest at Sea','Sherry Thomas','English',2023,'9780593200818',4,'asset/images/books/A Tempest at Sea.jpg','1st',1,'Charlotte Holmes’s brilliant mind and deductive skills are pulled into a dangerous investigation at sea...',800),

(11,'Salem\'s Lot','Stephen King','English',1975,'9780307743671',7,'asset/images/books/Salem\'s Lot.jpg','1st',4,'Thousands of miles away from the small township of \'Salem\'s Lot, two terrified people, a man and a boy...',400),

(12,'To Kill a Mocking bird','Harper Lee','English',1960,'9780061120084',10,'asset/images/novel/To Kill a Mocking bird.jpg','1st',2,'\'Shoot all the bluejays you want, if you can hit \'em, but remember it\'s a sin to kill a mockingbird... Pulitzer Prize in 1961.',750),

(13,'Mountains Painted With Turmeric','Lil Bahadur Chettri','English',1957,'9789937922613',12,'asset/images/books/Mountains Painted With Turmeric.jpg','1st',2,'Since its publication in the late 1950s... excluded.',320),

(14,'One Hot Penguin','Jamie Rix','English',2002,'9781841218212',5,'asset/images/children/One Hot Penguin.jpg','1st',3,'All over town, it\'s boiling hot... a colder climate...',200),

(15,'Democracy and Education','John Dewey','English',1916,'9780684836317',15,'asset/images/education/Democracy and Education.jpg','1st',6,'In this book, written in 1916... have had to teach in them.',850),

(16,'The Smartest Kids in the World: And How They Got That Way','Amanda Ripley','English',2013,'9781451654424',10,'asset/images/education/The Smartest Kids in the World.jpg','1st',6,'Through the compelling stories of three... keep you turning the pages.',400),

(17,'Make It Stick: The Science of Successful Learning','Peter C. Brown, Henry L. Roediger III, Mark A. McDaniel','English',2014,'9780674729018',10,'asset/images/education/Make It Stick.jpg','1st',6,'To most of us, learning something “the hard way”... lifelong learning and self-improvement.',700),

(18,'Crime and Punishment','Fyodor Dostoevsky','English',1866,'9780140449136',13,'asset/images/novel/Crime and Punishment.jpg','1st',2,'Raskolnikov, a destitute and desperate former student... the noose of his own guilt tightening.',1000),

(19,'The Cat in the Hat','Dr. Seuss','English',1957,'9780394800011',10,'asset/images/children/The Cat in the Hat.jpg','1st',3,'Have a ball with Dr. Seuss and the Cat in the Hat... lucky parents too!',430),

(20,'Then She was Gone','Lisa Jewell','English',2017,'9781780896410',11,'asset/images/thriller/Then She was Gone.jpg','1st',4,'She was fifteen, her mother\'s golden girl... Who still has secrets to hide?',850),

(21,'Steve Jobs','Walter Isaacson','English',2011,'9781451648539',8,'asset/images/biography/Steve Jobs.jpg','1st',5,'Walter Isaacson\'s worldwide bestselling biography... leadership, and values.',1050),

(22,'Jiwan Kada Ki Phool: Jhamak Ghimire','Jhamak Ghimire','Nepali',2010,'9789937802342',6,'asset/images/biography/Jiwan Kada Ki Phool.jpg','1st',5,'Jhamak Ghimire is a Nepali writer... Jiwan Kada Ki Phool.',350),

(23,'Raising Mentally Strong Kids','Daniel G. Amen, Charles Fay','English',2024,'9781950665912',8,'asset/images/education/Raising Mentally Strong Kids.jpg','1st',6,'Parenting is about to get easier--and a whole lot more effective..including their best possible mental health.',660),

(24,'Pride and Prejudice','Jane Austen','English',1813,'9780141439518',3,'asset/images/novel/Pride and Prejudice.jpg','1st',2,'Pride and Prejudice has charmed generations of readers for more than two centuries. Jane Austen\'s much-adapted novel is famed for its witty, ... throughout her life.',560),

(25,'Raha ke Phool: Sadhguru','Sadhguru','English',2015,'9788189988550',5,'asset/images/books/Raha ke Phool.jpg','1st',2,'The Flowers on the Path series is a bouquet. It comprises articles created by Sadhguru for the Speaking Tree column of the Times of India...mayhem and monotony.',450),

(26,'Dog Man: Big Jim Begins','Dav Pilkey','English',2024,'9781338896435',6,'asset/images/children/Dog Man Big Jim Begins.jpg','1st',3,'In DOG MAN: BIG JIM BEGINS, discover the origin of our beloved characters from the Dog Man series... novelist and award-winning illustrator Dav Pilkey.',640),

(27,'The Staircase in the Woods','Chuck Wendig','English',2023,'9780593157645',4,'asset/images/thriller/The Staircase in the Woods.jpg','1st',4,'A group of friends investigates the mystery of a strange staircase in the woods in this mesmerizing horror novel from... lies beyond the staircase in the woods.',640),

(28,'Albert Einstein: A Biography','Albrecht Folsing','English',1997,'9780140237191',6,'asset/images/biography/Albert Einstein.jpg','1st',5,'A biography of Albert Einstein also delves into his development both personally and as a scientist, .... conversations with colleagues.',400),

(29, 'The Night Circus', 'Erin Morgenstern', 'English', 2011, '9780307744432', 10, 'asset/images/fiction/The Night Circus.jpg', '1st', 1, 'The circus arrives without warning... lives of everyone, from the performers to the patrons, hanging in the balance.', 450.00),

(30, 'Verity', 'Colleen Hoover', 'English', 2018, '9781538724736', 4, 'asset/images/thriller/Verity.jpg', '1st', 4, 'Lowen Ashleigh is a struggling writer... truth this horrifying would make it impossible for him to continue to love her.', 650.00),

(31, 'Where the Crawdads Sing', 'Delia Owens', 'English', 2018, '9780735219106', 15, 'asset/images/fiction/Where the Crawdads Sing.jpg', '1st', 1, 'A woman who raised herself in the marshes... becomes a suspect in the murder.', 399.00),

(32, 'The Rainbow Fish Treasury', 'Marcus Pfister', 'English', 1999, '9781558585362', 12, 'asset/images/children/The Rainbow Fish Treasury.jpg', '1st', 3, 'Marcus Pfister\'s Rainbow Fish books... a wonderful introduction for new readers.', 500.00),

(33, 'The Alchemist', 'Paulo Coelho', 'English', 1988, '9780061122415', 8, 'asset/images/fiction/The Alchemist.jpg', '1st', 1, 'Combining magic, mysticism, wisdom, and wonder... following our dreams.', 299.00),

(34, 'It Ends With Us', 'Colleen Hoover', 'English', 2016, '9781501110368', 5, 'asset/images/fiction/It Ends With Us.jpg', '1st', 1, 'Colleen Hoover’s It Ends With Us... everything Lily has built with Ryle is threatened.', 350.00),

(35, 'When the Harvest Comes', 'Denne Michele Norris', 'English', 2024, '9781638930565', 6, 'asset/images/novel/When the Harvest Comes.jpg', '1st', 2, 'A young Black gay man reckoning with the death of his father... we are more than the men who came before us.', 800.00),

(36, 'The Silent Patient', 'Alex Michaelides', 'English', 2019, '9781250301697', 7, 'asset/images/thriller/The Silent Patient.jpg', '1st', 4, 'Alicia Berenson’s life is seemingly perfect... a search for the truth that threatens to consume him.', 700.00);