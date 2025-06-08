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

public class custom_schedule extends BaseAdapter {

    private Context context;
    String[] date, staff, sched;

    public custom_schedule(Context applicationContext, String[] date, String[] staff, String[] sched) {
        this.context=applicationContext;
        this.date=date;
        this.staff=staff;
        this.sched=sched;
    }


    @Override
    public int getCount() {
        return date.length;
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
            gridView=inflator.inflate(R.layout.custom_schedule,null);//same class name

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
        tv2.setText(staff[i]);
        tv3.setText(sched[i]);



        return gridView;
    }
}

