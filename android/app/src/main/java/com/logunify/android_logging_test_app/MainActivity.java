package com.logunify.android_logging_test_app;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;

import com.google.android.material.snackbar.Snackbar;
import com.logunify.test_project.UserActivitySchema;
import com.logunify.android_logging_test_app.databinding.ActivityMainBinding;
import com.logunify.logging.android.Logger;

public class MainActivity extends AppCompatActivity {

    private AppBarConfiguration appBarConfiguration;
    private ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Logger.init(getApplicationContext());
        SessionManager.generateNewSession();

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        setSupportActionBar(binding.toolbar);

        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_main);
        appBarConfiguration = new AppBarConfiguration.Builder(navController.getGraph()).build();
        NavigationUI.setupActionBarWithNavController(this, navController, appBarConfiguration);

        binding.fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                UserActivitySchema.UserActivity.newBuilder()
                        .setEvent(UserActivitySchema.Event.CLICK)
                        .setButtonType(UserActivitySchema.ButtonType.FAB)
                        .setSurface(UserActivitySchema.Surface.BOTTOM_FAB)
                        .setSessionId(SessionManager.getSessionID())
                        .setUserId("user_id_1")
                        .log();
                Snackbar.make(view, "Clicked Email Button", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
    }

    @Override
    public boolean onMenuOpened(int featureId, Menu menu) {
        UserActivitySchema.UserActivity.newBuilder()
                .setEvent(UserActivitySchema.Event.IMPRESSION)
                .setSurface(UserActivitySchema.Surface.OPTIONS_MENU)
                .setSessionId(SessionManager.getSessionID())
                .setUserId("user_id_1")
                .log();
        return super.onMenuOpened(featureId, menu);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            UserActivitySchema.UserActivity.newBuilder()
                    .setEvent(UserActivitySchema.Event.CLICK)
                    .setButtonType(UserActivitySchema.ButtonType.SETTINGS)
                    .setSurface(UserActivitySchema.Surface.OPTIONS_MENU)
                    .setSessionId(SessionManager.getSessionID())
                    .setUserId("user_id_1")
                    .log();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public boolean onSupportNavigateUp() {
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_main);
        return NavigationUI.navigateUp(navController, appBarConfiguration)
                || super.onSupportNavigateUp();
    }

    @Override
    protected void onStart() {
        SessionManager.generateNewSession();
        super.onStart();
    }
}