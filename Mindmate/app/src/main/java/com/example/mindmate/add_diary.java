package com.example.mindmate;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class add_diary extends AppCompatActivity {

    @Override
    public void onBackPressed() {
        Intent ij=new Intent(getApplicationContext(), View_diary.class);
        startActivity(ij);
    }

    EditText ed_comp;
    Button b;
    SharedPreferences sh;
    String url;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_diary);
        ed_comp=findViewById(R.id.editTextTextPersonName);
        b=findViewById(R.id.button);
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String comp=ed_comp.getText().toString();
                if(comp.equalsIgnoreCase("")){
                    ed_comp.setError("Required");
                }
                else {
                    sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
                    url = sh.getString("url", "") + "/stud_add_diary";

                    RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                    StringRequest postRequest = new StringRequest(Request.Method.POST, url,
                            new Response.Listener<String>() {
                                @Override
                                public void onResponse(String response) {
//                        Toast.makeText(getApplicationContext(), response, Toast.LENGTH_LONG).show();

                                    try {
                                        JSONObject jsonObj = new JSONObject(response);
                                        if (jsonObj.getString("status").equalsIgnoreCase("ok")) {

                                            Toast.makeText(getApplicationContext(), "Content added", Toast.LENGTH_SHORT).show();
                                            Intent ij=new Intent(getApplicationContext(), View_diary.class);
                                            startActivity(ij);

                                        }

                                        else {
                                            Toast.makeText(getApplicationContext(), "Failed", Toast.LENGTH_LONG).show();
                                        }

                                    }    catch (Exception e) {
                                        Toast.makeText(getApplicationContext(), "Error" + e.getMessage().toString(), Toast.LENGTH_SHORT).show();
                                    }
                                }
                            },
                            new Response.ErrorListener() {
                                @Override
                                public void onErrorResponse(VolleyError error) {
                                    // error
                                    Toast.makeText(getApplicationContext(), "eeeee" + error.toString(), Toast.LENGTH_SHORT).show();
                                }
                            }
                    ) {

                        //                value Passing android to python
                        @Override
                        protected Map<String, String> getParams() {
                            SharedPreferences sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
                            Map<String, String> params = new HashMap<String, String>();

                            params.put("lid", sh.getString("lid", ""));
                            params.put("cont", comp);

                            return params;
                        }
                    };


                    int MY_SOCKET_TIMEOUT_MS=100000;

                    postRequest.setRetryPolicy(new DefaultRetryPolicy(
                            MY_SOCKET_TIMEOUT_MS,
                            DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                            DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
                    requestQueue.add(postRequest);
                }
            }
        });
    }
}