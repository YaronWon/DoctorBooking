using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoogleApi.GoogleCalendarApi
{
    public class Calendar
    {
       public virtual string Id { get; set; }

        public virtual string Title { get; set; }

        public virtual string Description { get; set; }

        public virtual string Location { get; set; }
    }
}