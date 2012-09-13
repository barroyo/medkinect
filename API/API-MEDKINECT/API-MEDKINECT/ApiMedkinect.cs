using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;


namespace API_MEDKINECT
{
    public class ApiMedkinect
    {
        public ApiMedkinect(){     
           
        }


        public String  conexion_rest(string type_request,string controller,object jsonObject,int id)
        {
            string json = JsonConvert.SerializeObject(jsonObject);
            string host = "http://50.16.103.99/";
            HttpWebRequest request;
            string id_send = id == -1? "" : id.ToString(); ;
            controller = controller.Replace("#", id_send.ToString());
            request = (HttpWebRequest)WebRequest.Create(host + controller);
            if (type_request == "post")
            {
                request.Method = WebRequestMethods.Http.Post;
                byte[] data = Encoding.UTF8.GetBytes(json);
                StreamWriter postStream = new StreamWriter(request.GetRequestStream(), System.Text.Encoding.ASCII);
                postStream.Write(json);
                postStream.Close();
            }
            if (type_request == "get")
            {
                request.Method = WebRequestMethods.Http.Get;
            }

            request.Headers.Add("Authorization", "Token token=\"b0b4a3f528b6a80ca45d66248b75540d\"");
            request.ContentType = "application/json";
            request.Accept = "application/json";
            
            try
            {
                System.Net.ServicePointManager.Expect100Continue = false;
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                StreamReader sr = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
                json = sr.ReadToEnd();
            }
            catch (Exception e)
            {
                return e.Message;
            }

            return JsonConvert.DeserializeObject(json).ToString(); 
 
   

        }

    }
}
