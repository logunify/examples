package com.logunify.android_logging_test_app;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.navigation.fragment.NavHostFragment;

import com.logunify.android_logging_test_app.databinding.FragmentSecondBinding;
import com.logunify.test_project.UserActivitySchema;

public class SecondFragment extends Fragment {

    private FragmentSecondBinding binding;

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {

        binding = FragmentSecondBinding.inflate(inflater, container, false);
        return binding.getRoot();
    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        UserActivitySchema.UserActivity.newBuilder()
                .setEvent(UserActivitySchema.Event.IMPRESSION)
                .setSurface(UserActivitySchema.Surface.SCREEN_2)
                .setUserId("user_id_1")
                .setSessionId(SessionManager.getSessionID())
                .log();

        binding.buttonSecond.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                UserActivitySchema.UserActivity.newBuilder()
                        .setEvent(UserActivitySchema.Event.CLICK)
                        .setButtonType(UserActivitySchema.ButtonType.PREVIOUS)
                        .setSurface(UserActivitySchema.Surface.SCREEN_2)
                        .setUserId("user_id_1")
                        .setSessionId(SessionManager.getSessionID())
                        .log();

                NavHostFragment.findNavController(SecondFragment.this)
                        .navigate(R.id.action_SecondFragment_to_FirstFragment);
            }
        });
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}