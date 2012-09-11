using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
     public  class Calendars
        {
            ApiMedkinect apiMedkinect = new ApiMedkinect();
            public Calendars() { }

            public int id;
            public int user_id;
            public int patient_id;
            public DateTime date;
            public string date_type;
            public string result;
            public string status;
          

            public Object update_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("put", "api/calendars", this, this.id);
                return result;
            }

            public Object create_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("post", "api/calendars", this, 0);
                return result;
            }

            public Object delete_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("delete", "api/calendars", null, this.id);
                return result;
            }

            public Object get_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("get", "api/calendars", null, this.id);
                return result;
            }

            public Object get_all_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("getall", "api/calendars", null, 0);
                return result;
            }
        }
}
