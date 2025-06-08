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
import android.widget.TextView;

public class custom_booking extends BaseAdapter {

    private Context context;
    String[] id, booked_on, sched, staff, meetlink;

    public custom_booking(Context applicationContext, String[] id, String[] booked_on, String[] sched, String[] staff, String[] meetlink) {
        this.context=applicationContext;
        this.id=id;
        this.booked_on=booked_on;
        this.sched=sched;
        this.staff=staff;
        this.meetlink=meetlink;
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
            gridView=inflator.inflate(R.layout.custom_booking,null);//same class name

        }
        else
        {
            gridView=(View)view;

        }
        TextView tv=(TextView)gridView.findViewById(R.id.textView);
        TextView tv2=(TextView)gridView.findViewById(R.id.textView3);
        TextView tv3=(TextView)gridView.findViewById(R.id.textView5);
        TextView tv4=(TextView)gridView.findViewById(R.id.textView14);


        tv2.setTextColor(Color.BLACK);
        tv3.setTextColor(Color.BLACK);

        if(meetlink[i].equalsIgnoreCase("pending"))
        {
            tv4.setTextColor(Color.BLACK);
            tv4.setEnabled(false);
        }

        tv.setText(booked_on[i]);
        tv2.setText(staff[i]);
        tv3.setText(sched[i]);
        tv4.setText(meetlink[i]);


        tv4.setTag(i);
        tv4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                int pos=(int)view.getTag();
                String url = meetlink[pos];
                Intent ij = new Intent(Intent.ACTION_VIEW);
                ij.setData(Uri.parse(url));
                ij.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(ij);

            }
        });



        return gridView;
    }
}

