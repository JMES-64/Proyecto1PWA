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
Contraseņa varchar(50) NOT NULL,
CONSTRAINT [PK_IDU]PRIMARY KEY CLUSTERED
(
IDU ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE Compra(
IDC int IDENTITY (1,1) NOT NULL,
Total int NOT NULL,
IDU int NOT NULL,
CONSTRAINT [PK_IDC] PRIMARY KEY CLUSTERED 
(
IDC ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Viaje(
IDV int IDENTITY (1,1) NOT NULL,
NombreV varchar(50) NOT NULL,
Descripcion varchar(50) NOT NULL,
IDC int NOT NULL,
Precio int NOT NULL,
Fecha datetime NOT NULL,
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