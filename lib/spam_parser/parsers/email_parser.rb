# frozen_string_literal: true

require_relative '../data/list_of_email_domains'

# Parses text and attempts to locate email
class EmailParser
  def count_email_instances(block, options)
    block = parse_email(block)
    instances = []
    if options.fetch(:aggressive, false)
      temp_instances =
        block
        .enum_for(:scan, ALLOWABLE_WITHOUT_DOT_REGEX)
        .map { [Regexp.last_match.begin(0), Regexp.last_match.to_s] }
      temp_instances.each do |instance|
        instances << instance if EMAIL_DOMAINS.any? { |domain| instance[1].split('@')[1].include? domain }
      end
    else
      instances =
        block
        .enum_for(:scan, ALLOWABLE_REGEX)
        .map { [Regexp.last_match.begin(0), Regexp.last_match.to_s.strip] }
    end
    instances.length
  end

  def replace_email_instances(block, insertable, options)
    instances = find_email_instances(block, options)
    instances.map do |(start_offset, text)|
      block[start_offset...start_offset + text.size] = insertable
    end
    block
  end

  def find_email_instances(block, options)
    instances = []
    if options.fetch(:aggressive, false)
      temp_instances =
        block
        .downcase
        .enum_for(:scan, ALLOWABLE_WITHOUT_DOT_REGEX_ONLY)
        .map { [Regexp.last_match.begin(0), Regexp.last_match.to_s.strip] }
      temp_instances.each do |instance|
        instances << instance if EMAIL_DOMAINS.any? { |domain| instance[1].split('@')[1]&.include? domain }
      end
    else
      instances =
        block
        .downcase
        .enum_for(:scan, ALLOWABLE_REGEX_ONLY)
        .map { [Regexp.last_match.begin(0), Regexp.last_match.to_s.strip] }
    end
    instances
  end

  private

  TEXT_MATCH = 'a-z0-9._%+-'

  # rubocop:disable LineLength
  ALLOWABLE_REGEX_ONLY = Regexp.new(/(([#{TEXT_MATCH}]{1}[^\w]{1})+|([#{TEXT_MATCH}])+)([^\w]+(at){1}[^\w]+|[^\w]*@[^\w]*){1}[a-z0-9.-]+(([^\w]*\.[^\w]*|[^\w]+(dot){1}[^\w]+){1}[a-z]{2,})+/)
  ALLOWABLE_WITHOUT_DOT_REGEX_ONLY = Regexp.new(/(([#{TEXT_MATCH}]{1}[^\w]{1})+|([#{TEXT_MATCH}])+)([^\w]+(at){1}[^\w]+|[^\w]*@[^\w]*){1}[a-z0-9.-]+([^\w]*\.[^\w]*|[^\w]+(dot){1}[^\w]+)?([a-z]{2,})?/)
  # rubocop:enable LineLength

  ALLOWABLE_REGEX = Regexp.new(/[a-z0-9._%+-]+\${,2}@{1}\${,2}[a-z0-9.-]+\${,2}(\.){1}/)
  ALLOWABLE_WITHOUT_DOT_REGEX = Regexp.new(/[a-z0-9._%+-]+\${,2}@{1}\${,2}[a-z0-9.-]+\${,2}/)

  REPLACEMENTS = {
    ' at ' => '@',
    '(at)' => '@',
    ' dot ' => '.'
  }.freeze

  def parse_email(block)
    block.downcase.gsub(/\ at\ |\(at\)|\ dot\ /, REPLACEMENTS).gsub(/[^\w\@\.\_\%\+\-]/, '$')
  end
end
