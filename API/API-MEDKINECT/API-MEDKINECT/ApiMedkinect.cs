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


        public object  conexion_rest(string type_request,string controller,object jsonObject,int id)
        {
            string json = JsonConvert.SerializeObject(jsonObject);
            string host = "http://50.16.103.99/";
            HttpWebRequest request;
            object json_respond;

            request = (HttpWebRequest)WebRequest.Create(host + controller );
            
            if (type_request == "post")
            {
                request.Method = WebRequestMethods.Http.Post;
                byte[] data = Encoding.UTF8.GetBytes(json);
                request.ContentLength = data.Length;
                request.ContentType = "application/json";
                request.Accept = "application/json";
                StreamWriter postStream = new StreamWriter(request.GetRequestStream(), System.Text.Encoding.ASCII);
                postStream.Write(json);
                postStream.Close();
            }
            if (type_request == "get")
            {
                request = (HttpWebRequest)WebRequest.Create(host + controller+ "/"+id );
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
                string html = sr.ReadToEnd();

                json_respond = JsonConvert.DeserializeObject(html);
            }
            catch (Exception e)
            {
                return e.Message;
            }

           return json_respond;
 
   

        }

    }
}
