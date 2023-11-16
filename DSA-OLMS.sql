--***"Welcome to the Online Library Management System Database Query Project! This project aims to streamline library operations through an efficient database system.**--K.E.


USE master;

--Creating Database
CREATE DATABASE DSAOLMS;

USE DSAOLMS;


------------------------------------------------Creating Tables-------------------------------------------------------------

---Create DimGenre Table---
CREATE TABLE DimGenre(
	GenreID INT PRIMARY KEY NOT NULL,
	GenreName NVARCHAR(255) NOT NULL,
);

---Create DimBooks Table---
CREATE TABLE DimBooks(
	BookID INT PRIMARY KEY NOT NULL,
    Title NVARCHAR(255) NOT NULL,
    Author NVARCHAR(255) NOT NULL,
	BookRating FLOAT NOT NULL,
	BookDescription NVARCHAR(MAX) NOT NULL,
	BookLanguage NVARCHAR(10) NOT NULL,
	BookFormat NVARCHAR(50) NOT NULL,
	BookPages NVARCHAR(5) NOT NULL,
	Publisher NVARCHAR(255) NOT NULL,
	PublishDate DATE NOT NULL,
	BookCoverImg NVARCHAR(255) NOT NULL,
	GenreID INT,
    FOREIGN KEY (GenreID) REFERENCES DimGenre (GenreID)
);

---Create DimBookGenre Table---
CREATE TABLE DimBookGenre (
    BookID INT,
    GenreID INT,
    PRIMARY KEY (BookID, GenreID),
    FOREIGN KEY (BookID) REFERENCES DimBooks (BookID),
    FOREIGN KEY (GenreID) REFERENCES DimGenre (GenreID)
);

---Create DimUsers Table---
CREATE TABLE DimUsers(
	UserID INT PRIMARY KEY NOT NULL,
	Username NVARCHAR(50) NOT NULL,
	UPassword NVARCHAR(50) NOT NULL,
	FName NVARCHAR(50) NOT NULL,
	LName NVARCHAR(50) NOT NULL,
	EmailAdd NVARCHAR(50) NOT NULL,
	ContactNo NVARCHAR(20) NOT NULL,
	RegistrationDate DATE NOT NULL,
	MembershipStatus NVARCHAR(20),
	UserType NVARCHAR(5) NOT NULL
);

---Create Transactions Table---
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY NOT NULL,
    TransactionType NVARCHAR(100) NOT NULL,
    BorrowedDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    BookID INT,
    UserID INT,
    FOREIGN KEY (BookID) REFERENCES DimBooks (BookID),
    FOREIGN KEY (UserID) REFERENCES DimUsers (UserID)
);



-------------------------------------------------END OF CREATION OF TABLES----------------------------------------------------------

------------------------------------------------SPECIFYING KEYS AND CONSTRAINTS-----------------------------------------------------

/* --NOTE: KEYS AND CONSTRAINTS ARE ALREADY DEFINED WHILE CREATING THE TABLES. PLEASE IGNORE. ---


---Defining Primary Key for DimGenre---
ALTER TABLE DimGenre
ADD CONSTRAINT PK_DimGenre PRIMARY KEY (GenreID);

---Defining Primary Key for DimBooks Table---
ALTER TABLE DimBooks
ADD CONSTRAINT PK_DimBooks PRIMARY KEY (BookID);

---Defining Primary Key for DimUsers Table---
ALTER TABLE DimUsers
ADD CONSTRAINT PK_DimUsers PRIMARY KEY (UserID);

---Defining Primary Key for Transactions Table---
ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions PRIMARY KEY (TransactionID);


---Defining Foreign Key for DimBookGenre Table---
ALTER TABLE DimBookGenre
ADD CONSTRAINT FK_DimBookID FOREIGN KEY (BookID) REFERENCES DimBooks(BookID);

ALTER TABLE DimBookGenre
ADD CONSTRAINT FK_DimGenre FOREIGN KEY (GenreID) REFERENCES DimGenre(GenreID);

---Defining Foreign Key for Transactions Table---
ALTER TABLE Transactions
ADD CONSTRAINT FK_DimUsers FOREIGN KEY (UserID) REFERENCES DimUsers(UserID);

ALTER TABLE Transactions
ADD CONSTRAINT FK_DimBooks FOREIGN KEY (BookID) REFERENCES DimBooks(BookID);

*/


---Defining Unique Constraint for DimBookGenre---
ALTER TABLE DimBookGenre
ADD CONSTRAINT UQ_DimBookGenre UNIQUE (BookID, GenreID);

---Defining Unique Constraint for DimUsers Table---
ALTER TABLE DimUsers
ADD CONSTRAINT UQ_EmailAdd UNIQUE (EmailAdd);


--------------------------------------------END OF SPECIFYING KEYS AND CONSTRAINTS -------------------------------------------------


------------------------------------------- INSERTING VALUES / POPULATING THE TABLES ------------------------------------------------


-----------------------------------------------INSERTING VALUES IN DimGenre TABLE ---------------------------------------------------

INSERT INTO DimGenre (GenreID, GenreName)
VALUES
	(1, 'Fiction'),
	(2, 'Action'),
	(3, 'Adventure'),
	(4, 'Romance'),
	(5, 'Classics'),
	(6, 'Science Fiction'),
	(7, 'Historical Fiction'),
	(8, 'Dystopia'),
	(9, 'Mystery'),
	(10, 'Thrillers'),
	(11, 'Young Adult'),
	(12, 'Horror'),
	(13, 'Fantasy'),
	(14, 'Graphic Novels'),
	(15, 'Childrens'),
	(16, 'Games'),
	(17, 'Biography'),
	(18, 'Poetry'),
	(19, 'Plays'),
	(20, 'Picture Books'),
	(21, 'Vampires'),
	(22, 'Memoir'),
	(23, 'Inspirational'),
	(24, 'Contemporary'),
	(25, 'Nonfiction'),
	(26, 'Memoir'),
	(27, 'Philosophy'),
	(28, 'Comics');


-------------------------------------------------Inserting Book Records in DimBooks Table-----------------------------------------

INSERT INTO DimBooks(BookID, Title, Author, BookRating, BookDescription, BookLanguage, BookFormat, BookPages, Publisher, PublishDate, BookCoverImg, GenreID)
VALUES
	(1,'The Hunger Games','Suzanne Collins',4.33,'WINNING MEANS FAME AND FORTUNE.LOSING MEANS CERTAIN DEATH.THE HUNGER GAMES HAVE BEGUN. In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. The Capitol is harsh and cruel and keeps the districts in line by forcing them all to send one boy and once girl between the ages of twelve and eighteen to participate in the annual Hunger Games, a fight to the death on live TV.Sixteen-year-old Katniss Everdeen regards it as a death sentence when she steps forward to take her sister''s place in the Games. But Katniss has been close to dead beforeand survival, for her, is second nature. Without really meaning to, she becomes a contender. But if she is to win, she will have to start making choices that weight survival against humanity and life against love.','English','Hardcover','374','Scholastic Press','9/14/2008','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1586722975l/2767052.jpg',11),
	(2,'Harry Potter and the Order of the Phoenix','J.K. Rowling, Mary GrandPr  (Illustrator)',4.5,'There is a door at the end of a silent corridor. And it''s haunting Harry Pottter''s dreams. Why else would he be waking in the middle of the night, screaming in terror?Harry has a lot on his mind for this, his fifth year at Hogwarts: a Defense Against the Dark Arts teacher with a personality like poisoned honey; a big surprise on the Gryffindor Quidditch team; and the looming terror of the Ordinary Wizarding Level exams. But all these things pale next to the growing threat of He-Who-Must-Not-Be-Named - a threat that neither the magical government nor the authorities at Hogwarts can stop.As the grasp of darkness tightens, Harry must discover the true depth and strength of his friends, the importance of boundless loyalty, and the shocking price of unbearable sacrifice.His fate depends on them all.','English','Paperback','870','Scholastic Inc.','9/28/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546910265l/2.jpg',13),
	(3,'To Kill a Mockingbird','Harper Lee',4.28,'The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it, To Kill A Mockingbird became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.Compassionate, dramatic, and deeply moving, To Kill A Mockingbird takes readers to the roots of human behavior - to innocence and experience, kindness and cruelty, love and hatred, humor and pathos. Now with over 18 million copies in print and translated into forty languages, this regional story by a young Alabama woman claims universal appeal. Harper Lee always considered her book to be a simple love story. Today it is regarded as a masterpiece of American literature.','English','Paperback','324','Harper Perennial Modern Classics','5/23/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1553383690l/2657.jpg',5),
	(4,'Pride and Prejudice','Jane Austen, Anna Quindlen (Introduction)',4.26,'Alternate cover edition of ISBN 9780679783268Since its immediate success in 1813, Pride and Prejudice has remained one of the most popular novels in the English language. Jane Austen called this brilliant work "her own darling child" and its vivacious heroine, Elizabeth Bennet, "as delightful a creature as ever appeared in print." The romantic clash between the opinionated Elizabeth and her proud beau, Mr. Darcy, is a splendid performance of civilized sparring. And Jane Austen''s radiant wit sparkles as her characters dance a delicate quadrille of flirtation and intrigue, making this book the most superb comedy of manners of Regency England.','English','Paperback','279','Modern Library','10/10/2000','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1320399351l/1885.jpg',5),
	(5,'Twilight','Stephenie Meyer',3.6,'About three things I was absolutely positive. First, Edward was a vampire. Second, there was a part of him and I didn''t know how dominant that part might be that thirsted for my blood.And third, I was unconditionally and irrevocably in love with him. Deeply seductive and extraordinarily suspenseful, Twilight is a love story with bite.','English','Paperback','501','Little, Brown and Company','9/6/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361039443l/41865.jpg',11),
	(6,'The Book Thief','Markus Zusak (Goodreads Author)',4.37,'Librarian''s note: An alternate cover edition can be found hereIt is 1939. Nazi Germany. The country is holding its breath. Death has never been busier, and will be busier still.By her brother''s graveside, Liesel''s life is changed when she picks up a single object, partially hidden in the snow. It is The Gravedigger''s Handbook, left behind there by accident, and it is her first act of book thievery. So begins a love affair with books and words, as Liesel, with the help of her accordian-playing foster father, learns to read. Soon she is stealing books from Nazi book-burnings, the mayor''s wife''s library, wherever there are books to be found.But these are dangerous times. When Liesel''s foster family hides a Jew in their basement, Liesel''s world is both opened up, and closed down.In superbly crafted writing that burns with intensity, award-winning author Markus Zusak has given us one of the most enduring stories of our time.(Note: this title was not published as YA fiction)','English','Hardcover','552','Alfred A. Knopf','3/14/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1522157426l/19063._SY475_.jpg',7),
	(7,'Animal Farm','George Orwell, Russell Baker (Preface), C.M. Woodhouse (Introduction)',3.95,'Librarian''s note: There is an Alternate Cover Edition for this edition of this book here.A farm is taken over by its overworked, mistreated animals. With flaming idealism and stirring slogans, they set out to create a paradise of progress, justice, and equality. Thus the stage is set for one of the most telling satiric fables ever penned  a razor-edged fairy tale for grown-ups that records the evolution from revolution against tyranny to a totalitarianism just as terrible. When Animal Farm was first published, Stalinist Russia was seen as its target. Today it is devastatingly clear that wherever and whenever freedom is attacked, under whatever banner, the cutting clarity and savage comedy of George Orwell''s masterpiece have a meaning and message still ferociously fresh.','English','Mass Market Paperback','141','Signet Classics','4/28/1996','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1325861570l/170448.jpg',5),
	(8,'The Chronicles of Narnia','C.S. Lewis, Pauline Baynes (Illustrator)',4.26,'"The Chronicles of Narnia" by C.S. Lewis: A timeless series of seven books that transport readers to a world of fantastic journeys, magical creatures, and epic battles between good and evil. These classics have captured the hearts of readers for over fifty years.','English','Paperback','767','HarperCollins','9/16/2002','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1449868701l/11127._SY475_.jpg',13),
	(9,'J.R.R. Tolkien 4-Book Boxed Set: The Hobbit and The Lord of the Rings','J.R.R. Tolkien',4.6,'This four-volume, boxed set contains J.R.R. Tolkien''s epic masterworks The Hobbit and the three volumes of The Lord of the Rings (The Fellowship of the Ring, The Two Towers, and The Return of the King).In The Hobbit, Bilbo Baggins is whisked away from his comfortable, unambitious life in Hobbiton by the wizard Gandalf and a company of dwarves. He finds himself caught up in a plot to raid the treasure hoard of Smaug the Magnificent, a large and very dangerous dragon.The Lord of the Rings tells of the great quest undertaken by Frodo Baggins and the Fellowship of the Ring: Gandalf the wizard; the hobbits Merry, Pippin, and Sam; Gimli the dwarf; Legolas the elf; Boromir of Gondor; and a tall, mysterious stranger called Strider. J.R.R. Tolkien''s three volume masterpiece is at once a classic myth and a modern fairy talea story of high and heroic adventure set in the unforgettable landscape of Middle-earth','English','Mass Market Paperback','1728','Ballantine Books','9/25/2012','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1346072396l/30.jpg',14),
	(10,'Gone with the Wind','Margaret Mitchell',4.3,'Scarlett O''Hara, the beautiful, spoiled daughter of a well-to-do Georgia plantation owner, must use every means at her disposal to claw her way out of the poverty she finds herself in after Sherman''s March to the Sea.','English','Mass Market Paperback','1037','Warner Books','4/1/1999','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1551144577l/18405._SY475_.jpg',5),
	
	(11,'The Fault in Our Stars','John Green (Goodreads Author)',4.21,'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel''s story is about to be completely rewritten.Insightful, bold, irreverent, and raw, The Fault in Our Stars is award-winning author John Green''s most ambitious and heartbreaking work yet, brilliantly exploring the funny, thrilling, and tragic business of being alive and in love.','English','Hardcover','313','Dutton Books','1/10/2012','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1360206420l/11870085.jpg',11),
	(12,'The Hitchhiker''s Guide to the Galaxy','Douglas Adams',4.22,'Seconds before the Earth is demolished to make way for a galactic freeway, Arthur Dent is plucked off the planet by his friend Ford Prefect, a researcher for the revised edition of The Hitchhiker''s Guide to the Galaxy who, for the last fifteen years, has been posing as an out-of-work actor.Together this dynamic pair begin a journey through space aided by quotes from The Hitchhiker''s Guide ("A towel is about the most massively useful thing an interstellar hitchhiker can have") and a galaxy-full of fellow travelers: Zaphod Beeblebroxthe two-headed, three-armed ex-hippie and totally out-to-lunch president of the galaxy; Trillian, Zaphod''s girlfriend (formally Tricia McMillan), whom Arthur tried to pick up at a cocktail party once upon a time zone; Marvin, a paranoid, brilliant, and chronically depressed robot; Veet Voojagig, a former graduate student who is obsessed with the disappearance of all the ballpoint pens he bought over the years.','English','Paperback','193','Del Rey','6/23/2007','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1559986152l/386162.jpg',6),
	(13,'The Giving Tree','Shel Silverstein',4.37,'"Once there was a tree...and she loved a little boy. "So begins a story of unforgettable perception, beautifully written and illustrated by the gifted and versatile Shel Silverstein.Every day the boy would come to the tree to eat her apples, swing from her branches, or slide down her trunk...and the tree was happy. But as the boy grew older he began to want more from the tree, and the tree gave and gave and gave.This is a tender story, touched with sadness, aglow with consolation. Shel Silverstein has created a moving parable for readers of all ages that offers an affecting interpretation of the gift of giving and a serene acceptance of another''s capacity to love in return.' ,'English','Hardcover','64','HarperCollins Publishers','10/7/1964','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1174210942l/370493._SX318_.jpg',15),
	(14,'Wuthering Heights','Emily Bront, Richard J. Dunn (Editor), David Timson (Narrator), Charlotte Bront (Commentary), Robert Heindel (Illustrator)',3.86,'Norton Critical Edition of Wuthering Heights" (Fourth Edition): This edition of Emily Bronte''s classic novel includes the 1847 text, new annotations, the author''s letters, reviews, poetry, and critical interpretations. It provides a comprehensive perspective on the beloved work.','English','Paperback','464','Norton','10/28/2002','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1587655304l/6185._SY475_.jpg',5),
	(15,'The Da Vinci Code','Dan Brown (Goodreads Author)',3.86,'While in Paris, Harvard symbologist Robert Langdon is awakened by a phone call in the dead of the night. The elderly curator of the Louvre has been murdered inside the museum, his body covered in baffling symbols. As Langdon and gifted French cryptologist Sophie Neveu sort through the bizarre riddles, they are stunned to discover a trail of clues hidden in the works of Leonardo da Vinciclues visible for all to see and yet ingeniously disguised by the painter.Even more startling, the late curator was involved in the Priory of Siona secret society whose members included Sir Isaac Newton, Victor Hugo, and Da Vinciand he guarded a breathtaking historical secret. Unless Langdon and Neveu can decipher the labyrinthine puzzlewhile avoiding the faceless adversary who shadows their every movethe explosive, ancient truth will be lost forever.','English','Paperback','489','Anchor','3/28/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1579621267l/968.jpg',7),
	(16,'Memoirs of a Geisha','Arthur Golden',4.12,'A literary sensation and runaway bestseller, this brilliant debut novel presents with seamless authenticity and exquisite lyricism the true confessions of one of Japan''s most celebrated geisha.In Memoirs of a Geisha, we enter a world where appearances are paramount; where a girl''s virginity is auctioned to the highest bidder; where women are trained to beguile the most powerful men; and where love is scorned as illusion. It is a unique and triumphant work of fiction - at once romantic, erotic, suspenseful - and completely unforgettable.','English','Mass Market Paperback','503','Vintage Books USA','11/22/2005','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1409595968l/929.jpg',1),
	(17,'The Picture of Dorian Gray','Oscar Wilde, Jeffrey Eugenides (Introduction)',4.08,'Written in his distinctively dazzling manner, Oscar Wilde''s story of a fashionable young man who sells his soul for eternal youth and beauty is the author''s most popular work. The tale of Dorian Gray''s moral disintegration caused a scandal when it  rst appeared in 1890, but though Wilde was attacked for the novel''s corrupting inﬂuence, he responded that there is, in fact, a terrible moral in Dorian Gray. Just a few years later, the book and the aesthetic/moral dilemma it presented became issues in the trials occasioned by Wilde''s homosexual liaisons, which resulted in his imprisonment. Of Dorian Gray''s relationship to autobiography, Wilde noted in a letter, Basil Hallward is what I think I am: Lord Henry what the world thinks me: Dorian what I would like to bein other ages, perhaps.','English','Paperback','272','Random House: Modern Library','6/1/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546103428l/5297.jpg',5),
	(18,'Alice''s Adventures in Wonderland & Through the Looking-Glass','Lewis Carroll, John Tenniel (Illustrator), Martin Gardner (Introduction)',4.06,'"I can''t explain myself, I''m afraid, sir, said Alice, "Because I''m not myself, you see. "When Alice sees a white rabbit take a watch out of its waistcoat pocket she decides to follow it, and a sequence of most unusual events is set in motion. This mini book contains the entire topsy-turvy stories of Alice''s Adventures in Wonderland and Through the Looking-Glass, accompanied by practical notes and Martina Pelouso''s memorable full-colour illustrations.','English','Paperback','239','Penguin Group (USA)','12/1/2000','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327872220l/24213.jpg',5),
	(19,'Jane Eyre','Charlotte Bront, Michael Mason (Editor), Barnett Freedman (Illustrator)',4.13,'Orphaned as a child, Jane has felt an outcast her whole young life. Her courage is tested once again when she arrives at Thornfield Hall, where she has been hired by the brooding, proud Edward Rochester to care for his ward Adèle. Jane finds herself drawn to his troubled yet kind spirit. She falls in love. Hard. But there is a terrifying secret inside the gloomy, forbidding Thornfield Hall. Is Rochester hiding from Jane? Will Jane be left heartbroken and exiled once again?','English','Paperback','532','Penguin','2/4/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1557343311l/10210._SY475_.jpg',5),
	(20,'Les Mis rables','Victor Hugo, Lee Fahnestock (Translator), Norman MacAfee (Translator)',4.18,'Introducing one of the most famous characters in literature, Jean Valjeanthe noble peasant imprisoned for stealing a loaf of breadLes Mis rables ranks among the greatest novels of all time. In it, Victor Hugo takes readers deep into the Parisian underworld, immerses them in a battle between good and evil, and carries them to the barricades during the uprising of 1832 with a breathtaking realism that is unsurpassed in modern prose. Within his dramatic story are themes that capture the intellect and the emotions: crime and punishment, the relentless persecution of Valjean by Inspector Javert, the desperation of the prostitute Fantine, the amorality of the rogue Th nardier, and the universal desire to escape the prisons of our own minds. Les Mis rables gave Victor Hugo a canvas upon which he portrayed his criticism of the French political and judicial systems, but the portrait that resulted is larger than life, epic in scopean extravagant spectacle that dazzles the senses even as it touches the heart.','English','Mass Market Paperback','1463','Signet Classics','3/3/1987','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1411852091l/24280.jpg',5),
	
	(21,'Fahrenheit 451','Ray Bradbury',3.99,'Guy Montag is a fireman. In his world, where television rules and literature is on the brink of extinction, firemen start fires rather than put them out. His job is to destroy the most illegal of commodities, the printed book, along with the houses in which they are hidden.Montag never questions the destruction and ruin his actions produce, returning each day to his bland life and wife, Mildred, who spends all day with her television ''family''. But then he meets an eccentric young neighbor, Clarisse, who introduces him to a past where people did not live in fear and to a present where one sees the world through the ideas in books instead of the mindless chatter of television.When Mildred attempts suicide and Clarisse suddenly disappears, Montag begins to question everything he has ever known.','English','Kindle Edition','194','Simon & Schuster','11/29/2011','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1383718290l/13079982.jpg',5),
	(22,'Divergent','Veronica Roth (Goodreads Author)',4.19,'Divergent" by Veronica Roth: In a dystopian Chicago, society is divided into factions based on virtues. Sixteen-year-old Beatrice, later known as Tris, faces a life-changing choice, initiation challenges, and a hidden secret that could save or destroy everything she holds dear.','English','Paperback','487','Katherine Tegen Books','2/28/2012','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1588455221l/13335037._SY475_.jpg',11),
	(23,'Lord of the Flies','William Golding',3.69,'At the dawn of the next world war, a plane crashes on an uncharted island, stranding a group of schoolboys. At first, with no adult supervision, their freedom is something to celebrate; this far from civilization the boys can do anything they want. Anything. They attempt to forge their own society, failing, however, in the face of terror, sin and evil. And as order collapses, as strange howls echo in the night, as terror begins its reign, the hope of adventure seems as far from reality as the hope of being rescued. Labeled a parable, an allegory, a myth, a morality tale, a parody, a political treatise, even a vision of the apocalypse, Lord of the Flies is perhaps our most memorable novel about the end of innocence, the darkness of man''s heart.','English','Paperback','182','Penguin Books','10/1/1999','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327869409l/7624.jpg',5),
	(24,'Romeo and Juliet','William Shakespeare, Paul Werstine (Editor), Barbara A. Mowat (Editor), Paavo Emil Cajander (Translator)',3.75,'In Romeo and Juliet, Shakespeare creates a violent world, in which two young people fall in love. It is not simply that their families disapprove; the Montagues and the Capulets are engaged in a blood feud.In this death-filled setting, the movement from love at first sight to the lovers'' final union in death seems almost inevitable. And yet, this play set in an extraordinary world has become the quintessential story of young love. In part because of its exquisite language, it is easy to respond as if it were about all young lovers.','English','Paperback','301','Simon Schuster','1/1/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1572098085l/18135._SY475_.jpg',5),
	(25,'The Alchemist','Paulo Coelho (Goodreads Author), Alan R. Clarke (Translator), James Noel Smith (Illustrator)',3.88,'Paulo Coelho''s enchanting novel has inspired a devoted following around the world. This story, dazzling in its powerful simplicity and soul-stirring wisdom, is about an Andalusian shepherd boy named Santiago who travels from his homeland in Spain to the Egyptian desert in search of a treasure buried near the Pyramids. Along the way he meets a Gypsy woman, a man who calls himself king, and an alchemist, all of whom point Santiago in the direction of his quest. No one knows what the treasure is, or if Santiago will be able to surmount the obstacles in his path. But what starts out as a journey to find worldly goods turns into a discovery of the treasure found within. Lush, evocative, and deeply humane, the story of Santiago is an eternal testament to the transforming power of our dreams and the importance of listening to our hearts.Illustration: Jim Tierney','English','Paperback','182','HarperOne','4/15/2014','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1466865542l/18144590._SY475_.jpg',1),
	(26,'Crime and Punishment','Fyodor Dostoyevsky, David McDuff (Translator)',4.22,'Raskolnikov, a destitute and desperate former student, wanders through the slums of St Petersburg and commits a random murder without remorse or regret. He imagines himself to be a great man, a Napoleon: acting for a higher purpose beyond conventional moral law. But as he embarks on a dangerous game of cat and mouse with a suspicious police investigator, Raskolnikov is pursued by the growing voice of his conscience and finds the noose of his own guilt tightening around his neck. Only Sonya, a downtrodden prostitute, can offer the chance of redemption.','English','Paperback','671','Penguin','12/31/2002','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1382846449l/7144.jpg',5),
	(27,'The Perks of Being a Wallflower','Stephen Chbosky',4.2,'The Perks of Being a Wallflower by Stephen Chbosky: A poignant coming-of-age story told through Charlie''s letters, as he navigates the challenges of high school, first dates, and self-discovery. A powerful novel that captures the essence of growing up.','English','Paperback','213','MTV Books/Pocket Books','2/28/1999','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1520093244l/22628.jpg',11),
	(28,'The Great Gatsby','F. Scott Fitzgerald, Francis Scott Fitzgerald',3.92,'Alternate Cover Edition ISBN: 0743273567 (ISBN13: 9780743273565)The Great Gatsby, F. Scott Fitzgerald''s third book, stands as the supreme achievement of his career. This exemplary novel of the Jazz Age has been acclaimed by generations of readers. The story is of the fabulously wealthy Jay Gatsby and his new love for the beautiful Daisy Buchanan, of lavish parties on Long Island at a time when The New York Times noted "gin was the national drink and sex the national obsession, " it is an exquisitely crafted tale of America in the 1920s.The Great Gatsby is one of the great classics of twentieth-century literature.(back cover)','English','Paperback','200','Scribner','9/28/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1490528560l/4671._SY475_.jpg',5),
	(29,'City of Bones','Cassandra Clare (Goodreads Author)',4.1,'When fifteen-year-old Clary Fray heads out to the Pandemonium Club in New York City, she hardly expects to witness a murder  much less a murder committed by three teenagers covered with strange tattoos and brandishing bizarre weapons. Then the body disappears into thin air. It''s hard to call the police when the murderers are invisible to everyone else and when there is nothing not even a smear of blood to show that a boy has died. Or was he a boy?This is Clary''s first meeting with the Shadowhunters, warriors dedicated to ridding the earth of demons. It''s also her first encounter with Jace, a Shadowhunter who looks a little like an angel and acts a lot like a jerk. Within twenty-four hours Clary is pulled into Jace''s world with a vengeance when her mother disappears and Clary herself is attacked by a demon. But why would demons be interested in ordinary mundanes like Clary and her mother? And how did Clary suddenly get the Sight? The Shadowhunters would like to know...','English','Hardcover','485','Margaret K. McElderry Books','3/27/2007','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1432730315l/256683._SY475_.jpg',13),
	(30,'Ender''s Game','Orson Scott Card, Stefan Rudnicki (Narrator), Harlan Ellison (Narrator)',4.3,'Ender''s Game" by Orson Scott Card: Andrew "Ender" Wiggin, a child genius, is trained to save humanity from an alien enemy. His journey is marked by harsh challenges, and he''s not the only one with extraordinary abilities. The fate of Earth hangs in the balance.','English','Audiobook','324','Macmillan Audio','9/30/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1408303130l/375802.jpg',6),
	
	(31,'The Help','Kathryn Stockett (Goodreads Author)',4.47,'The Help by Kathryn Stockett: Set in 1962 Mississippi, this novel follows three extraordinary women who defy societal norms to create change. A story of courage, friendship, and breaking boundaries.','English','Hardcover','451','Amy Einhorn Books/G.P. Putnam''s Sons','2/10/2009','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1572940430l/4667024._SY475_.jpg',1),
	(32,'Anne of Green Gables','L.M. Montgomery',4.26,'As soon as Anne Shirley arrives at the snug white farmhouse called Green Gables, she is sure she wants to stay forever, but will the Cuthberts send her back to to the orphanage? Anne knows she''s not what they expecteda skinny girl with fiery red hair and a temper to match. If only she can convince them to let her stay, she''ll try very hard not to keep rushing headlong into scrapes and blurting out the first thing that comes to her mind. Anne is not like anyone else, the Cuthberts agree; she is speciala girl with an enormous imagination. This orphan girl dreams of the day when she can call herself Anne of Green Gables.','English','Paperback','320','Signet Book','5/6/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1390789015l/8127.jpg',5),
	(33,'Harry Potter and the Sorcerer''s Stone','J.K. Rowling, Mary GrandPr  (Illustrator)',4.47,'Harry Potter and the Sorcerer''s Stone" by J.K. Rowling: Harry''s life takes a magical turn when he discovers he''s a wizard and is admitted to Hogwarts School of Witchcraft and Wizardry. His journey as "the boy who lived" begins, filled with adventures and the quest to protect a dangerous secret. A captivating start to the series.','English','Hardcover','309','Scholastic Inc','11/1/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474154022l/3._SY475_.jpg',13),
	(34,'The Little Prince','Antoine de Saint-Exup ry, Richard Howard (Translator), Ivan Minatti (Translator), Nguyễn Thành Vũ (Illustrator)',4.31,'A PBS Great American Read Top 100 PickFew stories are as widely read and as universally cherished by children and adults alike as The Little Prince. Richard Howard''s translation of the beloved classic beautifully reflects Saint-Exup ry''s unique and gifted style. Howard, an acclaimed poet and one of the preeminent translators of our time, has excelled in bringing the English text as close as possible to the French, in language, style, and most important, spirit. The artwork in this edition has been restored to match in detail and in color Saint-Exup ry''s original artwork. Combining Richard Howard''s translation with restored original art, this definitive English-language edition of The Little Prince will capture the hearts of readers of all ages.','English','Paperback','93','Harcourt, Inc.','6/29/2000','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1367545443l/157993.jpg',5),
	(35,'Charlotte''s Web','E.B. White, Garth Williams (Illustrator), Rosemary Wells (Illustrations)',4.17,'This beloved book by E. B. White, author of Stuart Little and The Trumpet of the Swan, is a classic of children''s literature that is "just about perfect." This high-quality paperback features vibrant illustrations colorized by Rosemary Wells!Some Pig. Humble. Radiant. These are the words in Charlotte''s Web, high up in Zuckerman''s barn. Charlotte''s spiderweb tells of her feelings for a little pig named Wilbur, who simply wants a friend. They also express the love of a girl named Fern, who saved Wilbur''s life when he was born the runt of his litter.E. B. White''s Newbery Honor Book is a tender novel of friendship, love, life, and death that will continue to be enjoyed by generations to come. This edition contains newly color illustrations by Garth Williams, the acclaimed illustrator of E. B. White''s Stuart Little and Laura Ingalls Wilder''s Little House series, among many other books.','English','Paperback','184','HarperCollinsPublishers','10/1/2001','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1439632243l/24178._SY475_.jpg',5),
	(36,'Of Mice and Men','John Steinbeck',3.88,'The compelling story of two outsiders striving to find their place in an unforgiving world. Drifters in search of work, George and his simple-minded friend Lennie have nothing in the world except each other and a dream that one day they will have some land of their own. Eventually they find work on a ranch in California''s Salinas Valley, but their hopes are doomed as Lennie, struggling against extreme cruelty, misunderstanding and feelings of jealousy, becomes a victim of his own strength. Tackling universal themes such as the friendship of a shared vision, and giving voice to America''s lonely and dispossessed, Of Mice and Men has proved one of Steinbeck''s most popular works, achieving success as a novel, a Broadway play and three acclaimed films.','English','Paperback','103','Penguin Books','1/8/2002','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1511302904l/890._SX318_.jpg',5),
	(37,'The Time Traveler''s Wife','Audrey Niffenegger (Goodreads Author)',3.97,'The Time Traveler''s Wife" by Audrey Niffenegger: A unique love story between Clare and Henry, where Henry involuntarily time travels. This innovative debut novel explores the effects of time on their relationship and raises questions about life, love, and destiny.','English','ebook','500','Zola Books','9/23/2013','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1380660571l/18619684.jpg',1),
	(38,'Dracula','Bram Stoker, Nina Auerbach (Editor), David J. Skal (Editor)',4,'You can find an alternative cover edition for this ISBN here and here.A rich selection of background and source materials is provided in three areas: Contexts includes probable inspirations for Dracula in the earlier works of James Malcolm Rymer and Emily Gerard. Also included are a discussion of Stoker''s working notes for the novel and Dracula''s Guest,  the original opening chapter to Dracula. Reviews and Reactions reprints five early reviews of the novel. Dramatic and Film Variations focuses on theater and film adaptations of Dracula, two indications of the novel''s unwavering appeal. David J. Skal, Gregory A. Waller, and Nina Auerbach offer their varied perspectives. Checklists of both dramatic and film adaptations are included.Criticism collects seven theoretical interpretations of Dracula by Phyllis A. Roth, Carol A. Senf, Franco Moretti, Christopher Craft, Bram Dijkstra, Stephen D. Arata, and Talia Schaffer.A Chronology and a Selected Bibliography are included.','English','Paperback','488','Norton','5/12/1986','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1387151694l/17245.jpg',5),
	(39,'Brave New World','Aldous Huxley',3.99,'Brave New World is a dystopian novel by English author Aldous Huxley, written in 1931 and published in 1932. Largely set in a futuristic World State, inhabited by genetically modified citizens and an intelligence-based social hierarchy, the novel anticipates huge scientific advancements in reproductive technology, sleep-learning, psychological manipulation and classical conditioning that are combined to make a dystopian society which is challenged by only a single individual: the story''s protagonist.','English','Paperback','288','HarperPerennial / Perennial Classics','9/1/1998','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1575509280l/5129._SY475_.jpg',5),
	(40,'One Hundred Years of Solitude','Gabriel García Márquez, Gregory Rabassa (Translator)',4.08,'The brilliant, bestselling, landmark novel that tells the story of the Buendia family, and chronicles the irreconcilable conflict between the desire for solitude and the need for lovein rich, imaginative prose that has come to define an entire genre known as magical realism.','English','Hardcover','417','Harper','6/24/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327881361l/320.jpg',1),
	
	(41,'The Catcher in the Rye','J.D. Salinger',3.81,'The Catcher in the Rye" by J.D. Salinger: A timeless classic depicting the complex, sixteen-year-old Holden Caulfield''s three days in New York City. It''s a poignant exploration of teenage angst, pain, and the longing for beauty.','English','Paperback','277','Back Bay Books','1/30/2001','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1398034300l/5107.jpg',5),
	(42,'The Princess Bride','William Goldman',4.26,'What happens when the most beautiful girl in the world marries the handsomest prince of all time and he turns out to be...well...a lot less than the man of her dreams?As a boy, William Goldman claims, he loved to hear his father read the S. Morgenstern classic, The Princess Bride. But as a grown-up he discovered that the boring parts were left out of good old Dad''s recitation, and only the "good parts" reached his ears.Now Goldman does Dad one better. He''s reconstructed the "Good Parts Version" to delight wise kids and wide-eyed grownups everywhere. What''s it about? Fencing. Fighting. True Love. Strong Hate. Harsh Revenge. A Few Giants. Lots of Bad Men. Lots of Good Men. Five or Six Beautiful Women. Beasties Monstrous and Gentle. Some Swell Escapes and Captures. Death, Lies, Truth, Miracles, and a Little Sex.In short, it''s about everything.','English','Paperback','456','Ballantine Books','7/15/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327903636l/21787.jpg',13),
	(43,'The Lightning Thief','Rick Riordan (Goodreads Author)',4.26,'Alternate cover for this ISBN can be found herePercy Jackson is a good kid, but he can''t seem to focus on his schoolwork or control his temper. And lately, being away at boarding school is only getting worse - Percy could have sworn his pre-algebra teacher turned into a monster and tried to kill him. When Percy''s mom finds out, she knows it''s time that he knew the truth about where he came from, and that he go to the one place he''ll be safe. She sends Percy to Camp Half Blood, a summer camp for demigods (on Long Island), where he learns that the father he never knew is Poseidon, God of the Sea. Soon a mystery unfolds and together with his friendsone a satyr and the other the demigod daughter of Athena - Percy sets out on a quest across the United States to reach the gates of the Underworld (located in a recording studio in Hollywood) and prevent a catastrophic war between the gods.','English','Paperback','375','Disney Hyperion Books','3/1/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1400602609l/28187.jpg',13),
	(44,'The Secret Garden','Frances Hodgson Burnett',4.13,'The Secret Garden" by Frances Hodgson Burnett: A beloved classic about Mary Lennox''s transformative journey in a gloomy Yorkshire mansion, where she discovers a hidden garden and the power of kindness. A timeless tale for all ages.','English','Hardcover','331','Children''s Classics','9/1/1998','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327873635l/2998.jpg',5),
	(45,'A Thousand Splendid Suns','Khaled Hosseini (Goodreads Author)',4.38,'A Thousand Splendid Suns is a breathtaking story set against the volatile events of Afghanistan''s last thirty yearsfrom the Soviet invasion to the reign of the Taliban to post-Taliban rebuildingthat puts the violence, fear, hope, and faith of this country in intimate, human terms. It is a tale of two generations of characters brought jarringly together by the tragic sweep of war, where personal livesthe struggle to survive, raise a family, find happinessare inextricable from the history playing out around them.Propelled by the same storytelling instinct that made The Kite Runner a beloved classic, A Thousand Splendid Suns is at once a remarkable chronicle of three decades of Afghan history and a deeply moving account of family and friendship. It is a striking, heart-wrenching novel of an unforgiving time, an unlikely friendship, and an indestructible lovea stunning accomplishment.','English','Hardcover','372','Riverhead Books','6/1/2007','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1345958969l/128029.jpg',1),
	(46,'A Wrinkle in Time','Madeleine L''Engle',4,'It was a dark and stormy night.Out of this wild night, a strange visitor comes to the Murry house and beckons Meg, her brother Charles Wallace, and their friend Calvin O''Keefe on a most dangerous and extraordinary adventureone that will threaten their lives and our universe.Winner of the 1963 Newbery Medal, A Wrinkle in Time is the first book in Madeleine L''Engle''s classic Time Quintet.','English','Paperback','218','Square Fish','11/7/2017','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1507963312l/33574273._SX318_.jpg',13),
	(47,'A Game of Thrones','George R.R. Martin',4.45,'A Game of Thrones by George R. R. Martin: The first volume in a modern fantasy masterpiece series. It unfolds in a land with imbalanced seasons, where the Starks of Winterfell face supernatural forces and political intrigue. A captivating tale of power, magic, and conflict in a richly imagined world.','English','Mass Market Paperback','835','Bantam','8/28/2005','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1562726234l/13496.jpg',13),
	(48,'The Adventures of Huckleberry Finn','Mark Twain, Guy Cardwell (Notes), John Seelye (Introduction), Walter Trier (Ilustrator)',3.82,'A nineteenth-century boy from a Mississippi River town recounts his adventures as he travels down the river with a runaway slave, encountering a family involved in a feud, two scoundrels pretending to be royalty, and Tom Sawyer''s aunt who mistakes him for Tom.','English','Paperback','327','Penguin Classics','12/31/2002','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546096879l/2956.jpg',5),
	(49,'The Lovely Bones','Alice Sebold',3.82,'My name was Salmon, like the fish; first name, Susie. I was fourteen when I was murdered on December 6, 1973. So begins the story of Susie Salmon, who is adjusting to her new home in heaven, a place that is not at all what she expected, even as she is watching life on earth continue without her -- her friends trading rumors about her disappearance, her killer trying to cover his tracks, her grief-stricken family unraveling. Out of unspeakable tragedy and loss, The Lovely Bones succeeds, miraculously, in building a tale filled with hope, humor, suspense, even joy.','English','Mass Market Paperback','372','Little, Brown and Company','9/1/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1457810586l/12232938.jpg',1),
	
	(50,'The Outsiders','S.E. Hinton (Goodreads Author)',4.1,'The Outsiders" by S.E. Hinton: A 14-year-old boy named Ponyboy Curtis grapples with the divisions between greasers and socs in a society where he feels like an outsider. When a tragic incident shatters his world, he realizes that pain knows no social boundaries.','English','Mass Market Paperback','192','Puffin Books (US/CAN)','9/1/1997','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442129426l/231804.jpg',5),
	(51,'Where the Wild Things Are','Maurice Sendak',4.22,'Max, a wild and naughty boy, is sent to bed without his supper by his exhausted mother. In his room, he imagines sailing far away to a land of Wild Things. Instead of eating him, the Wild Things make Max their king.','English','Paperback','37','Red Fox','10/28/2000','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1384434560l/19543.jpg',15),
	(52,'Green Eggs and Ham','Dr. Seuss',4.3,'Do you like green eggs and ham? asks Sam-I-am in this Beginner Book by Dr. Seuss. In a house or with a mouse? In a boat or with a goat? On a train or in a tree? Sam keeps asking persistently. With unmistakable characters and signature rhymes, Dr. Seuss''s beloved favorite has cemented its place as a children''s classic. In this most famous of cumulative tales, the list of places to enjoy green eggs and ham, and friends to enjoy them with, gets longer and longer. Follow Sam-I-am as he insists that this unusual treat is indeed a delectable snack to be savored everywhere and in every way. Originally created by Dr. Seuss, Beginner Books encourage children to read all by themselves, with simple words and illustrations that give clues to their meaning.','English','Hardcover','62','Random House Books for Young Readers','10/28/1988','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1468680100l/23772.jpg',15),
	(53,'The Odyssey','Homer, Robert Fagles (Translator), Bernard Knox (Introduction)',3.77,'The Odyssey by Homer, translated by Robert Fagles: A timeless epic about Odysseus'' journey home from the Trojan War, filled with encounters with gods and moral tests. A masterful modern-verse translation to savor.','English','Paperback','541','Penguin Classics','11/30/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1390173285l/1381.jpg',5),
	(54,'Life of Pi','Yann Martel',3.91,'Life of Pi is a fantasy adventure novel by Yann Martel published in 2001. The protagonist, Piscine Molitor "Pi" Patel, a Tamil boy from Pondicherry, explores issues of spirituality and practicality from an early age. He survives 227 days after a shipwreck while stranded on a boat in the Pacific Ocean with a Bengal tiger named Richard Parker.','English','Paperback','460','Seal Books','8/29/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1320562005l/4214.jpg',1),
	(55,'A Tale of Two Cities','Charles Dickens, Richard Maxwell (Editor/Introduction)',3.85,'After eighteen years as a political prisoner in the Bastille, the ageing Doctor Manette is finally released and reunited with his daughter in England. There the lives of two very different men, Charles Darnay, an exiled French aristocrat, and Sydney Carton, a disreputable but brilliant English lawyer, become enmeshed through their love for Lucie Manette. From the tranquil roads of London, they are drawn against their will to the vengeful, bloodstained streets of Paris at the height of the Reign of Terror, and they soon fall under the lethal shadow of La Guillotine.','English','Paperback','489','Penguin Books','10/28/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1344922523l/1953.jpg',5),
	(56,'Water for Elephants','Sara Gruen (Goodreads Author)',4.09,'Water for Elephants" by Sara Gruen: A gripping tale set in a 1932 circus world during the Great Depression. Jacob, a veterinary student turned circus caretaker, falls in love with Marlena, the equestrian star, in a story of love defying all odds.','English','Paperback','335','Algonquin Books','5/1/2007','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1494428973l/43641._SY475_.jpg',1),
	(57,'Lolita','Vladimir Nabokov, Craig Raine (Afterword)',3.89,'"Lolita" by Vladimir Nabokov: A darkly humorous and heart-breaking masterpiece about Humbert Humbert''s obsessive love for his landlady''s young daughter, Lolita, leading to a cross-country misadventure driven by lust and delusion.','English','Paperback','331','Penguin','10/28/1995','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1377756377l/7604.jpg',5),
	(58,'Slaughterhouse-Five','Kurt Vonnegut Jr.',4.08,'Selected by the Modern Library as one of the 100 best novels of all time, Slaughterhouse-Five, an American classic, is one of the world''s great antiwar books. Centering on the infamous firebombing of Dresden, Billy Pilgrim''s odyssey through time reflects the mythic journey of our own fractured lives as we search for meaning in what we fear most.','English','Paperback','275','Dial Press','1/12/1999','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1440319389l/4981.jpg',5),
	(59,'Frankenstein: The 1818 Text','Mary Wollstonecraft Shelley, Charlotte Gordon (Goodreads Author) (Introduction)',3.81,'"Frankenstein" by Mary Wollstonecraft Shelley: The original 1818 text featuring the scientist and his creation. Preserves the novel''s political and feminist themes, with an introduction by Charlotte Gordon and additional content.','English','Paperback','288','Penguin Classics','3/8/2018','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1498841231l/35031085.jpg',5),
	(60,'The Kite Runner','Khaled Hosseini (Goodreads Author), Berliani M. Nugrahani (Translator)',4.3,'The Kite Runner by Khaled Hosseini: A poignant story of an unlikely friendship in a war-torn Afghanistan, exploring themes of reading, betrayal, and redemption. A beloved classic that delves into the relationships between fathers and sons.','English','Paperback','371','Riverhead Books','5/28/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1579036753l/77203._SY475_.jpg',1),
	
	(61,'The Handmaid''s Tale','Margaret Atwood (Goodreads Author)',4.11,'"The Handmaid''s Tale" by Margaret Atwood: Offred, a Handmaid in the Republic of Gilead, faces a bleak existence where women''s rights have been stripped away. Her story is a scathing satire, a dire warning, and a compelling tour de force.','English','Paperback','314','Anchor Books','4/28/1998','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1578028274l/38447._SY475_.jpg',1),
	(62,'The Giver','Lois Lowry (Goodreads Author)',4.13,'Twelve-year-old Jonas lives in a seemingly ideal world. Not until he is given his life assignment as the Receiver does he begin to understand the dark secrets behind this fragile community.','English','Paperback','208','Ember','1/24/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1342493368l/3636.jpg',11),
	(63,'Catch-22','Joseph Heller',3.98,'"Catch-22" by Joseph Heller: Set during World War II, the novel follows Captain John Yossarian, a B-25 bombardier in the U.S. Army Air Forces. It delves into the challenges and absurdities faced by Yossarian and his fellow airmen in their quest to maintain sanity while serving their duty.','English','Paperback','453','Simon & Schuster','9/4/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1463157317l/168668.jpg',5),
	(64,'Dune','Frank Herbert',4.23,'"Dune" by Frank Herbert: The epic tale set on the desert planet Arrakis, where young Paul Atreides, heir to a noble family, must navigate the dangerous politics and the quest for the valuable spice melange. Betrayal leads him on a transformative journey toward a destiny beyond imagination, ultimately becoming the enigmatic figure Muad''Dib.','English','Hardcover','661','Ace Books','10/1/2019','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1555447414l/44767458.jpg',6),
	(65,'The Pillars of the Earth','Ken Follett (Goodreads Author)',4.31,'"The Pillars of the Earth" by Ken Follett: Set in twelfth-century feudal England, this novel tells the captivating story of a monk''s quest to build the greatest Gothic cathedral ever. It''s a tale filled with intrigue, action, romance, and the intricate details of medieval life.','English','Paperback','976','NAL Trade','2/4/2002','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1576956100l/5043.jpg',7),
	(66,'The Stand','Stephen King (Goodreads Author), Bernie Wrightson (Illustrator)',4.34,'"The Stand" by Stephen King: The novel begins with the end of the world due to a deadly virus and follows the lives of the survivors as they navigate the post-apocalyptic landscape, forming new societies and facing the challenges of their bleak new world.','English','Hardcover','1153','Doubleday Books','5/1/1990','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1213131305l/149267.jpg',12),
	(67,'The Adventures of Sherlock Holmes','Arthur Conan Doyle',4.3,'"The Adventures of Sherlock Holmes" by Arthur Conan Doyle: This collection of short stories features the brilliant detective Sherlock Holmes and his loyal friend Dr. Watson as they solve various famous cases, including one where Holmes is outwitted by a woman, Irene Adler.','English','Paperback','389','Oxford University Press','10/22/1998','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1164045516l/3590.jpg',5),
	(68,'Watership Down','Richard Adams',4.06,'"Watership Down" by Richard Adams: In the idyllic Downs of England, a group of unique creatures embarks on an adventure filled with courage and survival as they escape from the encroachment of humans and the destruction of their home. Led by two brave friends, they face trials, predators, and adversaries on their journey to a promised land and a better society.','English','Mass Market Paperback','478','Avon Books','6/28/1975','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1405136931l/76620.jpg',5),
	(69,'Great Expectations','Charles Dickens, Παυλίνα Παμπο δη (Translator), Marisa Sestino (Translator)',3.78,'"Great Expectations" is Charles Dickens''s novel about Pip, an orphan who aspires to be a gentleman. His life changes dramatically when he inherits a fortune, leading to a complex story of crime, guilt, and revenge. Memorable characters like Magwitch and Miss Havisham play key roles.','English','Paperback','505','Oxford University Press','10/28/1998','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327920219l/2623.jpg',5),
	(70,'Little Women','Louisa May Alcott',4.09,'"Little Women" by Louisa May Alcott tells the story of the four March sisters – Jo, Beth, Meg, and Amy – and their struggles during the Civil War in New England. Based on Alcott''s own life, the novel explores themes like love, death, personal ambition, and family responsibilities, resonating with readers young and old.','English','Paperback','449','Signet Classics','4/6/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1562690475l/1934._SY475_.jpg',5),
	
	(71,'The Bell Jar','Sylvia Plath',4.01,'"The Bell Jar" by Sylvia Plath is a haunting American classic that chronicles the mental breakdown of Esther Greenwood, a brilliant, beautiful, and successful young woman. Plath''s intense storytelling makes Esther''s descent into insanity feel entirely real and rational, drawing readers into the dark corners of the human psyche.','English','Paperback','294','Harper Perennial Modern Classics','10/28/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1554582218l/6514._SY475_.jpg',5),
	(72,'Harry Potter and the Deathly Hallows','J.K. Rowling',4.62,'"Harry Potter is leaving Privet Drive for the last time, knowing that Lord Voldemort and the Death Eaters will be pursuing him. The protective charm that kept him safe is broken, and he can''t keep hiding. To stop Voldemort, Harry must find and destroy the remaining Horcruxes. The final battle is approaching.','English','Hardcover','759','Arthur A. Levine Books / Scholastic Inc.','7/21/2007','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474171184l/136251._SY475_.jpg',13),
	(73,'One Flew Over the Cuckoo''s Nest','Ken Kesey',4.19,'In an Oregon mental hospital, Nurse Ratched controls her ward with strict rules and threats of shock therapy. McMurphy, a fun-loving troublemaker, challenges her authority to help fellow inmates. The story is narrated by Chief Bromden, who understands their struggle to break free. Ken Kesey''s novel delves into the boundary between sanity and madness.','English','Mass Market Paperback','325','Signet','2/1/1963','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1516211014l/332613._SX318_.jpg',5),
	(74,'Anna Karenina','Leo Tolstoy, Aylmer Maude (Translator), Lev Tolstoi, Louise Maude (Translator), George Gibian (Preface)',4.05,'In "Anna Karenina," Leo Tolstoy paints a rich portrait of Russian society and human nature. The novel features unforgettable characters, such as Anna, who seeks passion in her affair with Count Vronsky, and Levin, who reflects Tolstoy''s own views. The novel''s title hints at the idea that "Vengeance is mine, and I will repay."','English','Paperback','964','Vintage','10/16/2012','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1601352433l/15823480._SY475_.jpg',5),
	(75,'Outlander','Diana Gabaldon (Goodreads Author)',4.23,'In 1945, Claire Randall, a combat nurse, steps through a time-traveling portal in the British Isles and finds herself in 1743 Scotland, torn by war and conflict. She becomes embroiled in the intrigues of Scottish clans and finds herself torn between two very different men and lives.','English','Mass Market Paperback','850','Dell Publishing Company','7/26/2005','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1529065012l/10964._SY475_.jpg',7),
	(76,'My Sister''s Keeper','Jodi Picoult (Goodreads Author)',4.08,'Thirteen-year-old Anna has always been a medical donor for her sister, Kate, who is battling leukemia. However, as Anna starts questioning her own identity and place in the family, she makes a decision that challenges their family''s dynamics and raises significant ethical questions about life and love.','English','Paperback','423','Washington Square Press','2/1/2005','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1369504683l/10917.jpg',1),
	(77,'Matilda','Roald Dahl, Quentin Blake (Illustrator)',4.32,'Matilda is an extraordinarily gifted and kind-hearted little girl, but she''s burdened with terrible parents and a tyrannical school principal, Miss Trunchbull. With her intelligence and sense of justice, Matilda uses her inner resources to stand up for herself and those she cares about. As she takes on the challenge of dealing with her oppressive surroundings, Matilda''s story becomes a heartwarming and unpredictable tale of triumph.','English','Paperback','240','Puffin Books','6/1/1998','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388793265l/39988.jpg',15),
	(78,'The Fellowship of the Ring','J.R.R. Tolkien',4.36,'The One Ring holds immense power and was created by the Dark Lord Sauron. It was lost for ages until it came into the possession of Bilbo Baggins. Now, young Frodo Baggins is tasked with a perilous journey to destroy the Ring and thwart the Dark Lord''s evil plans.','English','Mass Market Paperback','527','Ballantine Books','3/28/1973','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1486871542l/3263607._SY475_.jpg',5),
	(79,'The Girl with the Dragon Tattoo','Stieg Larsson, Reg Keeland (Translator)',4.14,'Harriet Vanger vanished over forty years ago, and her uncle is still searching for the truth. He hires journalist Mikael Blomkvist, recently convicted of libel, to investigate. With the help of the punk prodigy Lisbeth Salander, they uncover a web of corruption and depravity. Stieg Larsson''s "The Girl with the Dragon Tattoo" weaves a tale of murder, family secrets, romance, and financial intrigue in a complex and atmospheric novel.','English','Hardcover','465','Knopf','9/16/2008','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327868566l/2429135.jpg',1),
	(80,'Rebecca','Daphne du Maurier',4.23,'A young woman falls in love with Maxim de Winter and marries him, only to realize that his deceased wife''s memory haunts their life together in his grand country estate, Manderley.','English','ebook','449','Little, Brown and Company','12/17/2013','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1386605169l/17899948.jpg',5),
	
	(81,'1984','George Orwell',4.19,'"Nineteen Eighty-Four" by George Orwell is a chilling depiction of a totalitarian society where individuality is suppressed, and surveillance is pervasive. Orwell''s foresight about modern life''s features, such as ubiquitous television and language manipulation, adds to the book''s eeriness. It''s a must-read for its haunting portrayal of a dystopian world.','English','Kindle Edition','237','Houghton Mifflin Harcourt','9/3/2013','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1532714506l/40961427._SX318_.jpg',5),
	
	(83,'A Tree Grows in Brooklyn','Betty Smith',4.27,'"A Tree Grows in Brooklyn" by Betty Smith is a beloved American classic that follows the coming-of-age journey of young Francie Nolan in the slums of Williamsburg at the turn of the century. It''s a poignant, compassionate, and honest tale filled with laughter, heartache, and family connections, offering universal moments of experience.','English','Paperback','496','HarperCollins Publishers','5/30/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327883484l/14891.jpg',5),
	(84,'A Clockwork Orange','Anthony Burgess',3.99,'In Anthony Burgess''s dystopian vision of the future, teen gang leader Alex narrates in an inventive slang as criminals rule after dark. A Clockwork Orange is a thought-provoking fable on good, evil, and human freedom. This edition includes the controversial last chapter and Burgess''s introduction, A Clockwork Orange Resucked.','English','Paperback','240','W. W. Norton & Company','5/21/2019','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1549260060l/41817486.jpg',5),
	(85,'The Road','Cormac McCarthy',3.97,'A father and his son embark on a bleak, post-apocalyptic journey through a desolate, ash-covered America. As they travel toward the coast, they face bitter cold, lawless gangs, and utter hopelessness. Their only assets are a pistol, scavenged food, and their deep love for each other. "The Road" is a haunting exploration of human resilience, despair, and the enduring power of love.','English','Hardcover','241','Alfred A. Knopf','10/2/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1600241424l/6288.jpg',1),
	(86,'The Brothers Karamazov','Fyodor Dostoyevsky, Fyodor Dostoyevsky, Richard Pevear (Translator), Larissa Volokhonsky (Translator)',4.32,'"The Brothers Karamazov" is a multifaceted novel that weaves a murder mystery, courtroom drama, and intricate love affairs involving Fyodor Pavlovich Karamazov and his three sons: Dmitri, Ivan, and Alyosha. Dostoevsky''s storytelling encompasses Russian society and its spiritual struggles during a significant era. This award-winning translation by Richard Pevear and Larissa Volokhonsky faithfully captures the original''s richness and modernity, making it a notable achievement in Dostoevsky''s literary legacy.','English','Paperback','796','Farrar, Straus and Giroux','6/14/2002','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1427728126l/4934.jpg',5),
	(87,'Angela''s Ashes','Frank McCourt',4.11,'"Angela''s Ashes" is Frank McCourt''s Pulitzer Prize-winning memoir about his difficult childhood in Depression-era Brooklyn and the slums of Limerick, Ireland. Despite extreme poverty and his father''s alcoholism, McCourt''s love for stories helps him survive and tell his tale with humor and compassion.','English','Paperback','452','Harper Perennial','10/3/2005','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348317139l/252577.jpg',25),
	(88,'Vampire Academy','Richelle Mead (Goodreads Author)',4.12,'Lissa Dragomir is a Moroi princess, a mortal vampire with unique powers. Her best friend, Rose Hathaway, is a dhampir, dedicated to protecting Lissa from the deadly Strigoi vampires. After being captured, they return to St. Vladimir''s Academy, a school for vampire royalty and guardians. Inside its gates, they face danger, forbidden love, and the ever-present threat of the Strigoi.','English','Paperback','332','Razorbill','8/16/2007','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1361098973l/345627.jpg',11),
	(89,'Siddhartha','Hermann Hesse, Hilda Rosner (Translator)',4.03,'In Herman Hesse''s classic novel, a wealthy Indian Brahmin rejects privilege to seek spiritual fulfillment, weaving together Eastern religions, Jungian archetypes, and Western individualism into a profound exploration of life''s true meaning.','English','Mass Market Paperback','152','Bantam Books','12/1/1981','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1428715580l/52036.jpg',5),
	(90,'The Poisonwood Bible','Barbara Kingsolver',4.06,'In "The Poisonwood Bible", the wife and daughters of a fervent Baptist missionary, Nathan Price, journey to the Belgian Congo in 1959, bringing their beliefs and possessions with them. However, their lives take a dramatic turn as they adapt to African soil and face tragic challenges in postcolonial Africa.','English','Hardcover','546','Harper Perennial Modern Classics','7/5/2005','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1412242487l/7244.jpg',1),
	
	(91,'The Golden Compass','Philip Pullman',3.99,'In "Northern Lights", Lyra embarks on a journey to the North, a land ruled by witches and armored bears, in a quest to save her kidnapped friend Roger. She must navigate complex endeavors, loyalty, and betrayal in a world filled with danger and mystery.','English','Hardcover','399','Alfred A. Knopf Books for Young Readers','4/16/1996','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1505766203l/119322._SX318_.jpg',13),
	(92,'Don Quixote','Miguel de Cervantes Saavedra, John Rutherford (Translator), Roberto González Echevarría (Introduction)',3.88,'Don Quixote, enthralled by chivalric romances, sets out on adventures as a self-proclaimed knight-errant alongside his loyal squire, Sancho Panza. Their escapades, marked by Quixote''s delusions and Sancho''s wit, have left a lasting impact on literature, making Don Quixote an early and influential example of the modern novel.','English','Paperback','1023','Penguin Books','2/25/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546112331l/3836._SY475_.jpg',5),
	(93,'Atlas Shrugged','Ayn Rand, Leonard Peikoff (Goodreads Author) (Introduction)',3.69,'This novel is the story of a man who aimed to halt the world''s motor. It explores questions of liberation and destruction, delving into the lives of various characters, from industrialists to philosophers, in a mystery story that challenges fundamental convictions and presents a philosophical revolution.','English','Paperback','1168','Plume','8/1/1999','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1405868167l/662.jpg',5),
	(94,'Harry Potter and the Prisoner of Azkaban','J.K. Rowling, Mary GrandPr  (Illustrator)',4.57,'In Harry Potter''s third year at Hogwarts, he faces new dangers, including the escaped prisoner Sirius Black and the sinister dementors. However, life at Hogwarts continues with Quidditch, new friendships, and intriguing mysteries.','English','Mass Market Paperback','435','Scholastic Inc.','5/1/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1499277281l/5.jpg',13),
	(95,'The Old Man and the Sea','Ernest Hemingway',3.78,'Librarian''s note: An alternate cover edition can be found hereThis short novel, already a modern classic, is the superbly told, tragic story of a Cuban fisherman in the Gulf Stream and the giant Marlin he kills and loses  specifically referred to in the citation accompanying the author''s Nobel Prize for literature in 1954.','English','Hardcover','96','Scribner','10/28/1996','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1329189714l/2165.jpg',5),
	(96,'The Notebook','Nicholas Sparks (Goodreads Author)',4.11,'A young man, Noah, falls in love with a girl, Allie, during a summer in North Carolina. After years apart, she returns to rekindle their love, and their story becomes a profound exploration of love''s enduring power.','English','Kindle Edition','227','Grand Central Publishing','1/5/2000','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1483183484l/33648131._SY475_.jpg',4),
	(97,'Winnie-the-Pooh','A.A. Milne, Ernest H. Shepard (Illustrator)',4.34,'The adventures of Christopher Robin and his friends in which Pooh Bear uses a balloon to get honey, Piglet meets a Heffalump, and Eeyore has a birthday.','English','Hardcover','145','Dutton Juvenile','10/1/2001','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1298440130l/99107.jpg',5),
	(98,'The Complete Stories and Poems','Edgar Allan Poe',4.38,'This single volume brings together all of Poe''s stories and poems, and illuminates the diverse and multifaceted genius of one of the greatest and most influential figures in American literary history.','English','Hardcover','821','Doubleday & Company, Inc.','8/15/1984','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327942676l/23919.jpg',5),
	(99,'Interview with the Vampire','Anne Rice',4,'This is Louis''s personal account of his journey from a mortal to a vampire at the hands of Lestat. It delves into his experiences, including his relationship with Claudia, a child trapped in a vampire''s body, and their quest to find their place among others of their kind, which leads them to a theatre of vampires in Paris.','English','Paperback','342','Ballantine Books','8/31/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1380631642l/43763.jpg',12),
	(100,'A Prayer for Owen Meany','John Irving (Goodreads Author)',4.23,'Eleven-year-old Owen Meany believes he is God''s instrument after accidentally killing his best friend''s mother with a foul ball during a Little League game. His life takes extraordinary and terrifying turns as he sees himself as part of a divine plan in this novel by John Irving.','English','Paperback','637','Black Swan','10/28/1990','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1260470010l/4473.jpg',1),
	
	(101,'Moby-Dick or, the Whale','Herman Melville, Andrew Delbanco (Introduction), Tom Quirk (Notes), Rockwell Kent (Illustrator)',3.51,'"Moby-Dick is the story of a madman''s pursuit of a monstrous and enigmatic sea creature, but it is also a profound exploration of character, faith, and the nature of perception. Melville''s masterpiece is a blend of adventure, whaling lore, and philosophical inquiry.','English','Paperback','654','Penguin Classics','2/21/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327940656l/153747.jpg',5),
	(102,'The Red Tent','Anita Diamant (Goodreads Author)',4.18,'The Red Tent tells the story of Dinah, the daughter of Jacob, and offers an intimate perspective on the traditions and challenges of ancient womanhood, often overlooked in the Bible. Dinah''s narrative begins with her mothers, Jacob''s four wives, and weaves a tale of love, midwifery, and the bonds of sisterhood in a distant era.','English','Hardcover','324','St. Martin''s Press','10/28/1997','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1405739117l/4989.jpg',7),
	(103,'The Secret Life of Bees','Sue Monk Kidd (Goodreads Author)',4.06,'"The Secret Life of Bees" is set in 1964 South Carolina and follows the story of Lily Owens. Her life has been defined by the blurred memory of her mother''s tragic death. When Lily and her caretaker Rosaleen confront racists in town, they decide to escape to Tiburon, South Carolina, seeking answers about Lily''s mother. They find refuge with a trio of black beekeeping sisters, learning about the world of bees, honey, and the Black Madonna, in a tale that celebrates the power of women.','English','Paperback','302','Penguin Books','1/28/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1473454532l/37435._SY475_.jpg',1),
	(104,'Harry Potter and the Goblet of Fire','J.K. Rowling, Mary GrandPr  (Illustrator)',4.56,'In "Harry Potter and the Goblet of Fire," Harry seeks a normal life at Hogwarts, but unusual events and dangerous challenges test him as he navigates his fourth year of wizard training.','English','Paperback','734','Scholastic','9/28/2002','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1554006152l/6.jpg',13),
	(105,'Clockwork Angel','Cassandra Clare (Goodreads Author), Rita Sussekind (Translator)',4.32,'In the year 1878, Tessa Gray embarks on a quest to find her missing brother and becomes entangled with London''s supernatural underworld. She teams up with Shadowhunters, demon-slayers, including two enigmatic boys, Will and Jem, to battle the Pandemonium Club, a secretive organization with a clockwork army set on dominating the British Empire. This is a prequel to the Mortal Instruments series.','English','Hardcover','481','Simon & Schuster, Margaret K. McElderry','8/31/2010','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1454962884l/7171637._SY475_.jpg',13),
	(106,'Harry Potter and the Half-Blood Prince','J.K. Rowling',4.57,'Amidst the ongoing war against Voldemort, life goes on at Hogwarts. Students learn to Apparate, engage in teenage antics, and fall in love. The Weasley twins expand their business, and Harry receives assistance from the mysterious Half-Blood Prince. The focus shifts to the home front as Harry delves into the past of the boy who became Lord Voldemort to uncover a potential vulnerability. This is the sixth installment in the Harry Potter series.','English','Paperback','652','Scholastic Inc.','9/16/2006','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1587697303l/1._SX318_.jpg',13),
	(107,'And Then There Were None','Agatha Christie',4.26,'Ten strangers are lured to a remote island, each harboring a dark secret. As they realize that murders are occurring as described in a chilling nursery rhyme, fear grows. One by one, they become victims of a sinister plot. Their host is missing, and suspicion runs high. By the end of the weekend, there will be no survivors. This is the premise of Agatha Christie''s mystery novel.','English','Paperback','264','St. Martin''s Press','5/3/2004','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1391120695l/16299.jpg',9),
	(108,'Middlesex','Jeffrey Eugenides',4.01,'"Middlesex" is the captivating multigenerational saga of the Greek-American Stephanides family. Beginning in a small village in Asia Minor, the family later moves to Detroit during its heyday and eventually settles in suburban Michigan. The novel''s protagonist, Calliope, must navigate a profound family secret and a unique genetic history that leads to a transformative identity shift from Callie to Cal. It''s a lyrical and thrilling exploration of the American experience.','English','Paperback','529','Picador USA','9/16/2003','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1437029776l/2187._SY475_.jpg',1),
	(109,'The Stranger','Albert Camus, Matthew Ward (Translator)',3.98,'Through the story of an ordinary man unwittingly drawn into a senseless murder on an Algerian beach, Camus explored what he termed the nakedness of man faced with the absurd. First published in English in 1946; now in a new translation by Matthew Ward.','English','Paperback','123','Vintage International','3/28/1989','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1590930002l/49552._SY475_.jpg',5),
	(110,'The Master and Margarita','Mikhail Bulgakov, Katherine Tiernan O''Connor (Translator), Ellendea Proffer (Annotations and Afterword), Diana Lewis Burgin (Translator)',4.29,'"The Master and Margarita" is a comic masterpiece by Mikhail Bulgakov, reimagining the stories of Faust and Pontius Pilate. In the novel, the devil arrives in Moscow, causing chaos with his retinue, including a beautiful witch and a talking black cat. The story brings peace to two unhappy residents: the Master, a persecuted writer, and Margarita, who is willing to go to hell for him. This work offers humor, energy, and philosophical depth, and is considered a classic of modern Russian literature.','English','Paperback','335','Vintage International','3/28/1996','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327867963l/117833.jpg',5);

--------------------------------------------------END OF POPULATING DimBooks Table------------------------------------------------


-------------------------------------------------INSERTING VALUES TO DimBookGenre--------------------------------------------------

INSERT INTO DimBookGenre(BookID, GenreID)
VALUES
(1,11),
(2,13),
(3,5),
(4,5),
(5,11),
(6,7),
(7,5),
(8,13),
(9,14),
(10,5),
(11,11),
(12,6),
(13,15),
(14,5),
(15,7),
(16,1),
(17,5),
(18,5),
(19,5),
(20,5),
(21,5),
(22,11),
(23,5),
(24,5),
(25,1),
(26,5),
(27,11),
(28,5),
(29,13),
(30,6),
(31,1),
(32,5),
(33,13),
(34,5),
(35,5),
(36,5),
(37,1),
(38,5),
(39,5),
(40,1),
(41,5),
(42,13),
(43,13),
(44,5),
(45,1),
(46,13),
(47,13),
(48,5),
(49,1),
(50,5),
(51,15),
(52,15),
(53,5),
(54,1),
(55,5),
(56,1),
(57,5),
(58,5),
(59,5),
(60,1),
(61,1),
(62,11),
(63,5),
(64,6),
(65,7),
(66,12),
(67,5),
(68,5),
(69,5),
(70,5),
(71,5),
(72,13),
(73,5),
(74,5),
(75,7),
(76,1),
(77,15),
(78,5),
(79,1),
(80,5),
(81,5),

(83,5),
(84,5),
(85,1),
(86,5),
(87,25),
(88,11),
(89,5),
(90,1),
(91,13),
(92,5),
(93,5),
(94,13),
(95,5),
(96,4),
(97,5),
(98,5),
(99,12),
(100,1),
(101,5),
(102,7),
(103,1),
(104,13),
(105,13),
(106,13),
(107,9),
(108,1),
(109,5),
(110,5);
/* --- 2ND GENRE OF BOOKS ----
(1,2),
(2,11),
(3,2),
(4,2),
(5,13),
(6,1),
(7,1),
(8,5),
(9,1),
(10,7),
(11,4),
(12,1),
(13,20),
(14,1),
(15,9),
(16,7),
(17,1),
(18,13),
(19,1),
(20,1),
(21,1),
(22,8),
(23,1),
(24,19),
(25,5),
(26,1),
(27,1),
(28,1),
(29,11),
(30,1),
(31,7),
(32,1),
(33,1),
(34,1),
(35,15),
(36,1),
(37,4),
(38,12),
(39,1),
(40,5),
(41,1),
(42,1),
(43,11),
(44,1),
(45,7),
(46,1),
(47,1),
(48,1),
(49,9),
(50,11),
(51,20),
(52,20),
(53,1),
(54,13),
(55,1),
(56,7),
(57,1),
(58,1),
(59,1),
(60,7),
(61,5),
(62,1),
(63,1),
(64,1),
(65,1),
(66,1),
(67,9),
(68,1),
(69,1),
(70,1),
(71,1),
(72,11),
(73,1),
(74,1),
(75,4),
(76,24),
(77,1),
(78,3),
(79,9),
(80,1),
(81,1),

(83,1),
(84,1),
(85,6),
(86,1),
(87,26),
(88,13),
(89,1),
(90,7),
(91,11),
(92,1),
(93,27),
(94,11),
(95,1),
(96,1),
(97,15),
(98,18),
(99,13),
(100,5),
(101,1),
(102,1),
(103,7),
(104,11),
(105,11),
(106,11),
(107,5),
(108,7),
(109,1),
(110,1); */

-------------------------------------------------END OF POPULATING DimBookGenre TABLE----------------------------------------------


------------------------------------------------INSERTING VALUES IN DimUsers TABLE-------------------------------------------------

INSERT INTO DimUsers (UserID, Username, UPassword, FName, LName, EmailAdd, ContactNo, RegistrationDate, MembershipStatus, UserType)
VALUES
(1,'shini','evshin','Shinee','Eve','sheenieve@gmail.com','(981) 741-3502','8/19/2023','Active',1),
(2,'elren','elsadle','Elsa','Arendelle','elsaarendelle@gmail.com','(761) 933-6364','10/18/2023','Active',3),
(3,'cleve','cleve12','Clark','Eve','clarkeve@gmail.com','(907) 322-6663','9/12/2023','Inactive',3),
(4,'riam','cabria','Maria','Cabs','mariacabs@gmail.com','(863) 212-8973','9/27/2023','Active',2),
(5,'miams','miams2','Mia','Williams','miawilliams@gmail.com','(304) 385-2774','8/23/2023','Inctive',3),
(6,'zozodavis','davzo234','Zoe','Davis','zoedavis@gmail.com','(309) 882-2678','10/9/2023','Active',3),
(7,'Tommie7','7WhitneyTommie7','Tommie','Whitney','tommiewhitney@gmail.com','(953) 955-0535','10/5/2023','Active',3),
(8,'Jonah8','8PaulJonah8','Jonah','Paul','jonahpaul@gmail.com','(249) 410-1372','8/10/2023','Active',3),
(9,'Bilbo9','9BagginsBilbo9','Bilbo','Baggins','bilbobaggins@gmail.com','(582) 374-5857','10/17/2023','Active',3),
(10,'Dylan10','10PonceDylan10','Dylan','Ponce','dylanponce@gmail.com','(362) 688-6852','9/3/2023','Active',3),
(11,'Elron11','11HalfelvenElron11','Elron','Halfelven','elronhalfelven@gmail.com','(441) 740-1387','10/8/2023','Active',3),
(12,'Hiroji12','12KawasakiHiroji12','Hiroji','Kawasaki','hirojikawasaki@gmail.com','(872) 320-9521','10/11/2023','Active',3),
(13,'Asahi13','13HataAsahi13','Asahi','Hata','asahihata@gmail.com','(571) 701-7556','10/26/2023','Active',3),
(14,'Mario14','14RoyMario14','Mario','Roy','marioroy@gmail.com','(557) 995-5874','9/11/2023','Inctive',3),
(15,'Floyd15','15HernandezFloyd15','Floyd','Hernandez','floydhernandez@gmail.com','(636) 260-2184','9/4/2023','Active',3),
(16,'Stephen16','16StrangeStephen16','Stephen','Strange','stephenstrange@gmail.com','(983) 390-6059','8/17/2023','Active',3),
(17,'Keri17','17MaddoxKeri17','Keri','Maddox','kerimaddox@gmail.com','(204) 896-1246','9/1/2023','Active',3),
(18,'Gojo18','18SatoruGojo18','Gojo','Satoru','gojosatoru@gmail.com','(479) 848-7535','8/30/2023','Active',3),
(19,'Rena19','19TurnerRena19','Rena','Turner','renaturner@gmail.com','(742) 637-6958','9/18/2023','Inctive',3),
(20,'Aron20','20TylerAron20','Aron','Tyler','arontyler@gmail.com','(563) 219-8188','8/21/2023','Active',3),
(21,'Peter21','21ParkerPeter21','Peter','Parker','peterparker@gmail.com','(591) 842-8979','10/23/2023','Inctive',3),
(22,'Marianne22','22ChungMarianne22','Marianne','Chung','mariannechung@gmail.com','(493) 669-6034','10/27/2023','Active',3),
(23,'Hiroshi23','23TsuzukiHiroshi23','Hiroshi','Tsuzuki','hiroshitsuzuki@gmail.com','(839) 339-5664','10/10/2023','Inctive',3),
(24,'Elnora24','24PhamElnora24','Elnora','Pham','elnorapham@gmail.com','(890) 851-0783','9/5/2023','Active',3),
(25,'Asa25','25SheaAsa25','Asa','Shea','asashea@gmail.com','(972) 678-2564','8/18/2023','Inctive',3),
(26,'Malcolm26','26WillisMalcolm26','Malcolm','Willis','malcolmwillis@gmail.com','(257) 740-7158','9/2/2023','Active',3),
(27,'Erina27','27NakiriErina27','Erina','Nakiri','erinanakiri@gmail.com','(736) 402-5669','10/13/2023','Active',3),
(28,'Patricia28','28NixonPatricia28','Patricia','Nixon','patricianixon@gmail.com','(786) 748-4239','8/11/2023','Active',3),
(29,'Katina29','29McintoshKatina29','Katina','Mcintosh','katinamcintosh@gmail.com','(780) 327-7231','8/25/2023','Inctive',3),
(30,'Hasan30','30LeoHasan30','Hasan','Leo','hasanleo@gmail.com','(782) 541-1091','9/7/2023','Active',3),
(31,'Ch''ng31','31KumarCh''ng31','Ch''ng','Kumar','chngkumar@gmail.com','(446) 879-0248','10/30/2023','Active',3),
(32,'Natalie32','32RomanoffNatalie32','Natalie','Romanoff','natalieromanoff@gmail.com','(667) 301-3955','10/14/2023','Inctive',3),
(33,'Liang33','33LimLiang33','Liang','Lim','lianglim@gmail.com','(254) 213-4398','8/8/2023','Active',3),
(34,'Gim34','34SiongGim34','Gim','Siong','gimsiong@gmail.com','(305) 712-6619','8/9/2023','Active',3),
(35,'MJ35','35WatsonMJ35','MJ','Watson','mjwatson@gmail.com','(830) 875-0591','10/24/2023','Inctive',3),
(36,'Nina36','36BlinovNina36','Nina','Blinov','ninablinov@gmail.com','(685) 471-2069','9/17/2023','Active',3),
(37,'Mirza37','37SmirnovaMirza37','Mirza','Smirnova','mirzasmirnova@gmail.com','(309) 861-0223','10/7/2023','Active',3),
(38,'Miyako 38','38HanadaMiyako 38','Miyako ','Hanada','miyako hanada@gmail.com','(670) 926-3764','10/16/2023','Active',3),
(39,'Leska39','39GusevLeska39','Leska','Gusev','leskagusev@gmail.com','(806) 654-4310','10/1/2023','Inctive',3),
(40,'Marc40','40GasparMarc40','Marc','Gaspar','marcgaspar@gmail.com','(246) 477-6258','8/16/2023','Active',3),
(41,'Lluis41','41SalaLluis41','Lluis','Sala','lluissala@gmail.com','(536) 781-1606','10/2/2023','Active',3),
(42,'Isabella42','42ZamoraIsabella42','Isabella','Zamora','isabellazamora@gmail.com','(365) 301-0537','11/5/2023','Active',3),
(43,'Chunli43','43MiChunli43','Chunli','Mi','chunlimi@gmail.com','(692) 237-8256','9/20/2023','Inctive',3),
(44,'Weiyi44','44JangWeiyi44','Weiyi','Jang','weiyijang@gmail.com','(339) 248-7829','9/25/2023','Inctive',3),
(45,'Shilin45','45XuShilin45','Shilin','Xu','shilinxu@gmail.com','(912) 488-6561','10/28/2023','Active',3),
(46,'Ursel46','46SpindlerUrsel46','Ursel','Spindler','urselspindler@gmail.com','(655) 504-8372','11/7/2023','Active',3),
(47,'Adam47','47BehrAdam47','Adam','Behr','adambehr@gmail.com','(780) 443-3992','11/3/2023','Active',3),
(48,'Ron48','48BoonRon48','Ron','Boon','ronboon@gmail.com','(633) 506-6735','9/28/2023','Inctive',3),
(49,'Clara49','49SpekClara49','Clara','Spek','claraspek@gmail.com','(757) 284-8631','11/4/2023','Active',3),
(50,'Vic50','50NobleVic50','Vic','Noble','vicnoble@gmail.com','(761) 585-6571','9/26/2023','Inctive',3);

-------------------------------------------------END OF POPULATING DimUsers TABLE--------------------------------------------------

---------------------------------------INSERTING TRANSACTION RECORDS IN Transactions Table ------------------------------------

INSERT INTO Transactions (TransactionID, TransactionType, BorrowedDate, DueDate, ReturnDate, BookID, UserID)
VALUES

(1001,'Check-Out','9/12/2023','9/26/2023','9/12/2023',11,2),
(1002,'Return','8/5/2023','8/4/2023','8/5/2023',3,2),
(1003,'Check-Out','8/3/2023','8/17/2023','8/17/2023',34,3),
(1004,'Return','7/3/2023','7/3/2023','7/3/2023',8,5),
(1005,'Return','5/9/2022','5/10/2023','5/9/2022',23,6),
(1006,'Check-Out','8/25/2023','9/1/2023','8/25/2023',93,3),
(1007,'Return','9/24/2023','10/1/2023','9/29/2023',66,9),
(1008,'Return','8/21/2023','8/28/2023','8/28/2023',72,5),
(1009,'Check-Out','9/6/2023','9/13/2023','9/6/2023',57,7),
(1010,'Return','8/24/2023','8/31/2023','8/31/2023',70,4),
(1011,'Return','9/1/2023','9/8/2023','9/8/2023',72,2),
(1012,'Check-Out','8/22/2023','8/29/2023','8/22/2023',15,8),
(1013,'Return','9/22/2023','9/29/2023','9/27/2023',2,5),
(1014,'Check-Out','8/28/2023','9/4/2023','8/28/2023',67,35),
(1015,'Return','9/15/2023','9/22/2023','9/17/2023',93,49),
(1016,'Check-Out','8/24/2023','8/31/2023','8/24/2023',58,32),
(1017,'Return','9/22/2023','9/29/2023','9/29/2023',7,15),
(1018,'Return','9/16/2023','9/23/2023','9/19/2023',59,25),
(1019,'Check-Out','8/22/2023','8/29/2023','8/22/2023',100,12),
(1020,'Return','9/12/2023','9/19/2023','9/15/2023',37,18),
(1021,'Return','9/15/2023','9/22/2023','9/18/2023',44,49),
(1022,'Return','9/8/2023','9/15/2023','9/12/2023',87,17),
(1023,'Check-Out','9/20/2023','9/27/2023','9/20/2023',66,47),
(1024,'Return','8/21/2023','8/28/2023','8/24/2023',95,5),
(1025,'Check-Out','8/30/2023','9/6/2023','8/30/2023',10,18),
(1026,'Return','10/13/2023','10/20/2023','10/16/2023',62,4),
(1027,'Check-Out','10/26/2023','11/2/2023','10/26/2023',1,36),
(1028,'Return','9/25/2023','10/2/2023','9/29/2023',25,15),
(1029,'Return','10/23/2023','10/30/2023','10/26/2023',32,14),
(1030,'Check-Out','10/26/2023','11/2/2023','10/26/2023',23,44),
(1031,'Return','9/27/2023','10/4/2023','9/30/2023',40,5),
(1032,'Check-Out','10/5/2023','10/12/2023','10/5/2023',44,40),
(1033,'Return','9/22/2023','9/29/2023','9/25/2023',98,25),
(1034,'Check-Out','10/22/2023','10/29/2023','10/22/2023',38,14),
(1035,'Return','9/13/2023','9/20/2023','9/20/2023',22,16),
(1036,'Return','9/25/2023','10/2/2023','9/28/2023',25,44),
(1037,'Return','9/14/2023','9/21/2023','9/17/2023',24,4),
(1038,'Check-Out','10/18/2023','10/25/2023','10/18/2023',29,16),
(1039,'Return','10/5/2023','10/12/2023','10/5/2023',22,6),
(1040,'Return','9/28/2023','10/5/2023','10/1/2023',106,36),
(1041,'Check-Out','9/18/2023','9/25/2023','9/18/2023',9,32),
(1042,'Return','9/17/2023','9/24/2023','9/20/2023',43,11),
(1043,'Check-Out','9/9/2023','9/16/2023','9/9/2023',106,23),
(1044,'Return','9/22/2023','9/29/2023','9/27/2023',94,14),
(1045,'Check-Out','10/25/2023','11/1/2023','10/25/2023',90,26),
(1046,'Return','11/25/2023','12/2/2023','12/1/2023',53,10),
(1047,'Check-Out','11/1/2023','11/8/2023','11/1/2023',106,8),
(1048,'Check-Out','10/17/2023','10/24/2023','10/17/2023',2,12),
(1049,'Return','11/8/2023','11/15/2023','11/10/2023',71,17),
(1050,'Return','11/16/2023','11/23/2023','11/19/2023',17,9),
(1051,'Check-Out','11/5/2023','11/12/2023','11/5/2023',15,5),
(1052,'Return','10/16/2023','10/23/2023','10/19/2023',72,8),
(1053,'Return','10/25/2023','11/1/2023','10/28/2023',10,31),
(1054,'Check-Out','11/13/2023','11/20/2023','11/13/2023',12,41),
(1055,'Return','10/8/2023','10/15/2023','10/8/2023',17,21);


----------------------------------------------END OF POPULATING Transactions Table----------------------------------------------


---Check/Confirm the Records---
SELECT * FROM DimGenre;
SELECT * FROM DimBooks;
SELECT * FROM DimBookGenre;
SELECT * FROM DimUsers;
SELECT * FROM Transactions;


------------------------------------------- * Defining Users, User Roles And Grant Permissions * -----------------------------------------

---Create Login and User LibAdminID01
CREATE LOGIN LibAdminID01 WITH PASSWORD = 'libadminid01';
CREATE USER UserAdmin01 FOR LOGIN LibAdminID01;

--Creating LibraryAdmin Role
CREATE ROLE LibAdminRole;

--Adding member UserAdmin01 to LibAdminRole
ALTER ROLE LibAdminRole ADD MEMBER UserAdmin01;

--Granting Permissions  to LibraryAdmin Role
GRANT SELECT, INSERT, UPDATE, DELETE ON DimGenre TO LibAdminRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON DimBooks TO LibAdminRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON DimBookGenre TO LibAdminRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON DimUsers TO LibAdminRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Transactions TO LibAdminRole;


---Create Login and User Members
CREATE LOGIN MemOnly01 WITH PASSWORD = 'memberonly1';
CREATE USER UserMem01 FOR LOGIN MemOnly01;

--Creating MembersOnlyRole
CREATE ROLE MembersOnlyRole;

--Adding member to MembersOnlyRole
ALTER ROLE MembersOnlyRole ADD MEMBER UserMem01;

--Granting Permissions to MembersOnlyRole
GRANT SELECT ON DimBooks TO MembersOnlyRole;
GRANT SELECT ON DimGenre TO MembersOnlyRole;
GRANT SELECT ON DimBookGenre TO MembersOnlyRole;


---------Creating View
CREATE VIEW AllBookList AS
SELECT
	b.BookID AS [BookID],
	b.Title AS [Book Title],
	b.Author AS [Author],
	b.Publisher AS [Publisher],
	g.GenreName as [Genre]
FROM DimBooks as b
JOIN DimBookGenre as bg ON b.BookID = bg.BookID
JOIN DimGenre as g ON bg.GenreID = g.GenreID;
--END


-----------------------------------------------------* Creating Stored Procedures *------------------------------------------------

--Creating Stored Procedure for Book Title Search FOR MEMBERS
CREATE PROCEDURE SearchBooksByTitle
	@SearchTitle NVARCHAR(255)

AS
BEGIN
	--query to search for books--
	SELECT DISTINCT
		b.BookID AS [BookID],
		b.Title AS [Book Title],
		b.Author AS [Author],
		b.BookRating AS [Rating],
		b.BookDescription AS [Description],
		b.BookLanguage AS [Language],
		b.BookFormat AS [Book Format],
		b.Publisher AS [Publisher],
		b.PublishDate AS [Publish Date],
		b.BookCoverImg AS [Book Cover Image],
		g.GenreName as [Genre]
	FROM DimBooks as b
	INNER JOIN DimBookGenre as bg ON b.BookID = bg.BookID
	INNER JOIN DimGenre as g ON bg.GenreID = g.GenreID
	WHERE
		b.Title LIKE '%' + @SearchTitle + '%';
END;

---Granting Execute Permission to MembersOnlyRole
GRANT EXECUTE ON SearchBooksByTitle TO MembersOnlyRole;

--Execute proc SearchBooksByTitle
EXEC SearchBooksByTitle @SearchTitle = 'Harry';



-----------*** Creating Stored Procedure SearchName for LibAdminRole***---------------
CREATE PROCEDURE SearchUserName
	@SearchTerm NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT UserID, Username, UPassword, FName, LName, EmailAdd
	FROM DimUsers
	WHERE FName LIKE '%' + @SearchTerm + '%'
	OR LName LIKE '%' + @SearchTerm + '%';
END;

--Granting Execute Permission for LibAdminRole
GRANT EXECUTE ON SearchUserName TO LibAdminRole;

EXEC SearchUserName @SearchTerm = 'eve'

SELECT * FROM DimUsers;

--******************************************************************************************************************************--


------------------------------------------SAMPLE QUERIES FOR DATA RETRIEVAL-------------------------------------------------------

--Query to Search for books by genre
SELECT * FROM DimBooks WHERE GenreID =1;

--Query to Search for books by ID
SELECT
	BookID,
	Title,
	Author,
	GenreID
FROM DimBooks
WHERE BookID =99;



---Query to Generate a Report on Books Borrowed by users

SELECT 
	users.FName as [User],
	books.Title as [Book Title],
	tr.BorrowedDate as [Transaction],
	tr.DueDate as [Due Date]
FROM DimUsers as users
JOIN Transactions as tr ON users.UserID = tr.UserID
JOIN dimBooks as books ON tr.BookID = books.BookID
WHERE users.FName = 'elsa';


PRINT 'DSA-Online Library Management System Database by Kamille C. Evangelista';