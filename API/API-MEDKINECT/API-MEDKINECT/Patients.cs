using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
     public  class Patients
        {
            ApiMedkinect apiMedkinect = new ApiMedkinect();
            public Patients() { }

            public int id;
            public string firstname;
            public string lastname;
            public string dni;
            public string birthdate;
            public string blood_id;
            public string historical_id;
            public string sex;
            public string marital_status;
            public string address;
            public string mobile;
            public string phone;
            public string weight;
            public string height;

            public Object update_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("put", "api/patients", this, this.id);
                return result;
            }

            public Object create_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("post", "api/patients", this, 0);
                return result;
            }

            public Object delete_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("delete", "api/patients", null, this.id);
                return result;
            }

            public Object get_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("get", "api/patients", null, this.id);
                return result;
            }

            public Object get_all_patients()
            {
                Object result;
                result = apiMedkinect.conexion_rest("getall", "api/patients", null, 0);
                return result;
            }
        }
}
