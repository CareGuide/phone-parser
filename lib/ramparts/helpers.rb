# frozen_string_literal: false

require 'pry'

ARGUMENT_ERROR_TEXT = 'Parameter 1, the block of text to parse, is not a string'

# The map reduce (MR) algorithm. Faster by ~2x than the other algorithm.
# Maps parts of the text such as 'at' or 'FOUR' down to '@' and '4'
# removes spaces etc, and then runs a simple regex over the remainder
# Information loss occurs and hence it can't return indices
MR_ALGO = 'MR'

# The glorified regex (GR) algorithm.
# An obtuse and yet heartily strong regex that does a single pass over
# the text. Since the regex is so complicated and robust - it is slower
# than the map reduce algorithm. No information loss occurs
# so we can return indices of where the phone numbers and etc. exist
GR_ALGO = 'GR'

# Given some text it replaces each matched instance with the given insertable
def replace(text, insertable, instances)
  altered_text = String.new(text)

  instances.map do |instance|
    altered_text[instance[:start_offset]...instance[:end_offset]] = insertable
  end
  altered_text
end

# Given some text it scans the text with the given regex for matches
def scan(text, regex, type)
  text
    .enum_for(:scan, regex)
    .map do
      {
        start_offset: Regexp.last_match.begin(0),
        end_offset: Regexp.last_match.begin(0) + Regexp.last_match.to_s.length,
        value: Regexp.last_match.to_s,
        type: type
      }
    end
end

# Checks to see if a point intersects a substring given their offsets
def point_intersect?(p1, p2_start, p2_end)
  return p1 >= p2_start && p1 <= p2_end
end

# Checks to see if two substrings intersect given their offsets
def intersect?(p1_start, p1_end, p2_start, p2_end)
  return point_intersect?(p1_start, p2_start, p2_end) || point_intersect?(p1_end, p2_start, p2_end)
end
