load('ret1_data.mat')

for i = 1:length(sessions)
    session = sessions(i);
    
    % animal
    mouse_data.subject_name = session.subject_name;
    if contains(session.subject_name, 'KO')
        mouse_data.genotype = 'KO';
    elseif contains(session.subject_name, 'WT')
        mouse_data.genotype = 'WT';
    else
        mouse_data.genotype = 'U';
    end
    inserti(tutorial.Animal, mouse_data);
    
    % session
    session_data.subject_name = session.subject_name;
    session_data.session_date = session.session_date;
    inserti(tutorial.Session, session_data);
    
    % sample
    sample_data = session_data;
    sample_data.sample_id = session.sample_number;
    inserti(tutorial.Sample, sample_data);
    
    % trial, cell and spk train
    if isempty(session.stimulations)
        continue
    end
    for j = 1:length(session.stimulations)
        trial = session.stimulations(j);
        
        trial_data = sample_data;
        trial_data.trial_id = j;
        trial_data.stimulus_onset = trial.stimulus_onset;
        trial_data.fps = trial.fps;
        trial_data.n_frames = trial.n_frames;
        trial_data.pixel_size = trial.pixel_size;
        trial_data.stim_width = trial.stim_width;
        trial_data.stim_height = trial.stim_height;
        trial_data.x_block_size = trial.x_block_size;
        trial_data.y_block_size = trial.y_block_size;
        trial_data.movie = trial.movie;
        inserti(tutorial.Trial, trial_data);
        
        for k = 1:length(trial.spikes)
            spks = trial.spikes{k};
            cell_data = sample_data;
            cell_data.cell_id = k;
            inserti(tutorial.Cell, cell_data);
            spk_train_data = cell_data;
            spk_train_data.trial_id = trial_data.trial_id;
            spk_train_data.spk_train = spks;
            inserti(tutorial.SpkTrain, spk_train_data);
        end
        
    end
    
end
