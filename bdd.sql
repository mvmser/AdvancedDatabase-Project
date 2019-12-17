#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Production_cost
#------------------------------------------------------------

CREATE TABLE Production_cost(
        ProductionCostID    Int  Auto_increment  NOT NULL ,
        FixedCostProduction Float NOT NULL ,
        CostDistrubution    Float NOT NULL
	,CONSTRAINT Production_cost_PK PRIMARY KEY (ProductionCostID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Customer
#------------------------------------------------------------

CREATE TABLE Customer(
        CustomerID      Int  Auto_increment  NOT NULL ,
        NameCustomer    Varchar (50) NOT NULL ,
        SurnameCustomer Varchar (50) NOT NULL ,
        AgeCustomer     Int NOT NULL ,
        StatutCustomer  Varchar (2) NOT NULL
	,CONSTRAINT Customer_PK PRIMARY KEY (CustomerID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Network
#------------------------------------------------------------

CREATE TABLE Network(
        NetworkID Int  Auto_increment  NOT NULL
	,CONSTRAINT Network_PK PRIMARY KEY (NetworkID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Company
#------------------------------------------------------------

CREATE TABLE Company(
        CompanyID     Int  Auto_increment  NOT NULL ,
        CompanyBudget Float NOT NULL ,
        NetworkID     Int NOT NULL
	,CONSTRAINT Company_PK PRIMARY KEY (CompanyID)

	,CONSTRAINT Company_Network_FK FOREIGN KEY (NetworkID) REFERENCES Network(NetworkID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Show
#------------------------------------------------------------

CREATE TABLE Show(
        ShowID           Int  Auto_increment  NOT NULL ,
        NameShow         Varchar (2) NOT NULL ,
        CompanyID        Int NOT NULL ,
        ProductionCostID Int NOT NULL
	,CONSTRAINT Show_PK PRIMARY KEY (ShowID)

	,CONSTRAINT Show_Company_FK FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
	,CONSTRAINT Show_Production_cost0_FK FOREIGN KEY (ProductionCostID) REFERENCES Production_cost(ProductionCostID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Theater
#------------------------------------------------------------

CREATE TABLE Theater(
        TheaterID              Int  Auto_increment  NOT NULL ,
        TheaterName            Varchar (50) NOT NULL ,
        TheaterCountry         Varchar (50) NOT NULL ,
        TheaterCity            Varchar (50) NOT NULL ,
        TheaterAddress         Varchar (50) NOT NULL ,
        PerformanceHallTheater Varchar (50) NOT NULL ,
        TheaterFixedCapacity   Float NOT NULL ,
        TheaterBalance         Float NOT NULL ,
        CompanyID              Int NOT NULL
	,CONSTRAINT Theater_PK PRIMARY KEY (TheaterID)

	,CONSTRAINT Theater_Company_FK FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Grant
#------------------------------------------------------------

CREATE TABLE Grant(
        GrantID        Int  Auto_increment  NOT NULL ,
        GrantAgency    Varchar (50) NOT NULL ,
        GrantBeginDate Date NOT NULL ,
        GrantEndDate   Date NOT NULL ,
        GrantAmount    Float NOT NULL ,
        TheaterID      Int NOT NULL
	,CONSTRAINT Grant_PK PRIMARY KEY (GrantID)

	,CONSTRAINT Grant_Theater_FK FOREIGN KEY (TheaterID) REFERENCES Theater(TheaterID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Representation
#------------------------------------------------------------

CREATE TABLE Representation(
        RepresentationID         Int  Auto_increment  NOT NULL ,
        DateRepresentation       Date NOT NULL ,
        TravelCostRepresentation Float NOT NULL ,
        ShowID                   Int NOT NULL ,
        TheaterID                Int NOT NULL
	,CONSTRAINT Representation_PK PRIMARY KEY (RepresentationID)

	,CONSTRAINT Representation_Show_FK FOREIGN KEY (ShowID) REFERENCES Show(ShowID)
	,CONSTRAINT Representation_Theater0_FK FOREIGN KEY (TheaterID) REFERENCES Theater(TheaterID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ticket
#------------------------------------------------------------

CREATE TABLE Ticket(
        TicketID            Int  Auto_increment  NOT NULL ,
        PriceTicket         Float NOT NULL ,
        TicketReferenceRate Varchar (50) NOT NULL ,
        DateSaleTicket      Date NOT NULL ,
        TheaterID           Int NOT NULL ,
        CustomerID          Int NOT NULL ,
        RepresentationID    Int NOT NULL
	,CONSTRAINT Ticket_PK PRIMARY KEY (TicketID)

	,CONSTRAINT Ticket_Theater_FK FOREIGN KEY (TheaterID) REFERENCES Theater(TheaterID)
	,CONSTRAINT Ticket_Customer0_FK FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
	,CONSTRAINT Ticket_Representation1_FK FOREIGN KEY (RepresentationID) REFERENCES Representation(RepresentationID)
)ENGINE=InnoDB;

