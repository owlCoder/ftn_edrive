DROP TABLE radproj;
DROP TABLE projekat;
DROP TABLE radnik;

CREATE TABLE radnik(
	 Mbr integer NOT NULL,
	 Ime varchar(20) NOT NULL,
	 Prz varchar(25) NOT NULL,
     	 Sef integer,
	 Plt decimal(10, 2),
     	 Pre decimal(6, 2),
	 God date NOT NULL,
	 CONSTRAINT radnik_PK PRIMARY KEY (Mbr),
	 CONSTRAINT radnik_FK FOREIGN KEY (Sef) REFERENCES Radnik (Mbr),
     	 CONSTRAINT radnik_CH CHECK (Plt>500) 
);


CREATE TABLE projekat
	(
	 Spr integer not null,
	 Ruk integer not null,
	 Nap varchar(30),
	 Nar varchar(30),
	 CONSTRAINT projekat_PK PRIMARY KEY (Spr),
	 CONSTRAINT projekat_FK FOREIGN KEY (Ruk) REFERENCES Radnik (Mbr),
     	 CONSTRAINT projekat_UK UNIQUE (Nap)
);


CREATE TABLE radproj
	(
	 rpId integer NOT NULL, -- surogatni ključ, uveden sa ciljem da se izbegne kompozitni ključ MBR+SPR
	 Spr integer NOT NULL,
	 Mbr integer NOT NULL,
	 Brc integer NOT NULL,
	 CONSTRAINT radproj_PK PRIMARY KEY (rpId),
	 CONSTRAINT radproj_rad_FK FOREIGN KEY (Mbr) REFERENCES radnik(Mbr),
	 CONSTRAINT radproj_prj_FK FOREIGN KEY (Spr) REFERENCES projekat(Spr)
);
