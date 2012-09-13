using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
    public class Specialisms
    {
        ApiMedkinect apiMedkinect = new ApiMedkinect();
        public Specialisms() { }

        public string title;
        public string description;
        public int id;


        public Object update_specialism()
        {
            Object result;
            result = apiMedkinect.conexion_rest("put", "api/specialisms", this, this.id);
            return result;
        }

        public Object create_specialism()
        {
            Object result;
            result = apiMedkinect.conexion_rest("post", "api/specialisms", this, 0);
            return result;
        }

        public Object delete_specialism()
        {
            Object result;
            result = apiMedkinect.conexion_rest("delete", "api/specialisms", null, this.id);
            return result;
        }

        public Object get_specialism()
        {
            Object result;
            result = apiMedkinect.conexion_rest("get", "api/specialisms", null, this.id);
            return result;
        }

        public Object get_all_specialism()
        {
            Object result;
            result = apiMedkinect.conexion_rest("getall", "api/specialisms", null, 0);
            return result;
        }
    }
}
