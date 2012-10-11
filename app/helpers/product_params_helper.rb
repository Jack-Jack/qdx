module ProductParamsHelper
  PARAM_SEP = ':'
  PARAM_END = ';'

  def parse_param(param_str)
    param_hash = Hash.new(0)

    error_info = catch(:done) do
      throw(:done, "param is empty!") if param_str.empty?

      puts "\n\t!!!parse_param begin"
      puts param_str
      param_str.split(PARAM_END).each do |param_pair| 
        tmp = param_pair.split(PARAM_SEP)
        puts tmp.to_s
        throw(:done, param_pair) if tmp.size != 2 
        param_hash[tmp[0]] = tmp[1];
      end
      puts "\n\t!!!parse_param end"
    end

    puts "\n!!! #{error_info}\n" if error_info
    param_hash
  end
end
