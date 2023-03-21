package com.logunify.android_logging_test_app;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.navigation.fragment.NavHostFragment;

import com.logunify.android_logging_test_app.databinding.FragmentFirstBinding;
import com.logunify.test_project.UserActivitySchema;

public class FirstFragment extends Fragment {

    private FragmentFirstBinding binding;

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {

        binding = FragmentFirstBinding.inflate(inflater, container, false);
        return binding.getRoot();

    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        UserActivitySchema.UserActivity.newBuilder()
                .setEvent(UserActivitySchema.Event.IMPRESSION)
                .setSurface(UserActivitySchema.Surface.SCREEN_1)
                .setUserId("user_id_1")
                .setSessionId(SessionManager.getSessionID())
                .log();

        binding.buttonFirst.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                UserActivitySchema.UserActivity.newBuilder()
                        .setEvent(UserActivitySchema.Event.CLICK)
                        .setButtonType(UserActivitySchema.ButtonType.NEXT)
                        .setSurface(UserActivitySchema.Surface.SCREEN_1)
                        .setUserId("user_id_1")
                        .setSessionId(SessionManager.getSessionID())
                        .log();

                NavHostFragment.findNavController(FirstFragment.this)
                        .navigate(R.id.action_FirstFragment_to_SecondFragment);
            }
        });
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}