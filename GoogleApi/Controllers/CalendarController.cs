using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using Microsoft.AspNetCore.Http;
using GoogleApi.GoogleCalendarApi;

namespace GoogleApi
{
    [Route("api/[Controller]")]
    public class CalendarController : ApiController
    {
        [HttpPost]
        public async Task<IActionResult> CreateCalendar([FromBody] CalendarEvent request)
        {
            return (IActionResult)Ok(await GoogleAuthenticator.Createcalendar(request));
        }
    }
}
