# Sonic Pi Relaxing Study Beat with Jazz Inspirations

# Define the tempo and key
bpm_factor = 1
use_bpm 80

counter = 0
dmin11 = [:d4, :f4, :a4, :c5, :e5, :g5]
gmin7 = [:d3, :g3, :bb4, :d4, :f4, :bb5]
ebmin11 = [:d3, :f3, :a3, :c4, :e4, :g4]
csharpdim7 = [:eb3, :gb3, :bb4, :db4, :f4, :ab4]
define :play_jazz_bassline do
  use_synth :fm
  use_synth_defaults release: 0.5, amp: 0.5, cutoff: 60
  
  notes = [
    :E2, :G2, :A2, :Bb2,
    :B2, :A2, :G2, :F2
  ] # Adjust these notes as needed
  durations = [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5] # Adjust these durations as needed
  
  in_thread do
    notes.each_with_index do |note, index|
      play note, sustain: durations[index], attack: 0.2
      sleep durations[index]
    end
    sleep 4
  end
end
define :play_khruangbin_chords do
  chords = [chord(:E3, :minor7), chord(:G3, :minor7), chord(:A3, :minor7), chord(:B3, :minor7)] # Adjust as needed
  
  in_thread do
    with_fx :reverb, mix: 0.6 do
      chords.each do |c|
        play c, release: 4, attack: 0.6,amp: 0.3
        sleep 4
      end
    end
  end
end


define :play_dark_ambience do
  with_fx :distortion, distort: 0.5 do
    with_fx :lpf, cutoff: 80 do
      synth :dark_ambience, note: :C2, release: 8, amp: 0.25
      sleep 8
    end
  end
end
define :play_lunar_land do
  with_fx :distortion, distort: 0.5 do
    with_fx :lpf, cutoff: 80 do
      sample :ambi_lunar_land, release: 8, amp: 0.3
      sleep 16
    end
  end
end


# Function to play a soft pad
pad_notes = [:C3, :E3, :G3, :A3]
define :play_pad do |notes, duration, opts = {}|
  in_thread do
    with_fx :reverb, mix: 0 do
      notes.each do |note|
        synth :fm, note: note, attack: 2, release: 6, cutoff: 60, amp: 0.3
        sleep duration
      end
    end
  end
end


define :piano_chords do
  
  #hollow,hoover,
  # Play the chords
  in_thread do
    loop do
      use_synth :hollow
      use_synth_defaults amp: 0.9, attack: 0.4
      play_chord dmin11
      sleep 1.5
      play_chord gmin7
      sleep 1.5
      play_chord dmin11
      sleep 1.5
      play_chord ebmin11
      sleep 0.75
      play_chord csharpdim7
      sleep 0.75
    end
  end
end


in_thread do
  loop do
    counter += 1
    sleep 1
    puts counter
  end
end
in_thread do
  loop do
    if counter > 128 && counter < 200
      bpm_factor = 0.5
    end
    if counter > 200
      bpm_factor = 1
    end
    sleep 1
  end
  
end

if counter > 32
  in_thread do
    loop do
      use_bpm 80 * bpm_factor
      use_synth :hollow
      use_synth_defaults amp: 0.9, attack: 0.55
      play_chord dmin11
      sleep 1.5
      play_chord gmin7
      sleep 1.5
      play_chord dmin11
      sleep 1.5
      play_chord ebmin11
      sleep 0.75
      play_chord csharpdim7
      sleep 0.75
    end
    
  end
end




in_thread do
  
  loop do
    use_bpm 60 * bpm_factor
    sample_path = "/Users/cdasilva/CC/MissYouSoSample.mp3"
    with_fx :reverb, mix: 0 do
      with_fx :distortion, distort: 0.2 do
        sample sample_path, amp: 1
        
      end
      
    end
    sleep 4.1
  end
end
in_thread do
  loop do
    use_bpm 60 * bpm_factor
    
    with_fx :reverb, mix: 0.7 do
      with_fx :distortion, distort: 0.4 do
        
        
        sleep 4
        if counter > 8 && counter < 210
          sample_path = "/Users/cdasilva/CC/SeatbeltsSample.mp3"
          sample sample_path, amp: 0.25
        end
        sleep 4
        if counter > 240 && counter < 290
          sample_path = "/Users/cdasilva/CC/ElectronicSample.mp3"
          sample sample_path, amp: 0.5
        end
        if counter > 280
          sample_path = "/Users/cdasilva/CC/SeatbeltsSample.mp3"
          sample sample_path, amp: 0.25
        end
        
        
      end
      
    end
  end
end

in_thread do
  loop do
    use_bpm 80 * bpm_factor
    with_fx :reverb, mix: 0.8 do
      if counter > 32
        sample :bass_trance_c, amp: 0.1
      end
    end
    sleep 12
  end
end

in_thread do
  loop do
    use_bpm 80 * bpm_factor
    with_fx :reverb, mix: 0 do
      if counter > 64
        play_pad(pad_notes, 8)
      end
      sleep 4
    end
  end
end
in_thread do
  loop do
    use_bpm 80 * bpm_factor
    play_dark_ambience
  end
end
in_thread do
  loop do
    use_bpm 80 * bpm_factor
    play_lunar_land
  end
end
in_thread do
  loop do
    use_bpm 80 * bpm_factor
    if counter > 48
      play_jazz_bassline
    end
    if counter > 60
      play_khruangbin_chords
    end
    sleep 4
  end
end

in_thread do
  loop do
    use_bpm 80 * bpm_factor
    if counter > 108
      sleep 4
      sample :guit_em9, amp: 0.3
      sleep 1
      sample :guit_em9, amp: 0.2
    end
    sleep 8
    
  end
end









