package com.example.mindmate;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    EditText e1;
    Button b1;
    SharedPreferences sh;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        e1=(EditText)findViewById(R.id.editText3);
        b1=(Button)findViewById(R.id.sendbtn);
        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());

        e1.setText(sh.getString("ip", ""));

        b1.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        String ipaddress=e1.getText().toString();
        String url="http://"+ipaddress+":6500";
        SharedPreferences.Editor ed=sh.edit();
        ed.putString("ip",ipaddress);
        ed.putString("url",url);
        ed.commit();
        Intent i=new Intent(getApplicationContext(),Login.class);
        startActivity(i);
    }
}