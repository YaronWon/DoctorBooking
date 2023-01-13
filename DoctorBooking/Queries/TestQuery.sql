--select Customer.FirstName,Customer.LastName,Appointment.AppointmentDate, Appointment.StartTime,Appointment.EndTime from Appointment inner join Customer on 
--Appointment.CustomerID = Customer.IdCard where Appointment.CustomerID = Customer.IdCard;

--select Customer.IdCard , Customer.FirstName , Customer.LastName , Customer.DateOfBirth , Customer.Gender , Customer.UserName from
--Customer ;