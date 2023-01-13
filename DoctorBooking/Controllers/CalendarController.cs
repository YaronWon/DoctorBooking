using Google.Apis.Calendar.v3;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace DoctorBooking.Controllers
{
    public class CalendarController : ApiController
    {
        public string APIkey = "AIzaSyDaAxZAKmOagcroOirXnRvs6RRRRK6a0xg";
        public string CalendarID = "iw.jewish#holiday@group.v.calendar.google.com";

        // GET: api/Calendar
        public IEnumerable<string> Get()
        {
            
            return new string[] { "value1", "value2" };
        }

        // GET: api/Calendar/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Calendar
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Calendar/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Calendar/5
        public void Delete(int id)
        {
        }
    }
}
