using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
     public  class Calendars : ApiMedkinect
        {
            public Calendars() { }

            public int id;
            public int user_id;
            public int patient_id;
            public DateTime date;
            public string date_type;
            public string result;
            public string status;
            public string diagnostic;


            public Object update_calendars()
            {
                return this.conexion_rest("post", "api/calendars/#/update", this, this.id);
            }

            public Object create_calendars()
            {
                return this.conexion_rest("post", "api/calendars/new", this, -1);
            }

            public Object delete_calendars()
            {
                return this.conexion_rest("post", "api/calendars/#/delete", this, this.id);
            }

            public Object get_calendars()
            {
                return this.conexion_rest("get", "api/calendars/#", null, this.id);

            }

            public Object get_all_calendars()
            {
                return this.conexion_rest("get", "api/calendars", null, -1);

            }
            public Object get_by_user()
            {
                return this.conexion_rest("get", "api/calendars/user/#", this, this.user_id);

            }
        }
}
