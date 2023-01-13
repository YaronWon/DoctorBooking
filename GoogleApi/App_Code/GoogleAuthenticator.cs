using Google.Apis.Auth.OAuth2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using Google.Apis.Util;
using Google.Apis.Gmail.v1;
using Google.Apis.Calendar.v3;
using Google.Apis.Services;
using Google.Apis.Calendar.v3.Data;
using System.Threading.Tasks;
using GoogleApi.GoogleCalendarApi;

namespace GoogleApi
{
    public class GoogleAuthenticator
    {
        protected GoogleAuthenticator()
        {

        }

       

        public static async Task<Event> Createcalendar(CalendarEvent request)
        {
            Main M = new Main();
            string[] scopes = { "https://www.googleapis.com/auth/calendar.events"};
            string ApplicationName = "Google Calendar API";
           
            var Credentials = GoogleWebAuthorizationBroker.AuthorizeAsync(
                new ClientSecrets
                {

                    ClientId = M.clientid,
                    ClientSecret = M.clientsecert,
                },
                 scopes, "user", CancellationToken.None).Result;

            if (Credentials.Token.IsExpired(SystemClock.Default))
                Credentials.RefreshTokenAsync(CancellationToken.None).Wait();


            var service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = Credentials,
                ApplicationName = ApplicationName,
            });

            Event eventCalendar = new Event()
            {
                Summary = request.Description,
                Location = request.Location,
                Start = new EventDateTime
                {
                    DateTime = request.StartDate,
                    TimeZone = "Asia/Jerusalem"
                },

                End = new EventDateTime
                {
                    DateTime = request.EndDate,
                    TimeZone = "Asia/Jerusalem"
                },

                //Description = request.Description,
            };

            var EventRequest = service.Events.Insert(eventCalendar, "Primary");
            var requestCreate =  await EventRequest.ExecuteAsync();

            //var profile = service.Users.GetProfile("yaron712@gmail.com").Execute();

            //Console.WriteLine(profile.MessagesTotal);

            //Console.ReadLine();

            return requestCreate;
        }

        /* "https://www.googleapis.com/auth/gmail.modify" 

      var service = new GmailService(new BaseClientService.Initializer()

       {
           HttpClientInitializer = Credentials
       }); */
    }
}