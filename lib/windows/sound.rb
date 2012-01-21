require 'ffi'

module Windows  
  module Sound
    extend FFI::Library

    private

    SND_SYNC        = 0x0000  # play synchronously (default)
    SND_ASYNC       = 0x0001  # play asynchronously
    SND_NODEFAULT   = 0x0002  # silence (!default) if sound not found
    SND_MEMORY      = 0x0004  # pszSound points to a memory file
    SND_LOOP        = 0x0008  # loop the sound until next sndPlaySound
    SND_NOSTOP      = 0x0010  # don:t stop any currently playing sound 

    SND_NOWAIT      = 8192    # don:t wait if the driver is busy
    SND_ALIAS       = 65536   # name is a registry alias
    SND_ALIAS_ID    = 1114112 # alias is a predefined ID
    SND_FILENAME    = 131072  # name is file name
    SND_RESOURCE    = 262148  # name is resource name or atom

    SND_PURGE       = 0x0040  # purge non-static events for task
    SND_APPLICATION = 0x0080  # look for application specific association

    ffi_lib 'kernel32'
    
    attach_function :Beep, [:ulong, :ulong], :bool

    ffi_lib 'winmm'

    attach_function :PlaySound, [:string, :long, :ulong], :bool
    attach_function :waveOutSetVolume, [:long, :ulong], :int
    attach_function :waveOutGetVolume, [:long, :pointer], :int
    attach_function :waveOutGetNumDevs, [], :int
    attach_function :waveInGetNumDevs, [], :int
    attach_function :midiOutGetNumDevs, [], :int
    attach_function :midiInGetNumDevs, [], :int
    attach_function :auxGetNumDevs, [], :int
    attach_function :mixerGetNumDevs, [], :int
  end
end
