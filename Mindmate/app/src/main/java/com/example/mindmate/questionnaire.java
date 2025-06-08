package com.example.mindmate;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
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

public class questionnaire extends AppCompatActivity {

    @Override
    public void onBackPressed() {
        Intent ij=new Intent(getApplicationContext(), Student_home.class);
        startActivity(ij);
    }

    private TextView questionText;
    private RadioGroup optionsGroup;
    Button b;
    SharedPreferences sh;
    String url;
    TextView tv;

    private int currentQuestionIndex = 0;
    private String[] questions = {
            "Little interest or pleasure in doing things",
            "Feeling down, depressed or hopeless",
            "Trouble falling or staying asleep, or sleeping too much",
            "Feeling tired or having little energy",
            "Poor appetite",
            "Feeling bad about yourself or that you are a failure",
            "Trouble concentrating on things",
            "Moving or speaking so slowly that other people could have noticed",
            "Thoughts that you would be better off dead, or of hurting yourself"
    };

    private void loadQuestion() {
        // Set the question text
        questionText.setText(questions[currentQuestionIndex]);

        // Clear previous selection
        optionsGroup.clearCheck();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_questionnaire);
        sh=PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        questionText = findViewById(R.id.question_text);
        optionsGroup = findViewById(R.id.options_group);
        tv = findViewById(R.id.textView17);
        tv.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(), "Questionnaire skipped", Toast.LENGTH_SHORT).show();
                Intent ij=new Intent(getApplicationContext(), Student_home.class);
                startActivity(ij);
            }
        });

        loadQuestion();

        b=findViewById(R.id.next_button);
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (currentQuestionIndex < questions.length - 1) {
                    int selectedOptionId = optionsGroup.getCheckedRadioButtonId();
                    RadioButton selectedRadioButton = findViewById(selectedOptionId);
                    String selectedOptionText = selectedRadioButton.getText().toString();
                    int q_scr=0;
                    if(selectedOptionText.equalsIgnoreCase("Not at all")){
                        q_scr=0;
                    } else if(selectedOptionText.equalsIgnoreCase("Several days")){
                        q_scr=1;
                    } else if(selectedOptionText.equalsIgnoreCase("More than half the days")){
                        q_scr=2;
                    } else if(selectedOptionText.equalsIgnoreCase("Nearly every day")){
                        q_scr=3;
                    }
                    String scr=sh.getString("quest_score", "");
                    SharedPreferences.Editor ed = sh.edit();
                    ed.putString("quest_score", Integer.parseInt(scr)+q_scr+"");
                    ed.commit();
                    currentQuestionIndex++;
                    loadQuestion();
                } else {
                    sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
                    url = sh.getString("url", "") + "/and_insert_score";

                    RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                    StringRequest postRequest = new StringRequest(Request.Method.POST, url,
                            new Response.Listener<String>() {
                                @Override
                                public void onResponse(String response) {
//                        Toast.makeText(getApplicationContext(), response, Toast.LENGTH_LONG).show();

                                    try {
                                        JSONObject jsonObj = new JSONObject(response);
                                        if (jsonObj.getString("status").equalsIgnoreCase("ok")) {

                                            Toast.makeText(getApplicationContext(), "Questionnaire completed", Toast.LENGTH_SHORT).show();
                                            Intent ij=new Intent(getApplicationContext(), Student_home.class);
                                            startActivity(ij);
                                            finish();
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
                            params.put("score", sh.getString("quest_score", ""));

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