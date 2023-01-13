using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoogleApi.GoogleCalendarApi
{
    public class CalendarEvent
    {
        public string id { get; set; }
        public string Calendarid { get; set; }
        public string Title { get; set; }
        public string Location { get; set; }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public IEnumerable<string> Attendees { get; set; }
        public int ColorId { get; set; }
    }
}