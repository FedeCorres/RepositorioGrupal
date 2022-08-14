use peluquería_canina;

create table perro (id_perro int not null auto_increment,
                    nombre varchar(45) not null,
                    fecha_nac date, 
                    sexo varchar(25) not null, 
                    dni_dueño int not null, 
                    primary key (id_perro), 
                    foreign key(dni_dueño) references dueño(DNI));
                    
insert into dueño values ('37852735', 'Yaco', 'Capdevila', '555789', 'avenida775');

insert into perro values ('002', 'electra', '2018-08-01', 'hembra', '37852735');

SELECT * FROM peluquería_canina.perro;

update perro set fecha_nac = '2018-08-20'
where ID_Perro = 002;







                    
