package com.example.mindmate;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

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

public class custom_motivation extends BaseAdapter {

    private Context context;
    String[] id, date, title, staff, cont;

    public custom_motivation(Context applicationContext, String[] id, String[] date, String[] title, String[] staff, String[] cont) {
        this.context=applicationContext;
        this.id=id;
        this.date=date;
        this.title=title;
        this.staff=staff;
        this.cont=cont;
    }


    @Override
    public int getCount() {
        return id.length;
    }

    @Override
    public Object getItem(int i) {
        return null;
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        LayoutInflater inflator=(LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View gridView;
        if(view==null)
        {
            gridView=new View(context);
            //gridView=inflator.inflate(R.layout.customview, null);
            gridView=inflator.inflate(R.layout.custom_motivation,null);//same class name

        }
        else
        {
            gridView=(View)view;

        }
        TextView tv=(TextView)gridView.findViewById(R.id.textView);
        TextView tv2=(TextView)gridView.findViewById(R.id.textView3);
        TextView tv3=(TextView)gridView.findViewById(R.id.textView5);


        tv2.setTextColor(Color.BLACK);
        tv3.setTextColor(Color.BLACK);


        tv.setText(date[i]);
        tv2.setText(title[i]);
        tv3.setText(staff[i]);


        TextView tv4=(TextView)gridView.findViewById(R.id.textView14);
        tv4.setTag(i);
        tv4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                int pos=(int)view.getTag();
                SharedPreferences sh = PreferenceManager.getDefaultSharedPreferences(context);
                String url = sh.getString("url", "") + cont[pos];
                Intent ij = new Intent(Intent.ACTION_VIEW);
                ij.setData(Uri.parse(url));
                ij.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(ij);

            }
        });



        return gridView;
    }
}

