using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
     public  class Patients : ApiMedkinect
        {
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
                return this.conexion_rest("post", "api/patients/#/update", this, this.id);
            }

            public Object create_patients()
            {
                return this.conexion_rest("post", "api/patients/new", this, -1);
            }

            public Object delete_patients()
            {
                return this.conexion_rest("post", "api/patients/#/delete", this, this.id);
            }

            public Object get_patients()
            {
                return this.conexion_rest("get", "api/patients/#", null, this.id);

            }

            public Object get_all_patients()
            {
                return this.conexion_rest("get", "api/patients", null, -1);

            }
        }
}
