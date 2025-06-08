package com.example.mindmate;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;



import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy;
import android.preference.PreferenceManager;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

@TargetApi(Build.VERSION_CODES.GINGERBREAD)
public class Test extends Activity {

	
	String lastid="0";

	
	MessagesAdapter adapterMessages;
	ListView listMessages;
	Button   bt1;
	EditText edtxttosent;
	Handler hnd;
	Runnable ad;
	
	String [] date,msg,type,mid;
	String lid="";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_test);
		
		
		SharedPreferences sh=PreferenceManager.getDefaultSharedPreferences(getApplicationContext());

		lid=sh.getString("lid", "");
		
		hnd=new Handler();




		listMessages= (ListView)findViewById(R.id.list_chat);
		bt1= (Button) findViewById(R.id.button_chat_send);
		adapterMessages = new MessagesAdapter(Test.this);
		edtxttosent=(EditText)findViewById(R.id.input_chat_message);
		// Enable auto scroll
		listMessages.setTranscriptMode(ListView.TRANSCRIPT_MODE_ALWAYS_SCROLL);
		listMessages.setStackFromBottom(true);
		bt1.setOnClickListener(new View.OnClickListener() {
		@Override
		public void onClick(View arg0) {
			
			if(arg0==bt1)
		{
				{

		SharedPreferences sh=PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
		String ip=sh.getString("url", "");

					String url = ip + "/add_chat";
			
			RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());

			StringRequest postRequest = new StringRequest(Request.Method.POST, url,
		            new Response.Listener<String>()
		            {
		                @Override
		                public void onResponse(String response) {

		                    // response
		                    try {
		                        JSONObject jsonObj = new JSONObject(response);
		                        String sucs=   jsonObj.getString("status");
		                        if(sucs.equalsIgnoreCase("ok"))
		                        {
		                            edtxttosent.setText("");
		                        }
		                        


		                    } catch (Exception e) {
		                        Toast.makeText(getApplicationContext(),"Error"+e.getMessage().toString(),Toast.LENGTH_SHORT).show();
		                    }
		                }
		            },
		            new Response.ErrorListener()
		            {
		                @Override
		                public void onErrorResponse(VolleyError error) {
		                    // error
		                    Toast.makeText(getApplicationContext(),"eeeee"+error.toString(),Toast.LENGTH_SHORT).show();
		                }
		            }
		    ) {
		        @Override
		        protected Map<String, String> getParams()
		        {
		      
		       	
		            SharedPreferences sh=PreferenceManager.getDefaultSharedPreferences(getApplicationContext());

		            Map<String, String>  params = new HashMap<String, String>();
		            params.put("lid", lid);
		            params.put("toid", sh.getString("tid", ""));
		            params.put("message", edtxttosent.getText().toString());
			          
		                      
		             return params;
		        }
		    };

		    requestQueue.add(postRequest);
		}
		}	
		}
		});
		
		
		
		ad=new Runnable() {
			@Override
			public void run() {
				SharedPreferences sh=PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
				String ip=sh.getString("url", "");
				String url = ip + "/view_chat";
				RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
			        StringRequest postRequest = new StringRequest(Request.Method.POST, url,
			                new Response.Listener<String>()
			                {
			                    @Override
			                    public void onResponse(String response) {

//			                        Toast.makeText(getApplicationContext(),response,Toast.LENGTH_SHORT).show();
			                        

			                        // response
			                        try {
			                            JSONObject jsonObj = new JSONObject(response);
			                            String sucs=   jsonObj.getString("status");
			                            if(sucs.equalsIgnoreCase("ok"))
			                            {
			                              

			                            	JSONArray jsa=jsonObj.getJSONArray("data");
			                            	
			                            	date=new String[jsa.length()];
			                            	msg=new String[jsa.length()];
			                            	type=new String[jsa.length()];
			                            	mid=new String[jsa.length()];
			                            	
			                            	for(int i=0;i<jsa.length();i++)
			                            	{
			                            		JSONObject jsob=jsa.getJSONObject(i);
			                            		date[i]=jsob.getString("date");
			                            		msg[i]=jsob.getString("chat");
			                            		type[i]=jsob.getString("type");
			                            		mid[i]=jsob.getString("id");
			                            		lastid=mid[i];
			                            		
			                            		if(type[i].equalsIgnoreCase("student"))
			    					    		{
													ChatMessage	message1 = new ChatMessage();
													message1.setUsername("Me");
													message1.setMessage(msg[i]);
													message1.setDate(date[i]);
													message1.setIncomingMessage(false);
													adapterMessages.add(message1);

			    					    		}
			    					    		else
			    					    		{
													ChatMessage	message = new ChatMessage();
													message.setUsername("Tutor");
													message.setMessage(msg[i]);
													message.setDate(date[i]);
													message.setIncomingMessage(true);
													adapterMessages.add(message);
			    					    		}
			    								listMessages.setAdapter(adapterMessages);

			                            	}
			                            	
			                                 }
			                        } catch (Exception e) {
			                        	 Toast.makeText(getApplicationContext(),"eeeee"+e.toString(),Toast.LENGTH_LONG).show();
			                       }
			                    }
			                },
			                new Response.ErrorListener()
			                {
			                    @Override
			                    public void onErrorResponse(VolleyError error) {
			                        // error
			                        Toast.makeText(getApplicationContext(),"eeeee"+error.toString(),Toast.LENGTH_SHORT).show();
			                    }
			                }
			        ) {
			            @Override
			            protected Map<String, String> getParams()
			            {
			                SharedPreferences sh=PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
			                Map<String, String>  params = new HashMap<String, String>();
			                params.put("lid", lid);
							params.put("toid", sh.getString("tid", ""));
			                params.put("lastid", lastid);
				              
			                return params;
			            }
			        };

			        requestQueue.add(postRequest);

				hnd.postDelayed(ad, 2000);
			}
		};
	
	
		hnd.post(ad);	
	
	
	}
	
	@SuppressLint("NewApi")
	@Override
	public void onBackPressed() {
		// TODO Auto-generated method stub
		
		hnd.removeCallbacks(ad);
		SharedPreferences sh=PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
		Editor edt= sh.edit();
    	edt.putString("lastid", "0");
    	edt.commit();
    	lastid="0";
		super.onBackPressed();
	}

}
