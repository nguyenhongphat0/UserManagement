CREATE DATABASE UserManagement
USE UserManagement

CREATE TABLE Roles(
    RoleID INT NOT NULL PRIMARY KEY,
    RoleName VARCHAR(100)
)

CREATE TABLE Users(
    Username VARCHAR(100) NOT NULL PRIMARY KEY,
    Password VARCHAR(100) NOT NULL,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    SendNotification BIT,
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID)
)

INSERT INTO UserManagement.dbo.Roles (RoleID,RoleName) VALUES 
(1,'Admin')
,(2,'User')
,(400,'Subscriber')
,(1274,'Manager')
;

INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('aarontravis','P@ssword','Ora Bray','quam@rutrummagna.edu',1,1)
,('abrabarr','P@ssword','Philip Roy','vulputate@vitaeerat.net',0,1274)
,('alanamoore','P@ssword','Destiny Delgado','Integer.mollis@apurusDuis.co.uk',1,400)
,('alanawilkins','P@ssword','Orli Vinson','molestie.tortor.nibh@neque.org',0,1274)
,('amayadunlap','P@ssword','Solomon May','nunc.interdum@ipsumacmi.net',1,400)
,('ashtonduke','P@ssword','Addison Ferrell','Nullam.suscipit.est@lacusQuisque.edu',1,400)
,('augustgarza','P@ssword','Henry Tucker','eu.euismod@ligulaDonecluctus.net',1,400)
,('beaumartinez','P@ssword','Sydney Klein','amet.risus.Donec@quamquisdiam.co.uk',0,2)
,('bradleyray','P@ssword','Magee Walters','et@Nullamfeugiatplacerat.org',1,400)
,('britannimayo','P@ssword','Preston Knowles','nec.urna@Quisque.com',1,1)
;
INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('brittanyleach','P@ssword','Aquila Ayers','malesuada.ut@amet.ca',0,2)
,('calebenglish','P@ssword','Pascale Emerson','rhoncus.Nullam@semut.co.uk',1,1)
,('camdenhyde','P@ssword','Sharon Hoffman','Nam.porttitor.scelerisque@duiCumsociis.com',0,2)
,('cartergarza','P@ssword','Moses Burnett','mauris.erat@gravida.net',1,400)
,('cassadyblair','P@ssword','Lars Hester','nascetur.ridiculus.mus@sollicitudin.co.uk',0,2)
,('ceciliabolton','P@ssword','Nelle Sullivan','dui.Cras.pellentesque@etrutrumeu.net',1,400)
,('cecilialeblanc','P@ssword','Mariko Delgado','viverra.Donec@ipsum.edu',0,2)
,('chantalehill','P@ssword','Amity Stout','purus.Maecenas@Vivamus.co.uk',1,400)
,('charitymaddox','P@ssword','Brendan Luna','lacinia@nullamagna.ca',1,400)
,('charitystrong','P@ssword','Russell Navarro','non@esttemporbibendum.org',1,1)
;
INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('charleshewitt','P@ssword','Zenaida Norton','eget.venenatis.a@lectuspedeultrices.edu',0,1274)
,('chastitycortez','P@ssword','Fitzgerald Yates','vitae.sodales.nisi@nuncinterdum.org',0,2)
,('coopergibson','P@ssword','Ryan Bell','tortor.dictum.eu@diam.edu',0,2)
,('dahliadunlap','P@ssword','Blair Trujillo','odio@nisiaodio.ca',0,1274)
,('dakotamueller','P@ssword','Wayne Mcpherson','lobortis.nisi.nibh@tempus.co.uk',0,1274)
,('deaconsoto','P@ssword','Howard Reilly','Ut.tincidunt.vehicula@aliquetsemut.net',1,1)
,('deannahooper','P@ssword','Margaret Parrish','lectus.quis.massa@rutrumjusto.org',1,400)
,('destinymcintyre','P@ssword','Oprah Calhoun','Donec@elementumdui.org',1,1)
,('dexterbuckley','P@ssword','David Thornton','Duis.mi@risusatfringilla.org',1,1)
,('donovanholmes','P@ssword','Quemby Melendez','Suspendisse.commodo@tempordiam.net',1,1)
;
INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('drewpratt','P@ssword','Tarik Franco','augue.ut.lacus@eratnonummy.com',0,1274)
,('duncanturner','P@ssword','Tyler Chambers','eu@liberodui.net',1,400)
,('eaganfranks','P@ssword','Irene Horton','ipsum@pedenonummy.org',0,2)
,('eltonjoyner','P@ssword','Penelope Curtis','ullamcorper.magna@Etiambibendumfermentum.com',1,1)
,('erasmusbrock','P@ssword','Dylan Hurst','Nulla.interdum.Curabitur@sit.net',0,1274)
,('ericarichardson','P@ssword','Joshua Merritt','Cras.sed@lacusMaurisnon.net',0,2)
,('erichboyer','P@ssword','Celeste Mccray','a@dictummagna.org',1,400)
,('evangelinekirkland','P@ssword','Kato Gaines','in@gravida.ca',0,2)
,('fallonvelez','P@ssword','Kim Castaneda','sit.amet@ProinvelitSed.org',0,2)
,('ferdinandbutler','P@ssword','September Foley','odio.semper@Aliquamnecenim.com',0,2)
;
INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('ferrissharpe','P@ssword','Nissim Kline','orci.tincidunt@nonvestibulumnec.com',1,400)
,('flynnbest','P@ssword','Ariel Langley','Donec@magnaLoremipsum.ca',1,400)
,('georgeosborn','P@ssword','Paula Snow','Aliquam.fringilla@afacilisisnon.edu',1,1)
,('hamiltongallegos','P@ssword','Dominic Fisher','malesuada@Integervitaenibh.co.uk',0,1274)
,('hamishcampbell','P@ssword','Kaseem Figueroa','mollis.Duis.sit@orciquis.org',1,1)
,('hanaedonaldson','P@ssword','Carissa Downs','Mauris.blandit@acfacilisisfacilisis.edu',1,400)
,('hedwigtran','P@ssword','Hop Owen','eleifend@justo.org',1,1)
,('hirokomoran','P@ssword','Gloria Jennings','ultrices@vulputatedui.net',1,1)
,('igorroberson','P@ssword','Camille Bean','dui.nec.tempus@musProinvel.ca',1,400)
,('inanewman','P@ssword','Jasmine Shepard','odio.Etiam@Nullamfeugiat.co.uk',0,1274)
;
INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('ivyprince','P@ssword','Megan Ayers','semper@loremegetmollis.ca',1,400)
,('jadenvelazquez','P@ssword','Jaquelyn Calhoun','dapibus@aliquetPhasellus.edu',0,2)
,('jarrodwilder','P@ssword','Lyle Wilkinson','pharetra@nullaDonecnon.org',1,1)
,('jessaminenolan','P@ssword','Tara Cross','sit@ipsumSuspendissenon.org',1,1)
,('jillianwheeler','P@ssword','Leroy Carr','amet@nullavulputatedui.org',0,1274)
,('jonahcrosby','P@ssword','Julian Alford','Nunc@nulla.ca',1,400)
,('jordenburton','P@ssword','McKenzie Walton','turpis.In.condimentum@etultricesposuere.ca',0,2)
,('justinadelacruz','P@ssword','Linus Guthrie','dolor@Curabitur.net',0,1274)
,('kasimirbarber','P@ssword','Meredith Ingram','accumsan@luctussit.net',0,1274)
,('kyleharvey','P@ssword','Keith Spence','amet.consectetuer@tempusloremfringilla.edu',0,2)
;
INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('lanisampson','P@ssword','Petra Mcgee','pulvinar@diamdictumsapien.net',0,1274)
,('leighgibson','P@ssword','Claudia Gilbert','interdum@venenatisvelfaucibus.com',0,2)
,('loiswolfe','P@ssword','Macaulay William','vel@sitametconsectetuer.net',0,1274)
,('lunealittle','P@ssword','Cora Dalton','Nam.nulla.magna@sedleoCras.org',1,1)
,('lylerussell','P@ssword','Axel Yates','sapien.cursus@orciin.edu',1,400)
,('mailekent','P@ssword','Haviva Guzman','Proin.nisl.sem@diamnuncullamcorper.edu',0,1274)
,('maraalston','P@ssword','Stone Bowen','lorem.tristique.aliquet@elementumloremut.net',1,1)
,('martincash','P@ssword','Buckminster Schroeder','rutrum.eu@ullamcorper.co.uk',0,2)
,('masonglenn','P@ssword','Danielle Hayes','nibh.dolor.nonummy@inhendrerit.com',1,1)
,('meganhancock','P@ssword','Orson Decker','neque.et@pellentesqueegetdictum.edu',0,2)
;
INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('odettegoff','P@ssword','Porter Christensen','eu@telluseuaugue.org',1,1)
,('odysseusgates','P@ssword','Yardley Hughes','massa.Vestibulum@Proinultrices.edu',1,1)
,('pamelaoneill','P@ssword','Tana Wise','velit@nuncsedlibero.co.uk',1,400)
,('pandorahicks','P@ssword','Sloane Lane','amet.faucibus@augue.edu',0,1274)
,('quinochoa','P@ssword','Gretchen Guthrie','justo.sit.amet@amet.ca',0,1274)
,('raegarcia','P@ssword','Aladdin Stanley','euismod@lectussit.co.uk',0,1274)
,('reesetaylor','P@ssword','Debra Booth','et.malesuada@nonnisiAenean.co.uk',0,2)
,('rosemedina','P@ssword','Autumn Mcconnell','nisl.Nulla@ac.org',0,1274)
,('rosepeterson','P@ssword','Jocelyn Mathews','urna.convallis@idlibero.org',1,1)
,('ruthharper','P@ssword','Ifeoma Delgado','eu.tempor.erat@odioAliquam.net',1,1)
;
INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('ryderblair','P@ssword','Willow Snyder','tincidunt@porta.com',1,400)
,('sandrasnyder','P@ssword','Noel Weiss','Morbi.sit.amet@Vivamus.net',0,1274)
,('shadwolf','P@ssword','Knox Price','Proin@quis.net',1,1)
,('shafirabarrera','P@ssword','Griffith Mclean','enim@consequat.ca',0,1274)
,('shanamendez','P@ssword','Cain Roberts','eget@duiCum.net',0,2)
,('silasdorsey','P@ssword','Tobias Rosa','sed.facilisis@Nullamvitae.ca',0,1274)
,('sopolinetravis','P@ssword','Casey Simmons','at@Sedidrisus.ca',1,1)
,('steelmontoya','P@ssword','Orlando Nunez','semper.rutrum@Proinnon.edu',0,2)
,('stephenlangley','P@ssword','Yoko Eaton','at@nequenonquam.com',0,2)
,('susanholloway','P@ssword','Yoshio Porter','sem.consequat@Integervitaenibh.co.uk',1,400)
;
INSERT INTO UserManagement.dbo.Users (Username,Password,FullName,Email,SendNotification,RoleID) VALUES 
('tashyaholland','P@ssword','Alexandra Haley','et.libero@elit.edu',0,2)
,('tobiashester','P@ssword','Jaden Williamson','eu.erat.semper@aliquetodioEtiam.ca',1,400)
,('tyronehaney','P@ssword','Jolene Hess','non.arcu.Vivamus@Donecdignissim.org',1,400)
,('tyronewarner','P@ssword','Kenneth Howell','tincidunt@Nullaegetmetus.co.uk',0,1274)
,('ulrichurley','P@ssword','Quincy Hawkins','gravida.Praesent.eu@pretiumetrutrum.ca',0,1274)
,('vladimirwilcox','P@ssword','Adam Odonnell','ligula.elit.pretium@molestiepharetranibh.net',1,400)
,('walterbuckner','P@ssword','Malik Bray','non.feugiat@loremloremluctus.co.uk',1,1)
,('willowkeller','P@ssword','Juliet Collins','pretium.neque@parturientmontesnascetur.org',0,2)
,('xenahendrix','P@ssword','Daria Shelton','elementum@Etiam.org',0,1274)
,('yolandaglover','P@ssword','Ulric Downs','ac.fermentum.vel@Crasvehicula.co.uk',0,2)
;