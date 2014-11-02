author: rübe
date: 2014-04-25
description: scripted FSM compiler (scriptedFSM.cfg) fix (extra comma in FinalStates, "NO TOKEN")
--

The current/official version of the scripted FSM compiler for the FSM Editor v.1.2.1 (i.e. the file: scriptedFSM.cfg) is slightly borked, as it produces a comma, and hence a state (without token - and that's what MakePBO for example yells at you: "NO TOKEN"!) too much, while printing the final states.

While this has been always the case and obviously causes no real problems (e.g. in game), tools like Mikero's might refuse to accept shitty code... and before we all end up packing our pbos verbatim - therby bypassing lint - why not use this scriptedFSM-fixed.cfg instead...

old/sloppy code (lines 44-47):

  #   class FinalStates
  #   {
  #     print_1 = """%(finalStateName)"",\n";
  #   }
  
new/fixed code:

  #   class FinalStates
  #   {
  #     iffirst_yes = 1;
  #     print_1 = """%(finalStateName)""";
  #     iffirst_no = -1;
  #     print_2 = ",\n""%(finalStateName)"""; // not first, use comma separator
  #   }
  #   print_fs = "\n";
  
That is all. Granted, this produces some blanks/spaces too much, but whatever... at least the indenting is spot on. :P

Tweak on! 
8)

