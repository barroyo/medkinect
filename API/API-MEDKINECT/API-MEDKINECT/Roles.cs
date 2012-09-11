using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
    public class Roles 
    {
        ApiMedkinect apiMedkinect = new ApiMedkinect();
        public Roles() { }

        public int id;
        public string title;
        public string description;
        public string e;
        public string access;
        public int user_id;


        public Object update_roles()
        {
            Object result;
            result = apiMedkinect.conexion_rest("put", "api/roles", this, this.id);
            return result;
        }

        public Object create_roles()
        {
            Object result;
            result = apiMedkinect.conexion_rest("post", "api/roles", this, 0);
            return result;
        }

        public Object delete_roles()
        {
            Object result;
            result = apiMedkinect.conexion_rest("delete", "api/roles", null, this.id);
            return result;
        }

        public Object get_roles()
        {
            Object result;
            result = apiMedkinect.conexion_rest("get", "api/roles", null, this.id);
            return result;
        }

        public Object get_all_roles()
        {
            Object result;
            result = apiMedkinect.conexion_rest("getall", "api/roles", null, 0);
            return result;
        }
    }
}
