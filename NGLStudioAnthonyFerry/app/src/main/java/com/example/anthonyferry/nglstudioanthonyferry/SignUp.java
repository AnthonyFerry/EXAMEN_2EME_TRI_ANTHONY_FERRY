package com.example.anthonyferry.nglstudioanthonyferry;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * Created by Anthony FERRY on 23/03/2017.
 */

public class SignUp extends AsyncTask<String, Void, String> {


    private Context context;

    public SignIn(Context context)
    {
        this.context = context;
    }

    protected void onPreExecute() {
        // Rien ici
    }

    @Override
    protected String doInBackground(String... arg0) {
        String login = arg0[0];
        String password = arg0[1];

        String link;
        String data;
        BufferedReader bufferedReader;
        String result;



        try {
            data = "?login=" + URLEncoder.encode(login, "UTF-8");
            data += "&password=" + URLEncoder.encode(password, "UTF-8");

            link = "http://10.0.2.2/nglstudio/insert_user.php" + data;


            URL url = new URL(link.toString());
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));

            result = bufferedReader.readLine();


            return result;
        } catch (Exception e) {
            Log.d("Erreur", e.getMessage());
            return new String("Exception: " + e.getMessage());
        }
    }

    @Override
    protected void onPostExecute(String result) {
        String jsonStr = result;

        if (jsonStr != null)
        {
            try {

                JSONObject jsonObj = new JSONObject(jsonStr);
                String query_result = jsonObj.getString("query_result");

                if (query_result.equals("TRUE")) {
                    Toast.makeText(context, "Ajouté", Toast.LENGTH_SHORT).show();
                } else if (query_result.equals("FALSE")) {
                    Toast.makeText(context, "Pas ajouté", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(context, "Pas de connexion", Toast.LENGTH_SHORT).show();
                }

            } catch (JSONException e) {
                e.printStackTrace();
                Toast.makeText(context, "Erreur lors de l'interprétation des données", Toast.LENGTH_SHORT).show();
            }
        } else {
            Toast.makeText(context, "Erreur de données", Toast.LENGTH_SHORT).show();
        }
    }
}
