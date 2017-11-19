create database Assessment

use Assessment

/*SkillSet Table*/
create table dbo.Skillset
(
  ID INT,
  Skill varchar(50)
  
)

INSERT INTO Skillset(ID,Skill) Values(1,'Dotnet')
INSERT INTO Skillset(ID,Skill) Values(2,'SqlServer')
INSERT INTO Skillset(ID,Skill) Values(3,'Ruby')
INSERT INTO Skillset(ID,Skill) Values(4,'Python')
INSERT INTO Skillset(ID,Skill) Values(5,'Angular')


/*Developers Table*/
create table dbo.Developers
(
 ID INT Identity(1,1),
 DeveloperName varchar(100),
 SkillSet INT
)

INSERT INTO Developers(DeveloperName,SkillSet) Values('Vinay',1)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Hari',1)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Sateesh',1)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Prasad',1)
INSERT INTO Developers(DeveloperName,SkillSet) Values('DP',1)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Santosh',1)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Schisty',1)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Sree',1)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Kavan',1)

INSERT INTO Developers(DeveloperName,SkillSet) Values('Vinay',2)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Hari',2)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Sateesh',2)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Prasad',2)
INSERT INTO Developers(DeveloperName,SkillSet) Values('DP',2)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Himansu',2)

INSERT INTO Developers(DeveloperName,SkillSet) Values('Sateesh',3)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Prasad',3)
INSERT INTO Developers(DeveloperName,SkillSet) Values('DP',3)

INSERT INTO Developers(DeveloperName,SkillSet) Values('Himansu',4)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Sateesh',4)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Prasad',4)

INSERT INTO Developers(DeveloperName,SkillSet) Values('Vinay',5)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Hari',5)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Sateesh',5)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Prasad',5)
INSERT INTO Developers(DeveloperName,SkillSet) Values('Himansu',5)

select * from Developers
select * from Skillset


select 
s.Skill as SkillSet, count(d.SkillSet) as 'SkilledCount',
Developers=STUFF  
(  
     (  
      SELECT DISTINCT ', ' + CAST(DeveloperName AS VARCHAR(MAX))  
       FROM Developers t2   
       WHERE t2.SkillSet = d.SkillSet 
       FOR XML PATH('')  
    
     ),1,1,''  
)  

from skillset s inner join Developers d on d.skillset = s.ID
group by d.SkillSet,s.Skill

/*Stored procedure*/

--usp_SkillAssessment 1,1
Create procedure usp_SkillAssessment

@PageIndex int,
@PageSize int
AS

select 
s.Skill as SkillSet, count(d.SkillSet) as 'SkilledCount',
Developers=STUFF  
(  
     (  
      SELECT DISTINCT ', ' + CAST(DeveloperName AS VARCHAR(MAX))  
       FROM Developers t2   
       WHERE t2.SkillSet = d.SkillSet 
       FOR XML PATH('')  
    
     ),1,1,''  
)  

from skillset s inner join Developers d on d.skillset = s.ID
group by d.SkillSet,s.Skill

GO

