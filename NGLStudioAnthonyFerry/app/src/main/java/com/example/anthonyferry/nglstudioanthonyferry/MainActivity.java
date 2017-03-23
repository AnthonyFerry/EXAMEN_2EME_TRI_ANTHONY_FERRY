package com.example.anthonyferry.nglstudioanthonyferry;

import android.content.Context;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class MainActivity extends AppCompatActivity {

    EditText editLogin, editPassword;
    Button btnConnect, btnAdd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editLogin = (EditText) findViewById(R.id.editLogin);
        editPassword = (EditText) findViewById(R.id.editPassword);
        btnConnect = (Button) findViewById(R.id.btnConnect);
        btnAdd = (Button) findViewById(R.id.btnAdd);

        btnConnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                signIn();
            }
        });
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                signUp();
            }
        });
    }

    private void signIn()
    {
        String login = editLogin.getText().toString();
        String password = editPassword.getText().toString();

        if (login != "" && password != "")
        {
            Toast.makeText(this, "Patientez ...", Toast.LENGTH_SHORT).show();
            new SignIn(this).execute(login, password);
        } else {
            Toast.makeText(this, "Veuillez remplir tous les champs.", Toast.LENGTH_SHORT).show();
        }
    }

    private void signUp()
    {
        String login = editLogin.getText().toString();
        String password = editPassword.getText().toString();

        if (login != "" && password != "")
        {
            Toast.makeText(this, "Patientez ...", Toast.LENGTH_SHORT).show();
            new SignUp(this).execute(login, password);
        } else {
            Toast.makeText(this, "Veuillez remplir tous les champs.", Toast.LENGTH_SHORT).show();
        }
    }
}

