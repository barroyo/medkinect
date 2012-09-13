using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
    public class Roles : ApiMedkinect
    {
       
        public Roles() { }

        public int id;
        public string title;
        public string description;
        public string access;

        public Object update_roles()
        {
            return this.conexion_rest("post", "api/roles/#/update", this, this.id);
        }

        public Object create_roles()
        {
            return this.conexion_rest("post", "api/roles/new", this, -1);
        }

        public Object delete_roles()
        {
            return this.conexion_rest("post", "api/roles/#/delete", this, this.id);
        }

        public Object get_roles()
        {
            return this.conexion_rest("get", "api/roles/#", null, this.id);

        }

        public Object get_all_roles()
        {
            return this.conexion_rest("get", "api/roles", null, -1);

        }
    }
}
