package com.example.mindmate;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.MenuItem;
import android.view.View;
import android.view.Menu;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.Toast;

import com.google.android.material.snackbar.Snackbar;
import com.google.android.material.navigation.NavigationView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.appcompat.app.AppCompatActivity;

import com.example.mindmate.databinding.ActivityStudentHomeBinding;

public class Student_home extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener {

Button b;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_student_home);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);


        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        NavigationView navigationView = findViewById(R.id.nav_view);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();
        navigationView.setNavigationItemSelectedListener(this);
        navigationView.setItemIconTintList(null);

        b=findViewById(R.id.floatingActionButton2);
        Animation animation = AnimationUtils.loadAnimation(getApplicationContext()
                , R.anim.blink);
        b.startAnimation(animation);
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ij=new Intent(getApplicationContext(), Test2.class);
                startActivity(ij);
            }
        });
    }


    @Override
    public void onBackPressed() {
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            return;
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
//        getMenuInflater().inflate(R.menu.student_home, menu);
        return true;
    }

//    @Override
//    public boolean onSupportNavigateUp() {
//        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_student_home);
//        return NavigationUI.navigateUp(navController, mAppBarConfiguration)
//                || super.onSupportNavigateUp();
//    }

    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.profile) {
            Intent i =new Intent(getApplicationContext(),Profile.class);
            startActivity(i);

        } else if (id == R.id.diary) {
            Intent i =new Intent(getApplicationContext(), View_diary.class);
            startActivity(i);

        } else if (id == R.id.complaint) {
            Intent i =new Intent(getApplicationContext(), View_complaint.class);
            startActivity(i);

        } else if (id == R.id.motiv) {
            Intent i =new Intent(getApplicationContext(), View_motivation.class);
            startActivity(i);

        } else if (id == R.id.schedule) {
            Intent i =new Intent(getApplicationContext(), View_schedule.class);
            startActivity(i);

        } else if (id == R.id.booking) {
            Intent i =new Intent(getApplicationContext(), View_booking.class);
            startActivity(i);

        }  else if (id == R.id.chat) {
            SharedPreferences sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
            if(sh.getString("tid", "").equalsIgnoreCase("")){
                Toast.makeText(getApplicationContext(), "No tutor for your class", Toast.LENGTH_LONG).show();
            }
            else {
                Intent i =new Intent(getApplicationContext(), Test.class);
                startActivity(i);
            }


        } else if (id == R.id.logout) {
            Intent i=new Intent(getApplicationContext(), Login.class);
            startActivity(i);
        }

        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
}