USE [master]
GO
CREATE DATABASE Proyecto1PWA
GO
USE Proyecto1PWA
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Se crean las tablas
CREATE TABLE Usuario(
IDU int IDENTITY (1,1) NOT NULL,
Nombre varchar(50) NOT NULL,
Correo varchar(50) NOT NULL,
Contrase�a varchar(500) NOT NULL,
CONSTRAINT [PK_IDU]PRIMARY KEY CLUSTERED
(
IDU ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Compra(
IDC int IDENTITY (1,1) NOT NULL,
Total float NOT NULL,
IDU int NOT NULL,
CONSTRAINT [PK_IDC] PRIMARY KEY CLUSTERED 
(
IDC ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Viaje(
IDV int IDENTITY (1,1) NOT NULL,
Origen varchar(max) NOT NULL,
Destino varchar(max) NOT NULL,
Fecha datetime NOT NULL,
Regreso datetime NOT NULL,
Adulto int NOT NULL,
Infante int NOT NULL,
Ni�o int NOT NULL,	
Clase varchar(max) NOT NULL,
Precio float NOT NULL,
IDC int NOT NULL,
CONSTRAINT [PK_IDV] PRIMARY KEY CLUSTERED 
(
IDV ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--Se coloca el formato de la fecha
set dateformat dmy;

--Crea las llaves foraneas y las vincula
ALTER TABLE Compra  WITH CHECK ADD  CONSTRAINT [FK_Compra_Usuario] FOREIGN KEY(IDU)
REFERENCES Usuario (IDU)
GO
ALTER TABLE Compra CHECK CONSTRAINT [FK_Compra_Usuario]
GO

ALTER TABLE Viaje  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Compra] FOREIGN KEY(IDC)
REFERENCES Compra (IDC)
GO
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Compra]
GO


