using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
    public class Specialisms : ApiMedkinect
    {
        public Specialisms() { }

        public string title;
        public string description;
        public int id;

        public Object update_specialism()
        {
            return this.conexion_rest("post", "api/specialisms/#/update", this, this.id);
        }

        public Object create_specialism()
        {
            return this.conexion_rest("post", "api/specialisms/new", this, -1);
        }

        public Object delete_specialism()
        {
            return this.conexion_rest("post", "api/specialisms/#/delete", this, this.id);
        }

        public Object get_specialism()
        {
            return this.conexion_rest("get", "api/specialisms/#", null, this.id);

        }

        public Object get_all_specialism()
        {
            return this.conexion_rest("get", "api/specialisms", null, -1);

        }
    }
}
