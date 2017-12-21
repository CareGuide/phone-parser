# frozen_string_literal: true

require_relative '../../spec_constants'

PHONE_TRUTHY_WITH_ANSWERS_AND_SPACES = [
  {
    matches: ["f i v e - ( F O U R . O N E . 4 . E I G H T . n i N E . F O U R . T W O . E I G H T . SIX . FIVE"],
    text: "If you're interested in this position, do contact me directly on my phone number f i v e - ( F O U R . O N E . 4 . E I G H T . n i N E . F O U R . T W O . E I G H T . SIX . FIVE ).",
    filtered: "If you're interested in this position, do contact me directly on my phone number #{INSERTABLE})."
  }
].freeze

PHONE_TRUTHY_WITH_ANSWERS = [
  {
    matches: ["5.5.5.4.3.8.4.8.3.8"],
    text: "I need a babysitter and errand for my son textme direct on my number if you are interested 5.5.5.4.3.8.4.8.3.8",
    filtered:  "I need a babysitter and errand for my son textme direct on my number if you are interested #{INSERTABLE}"
  },
  {
    matches: ["5557005290"],
    text: "Aron's phone number is 5557005290",
    filtered:  "Aron's phone number is #{INSERTABLE}"
  },
  {
    matches: ["five five five nine 3 two five one zero two"],
    text: "i Rebecca! I saw your profile and would like to know more. my name is Adriana Medrano, from TIDY N' CLEAN CLEANING SERVICES LLC, this message regarding your request for housekeeping services, I'm a very responsable and honest house cleaner, let me help you clean your house. please call or text me at five five five nine 3 two five one zero two, I'm looking forward to serve you",
    filtered:  "i Rebecca! I saw your profile and would like to know more. my name is Adriana Medrano, from TIDY N' CLEAN CLEANING SERVICES LLC, this message regarding your request for housekeeping services, I'm a very responsable and honest house cleaner, let me help you clean your house. please call or text me at #{INSERTABLE}, I'm looking forward to serve you"
  },
  {
    matches: ["(555) 256-4270"],
    text: "Hi Felicia! I saw that you are looking for a family. Would you like to chat sometime soon?(555) 256-4270",
    filtered:  "Hi Felicia! I saw that you are looking for a family. Would you like to chat sometime soon?#{INSERTABLE}"
  },
  {
    matches: ["FIVE FIVE FIVE TWO NINE FOUR TWO EIGHT SIX FIVE"],
    text: "If you're interested in this position, do contact me directly on my phone number ( FIVE FIVE FIVE TWO NINE FOUR TWO EIGHT SIX FIVE  ). Hope you cracked that number code.",
    filtered:  "If you're interested in this position, do contact me directly on my phone number ( #{INSERTABLE}  ). Hope you cracked that number code."
  },
  {
    matches: ["FIVE FIVE FIVE TWO NINE FOUR TWO EIGHT SIX FIVE", "FIVE FIVE FIVE TWO NINE FOUR TWO EIGHT SIX FIVE"],
    text: "If you're interested in this position, do contact me directly on my phone number ( FIVE FIVE FIVE TWO NINE FOUR TWO EIGHT SIX FIVE  ). Hope you cracked that number code. FIVE FIVE FIVE TWO NINE FOUR TWO EIGHT SIX FIVE",
    filtered:  "If you're interested in this position, do contact me directly on my phone number ( #{INSERTABLE}  ). Hope you cracked that number code. #{INSERTABLE}"
  },
  {
    matches: ["(5FIVE5) 146 FOUR OH FIVE 8/9.TWO.1"],
    text: "(5FIVE5) 146 FOUR OH FIVE 8/9.TWO.1",
    filtered:  INSERTABLE
  },
  {
    matches: ["five,five,five,two,one,seven,eight,nine,four,seven"],
    text: "Hi there, I hope you’re having a great week. I am quite impressed with your profile on here and would like to know more. I am looking to employ an experienced, loyal, dedicated, caring and responsible person to look after my house due to my very busy schedule with work. If you're interested in this position, do contact me directly on my phone number ( five,five,five,two,one,seven,eight,nine,four,seven). Hope you cracked that number code. I'd prefer you text first with an introduction then I can give you a call back. Have a great day",
    filtered:  "Hi there, I hope you’re having a great week. I am quite impressed with your profile on here and would like to know more. I am looking to employ an experienced, loyal, dedicated, caring and responsible person to look after my house due to my very busy schedule with work. If you're interested in this position, do contact me directly on my phone number ( #{INSERTABLE}). Hope you cracked that number code. I'd prefer you text first with an introduction then I can give you a call back. Have a great day"
  },
  {
    matches: ["five.five.five.six.three.zero.five.seven.four.two"],
    text: "Hello how are you doing today? i'm Andrea, we are moving to your area and i would need a baby sitter and errands, at your convenient time kindly text me at five.five.five.six.three.zero.five.seven.four.two",
    filtered:  "Hello how are you doing today? i'm Andrea, we are moving to your area and i would need a baby sitter and errands, at your convenient time kindly text me at #{INSERTABLE}"
  },
  {
    matches: ["Five. five. five. Seven. nine. four. Two. nine. zero. three"],
    text: "Hello, My name is Mary, We are moving to your area.I need a baby sitter service for my 6 years old son also can run an errand at your convenience time... I will like to hear back from you and here is my number..Five. five. five. Seven. nine. four. Two. nine. zero. three. ..I will be waiting for your text if you are interested.Thanks",
    filtered:  "Hello, My name is Mary, We are moving to your area.I need a baby sitter service for my 6 years old son also can run an errand at your convenience time... I will like to hear back from you and here is my number..#{INSERTABLE}. ..I will be waiting for your text if you are interested.Thanks"
  },
  {
    matches: ["5.5.5.Six.Seven.Zero.7.2.0.4"],
    text: "Hello this is tiara happy sunday am just new on this site i need a serious and God fearing person sitter for my 6yrs old son am moving to your neighbourhood if you are interested in working with me kindly get back to me asap! contact me direct on my digit 5.5.5.Six.Seven.Zero.7.2.0.4",
    filtered:  "Hello this is tiara happy sunday am just new on this site i need a serious and God fearing person sitter for my 6yrs old son am moving to your neighbourhood if you are interested in working with me kindly get back to me asap! contact me direct on my digit #{INSERTABLE}"
  },
  {
    matches: ["5552201712"],
    text: "Hey, have family forever here at 1160 Marion St. Niles,  MI  45920 and ph 5552201712, yet on road behind Mc Donalds at white house two bedroom washer dryer stove fridge an stay of creatures mostly invisible no one at home usually but me kids just play cause heavenly delight anywhere door to front open back door one always a fenced yard and shed any questions drive by or come on in my home is always yours just open door ask anything seek anything knock at any idea you choose. you would be the boss of all that is my children's and as a nanny I assure you they will listen o call not",
    filtered:  "Hey, have family forever here at 1160 Marion St. Niles,  MI  45920 and ph #{INSERTABLE}, yet on road behind Mc Donalds at white house two bedroom washer dryer stove fridge an stay of creatures mostly invisible no one at home usually but me kids just play cause heavenly delight anywhere door to front open back door one always a fenced yard and shed any questions drive by or come on in my home is always yours just open door ask anything seek anything knock at any idea you choose. you would be the boss of all that is my children's and as a nanny I assure you they will listen o call not"
  },
  {
    matches: ["five five five seven three two zero seven nine three"],
    text: "Hi, I'm looking for housekeeper to clean up apartment.  You can text me at five five five seven three two zero seven nine three for more details. Danny",
    filtered:  "Hi, I'm looking for housekeeper to clean up apartment.  You can text me at #{INSERTABLE} for more details. Danny"
  },
  {
    matches: ["(555) 237-2092"],
    text: "Hey Anna! Have you found a family yet? I think that we would be a good match.here is my contact for easy communication (555) 237-2092",
    filtered:  "Hey Anna! Have you found a family yet? I think that we would be a good match.here is my contact for easy communication #{INSERTABLE}"
  },
  {
    matches: ["555-684-2900"],
    text: "1/10082  Williams  RD  Chilliwack  BC V2P-5H2 Bradley  Mayo  Called  me  555-684-2900 Yes  Bradley  Mayo  Home  by  myself Girl with latex gloves",
    filtered:  "1/10082  Williams  RD  Chilliwack  BC V2P-5H2 Bradley  Mayo  Called  me  #{INSERTABLE} Yes  Bradley  Mayo  Home  by  myself Girl with latex gloves"
  },
  {
    matches: ["5.5.5.Nine.Three.Seven.6.4.0.8"],
    text: "Hello this is Mary seeking for sitter to babysit my son if you interested kind get back to me asap!contact me direct on my digit number 5.5.5.Nine.Three.Seven.6.4.0.8",
    filtered:  "Hello this is Mary seeking for sitter to babysit my son if you interested kind get back to me asap!contact me direct on my digit number #{INSERTABLE}"
  },
  {
    matches: ["FIVE, FIVE, FIVE, FIVE, TWO, SIX, SIX, TWO, FIVE, FOUR"],
    text: "Hi there, I hope you’re having a great week. I am quite impressed with your profile on here and would like to know more. I am looking to employ an experienced, loyal, dedicated, caring and responsible nanny to look after my kids due to my very busy schedule with work. If you're interested in this position, do contact me directly on my phone number( FIVE, FIVE, FIVE, FIVE, TWO, SIX, SIX, TWO, FIVE, FOUR). Hope you cracked that number code. I'd prefer you text first with an introduction then I can give you a call back. Have a great day ahead",
    filtered:  "Hi there, I hope you’re having a great week. I am quite impressed with your profile on here and would like to know more. I am looking to employ an experienced, loyal, dedicated, caring and responsible nanny to look after my kids due to my very busy schedule with work. If you're interested in this position, do contact me directly on my phone number( #{INSERTABLE}). Hope you cracked that number code. I'd prefer you text first with an introduction then I can give you a call back. Have a great day ahead"
  },
  {
    matches: ["555...788... 5283"],
    text: "Hi there, Hope you had a great weekend. I am impressed with your profile on here and would like to know more about you. I am looking to employ an experienced,loyal, dedicated, caring and responsible person to look after my dogs due to my very busy schedule with work. If you're interested in this position, do contact me directly on my phone number 555...788... 5283. Hope you cracked that number code. I'd prefer you text first with an introduction then I can give you a call back. Have a great day ahead. tanosha",
    filtered:  "Hi there, Hope you had a great weekend. I am impressed with your profile on here and would like to know more about you. I am looking to employ an experienced,loyal, dedicated, caring and responsible person to look after my dogs due to my very busy schedule with work. If you're interested in this position, do contact me directly on my phone number #{INSERTABLE}. Hope you cracked that number code. I'd prefer you text first with an introduction then I can give you a call back. Have a great day ahead. tanosha"
  },
  {
    matches: ["555........788......... 5283"],
    text: "Hi there, Hope you had a great weekend. I am impressed with your profile on here and would like to know more about you. I am looking to employ an experienced,loyal, dedicated, caring and responsible person to look after my dogs due to my very busy schedule with work. If you're interested in this position, do contact me directly on my phone number 555........788......... 5283. Hope you cracked that number code. I'd prefer you text first with an introduction then I can give you a call back. Have a great day ahead. tanosha",
    filtered:  "Hi there, Hope you had a great weekend. I am impressed with your profile on here and would like to know more about you. I am looking to employ an experienced,loyal, dedicated, caring and responsible person to look after my dogs due to my very busy schedule with work. If you're interested in this position, do contact me directly on my phone number #{INSERTABLE}. Hope you cracked that number code. I'd prefer you text first with an introduction then I can give you a call back. Have a great day ahead. tanosha"
  }
].freeze
