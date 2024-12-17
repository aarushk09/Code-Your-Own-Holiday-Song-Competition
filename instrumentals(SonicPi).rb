use_bpm 75 # Setting the tempo to fit the 2:11 duration

# Custom function for bell-like sound to evoke Christmas vibe
def play_bell(note)
  use_synth :pretty_bell
  play note, release: 1.5, amp: 2
  sleep 0.75
end

# Verse melody
define :verse do
  use_synth :pluck
  play_pattern_timed [:c4, :e4, :g4, :c5], [0.5, 0.5, 0.5, 1]
  play_pattern_timed [:b3, :d4, :g4, :b4], [0.5, 0.5, 0.5, 1]
  play_pattern_timed [:a3, :c4, :f4, :a4], [0.5, 0.5, 0.5, 1]
  play_pattern_timed [:g3, :b3, :d4, :g4], [0.5, 0.5, 0.5, 1]
end

# Pre-Chorus melody
define :pre_chorus do
  use_synth :piano
  play_pattern_timed [:f4, :a4, :c5, :f5], [0.5, 0.5, 0.5, 1]
  play_pattern_timed [:e4, :g4, :b4, :e5], [0.5, 0.5, 0.5, 1]
  play_pattern_timed [:d4, :f4, :a4, :d5], [0.5, 0.5, 0.5, 1]
  play_pattern_timed [:c4, :e4, :g4, :c5], [0.5, 0.5, 0.5, 1]
end

# Chorus melody
define :chorus do
  use_synth :saw
  2.times do
    play_pattern_timed [:g4, :b4, :d5, :g5], [0.5, 0.5, 0.5, 1]
    play_pattern_timed [:a4, :c5, :e5, :a5], [0.5, 0.5, 0.5, 1]
    play_pattern_timed [:f4, :a4, :c5, :f5], [0.5, 0.5, 0.5, 1]
    play_pattern_timed [:e4, :g4, :b4, :e5], [0.5, 0.5, 0.5, 1]
  end
end

# Bridge melody
define :bridge do
  use_synth :hollow
  play_pattern_timed [:a3, :c4, :e4, :a4], [0.75, 0.75, 0.75, 1]
  play_pattern_timed [:g3, :b3, :d4, :g4], [0.75, 0.75, 0.75, 1]
  play_pattern_timed [:f3, :a3, :c4, :f4], [0.75, 0.75, 0.75, 1]
  play_pattern_timed [:e3, :g3, :b3, :e4], [0.75, 0.75, 0.75, 1]
end

# Background ambience - gentle snow effect
in_thread do
  loop do
    sample :ambi_choir, rate: 0.75, amp: 0.3
    sleep 8
  end
end

# Song Structure
live_loop :song do
  # Verse 1 (16s)
  2.times do
    verse
  end
  
  # Pre-Chorus (16s)
  2.times do
    pre_chorus
  end
  
  # Chorus (32s)
  2.times do
    chorus
  end
  
  # Verse 2 (16s)
  2.times do
    verse
  end
  
  # Pre-Chorus (16s)
  2.times do
    pre_chorus
  end
  
  # Chorus (32s)
  2.times do
    chorus
  end
  
  # Bridge (16s)
  bridge
  bridge
  
  # Chorus (32s)
  2.times do
    chorus
  end
  
  # Outro (15s)
  2.times do
    play_bell :c5
    play_bell :g5
    play_bell :a5
    play_bell :e5
  end
  
  2.times do
    play_pattern_timed [:c5, :e5, :g5, :c6], [0.5, 0.5, 0.5, 1]
  end
  
  stop
end
