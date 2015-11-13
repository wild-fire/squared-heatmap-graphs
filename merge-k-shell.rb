require 'csv'

controllability = {}
k_shell = {}

CSV.foreach('controlabilidad.csv', headers: true).each do |row|
  controllability[row["nodo"]] = row["controlabilidad"]
end

CSV.foreach('kshell.csv', headers: true).each do |row|
  k_shell[row["nodo"]] = row["k-shell"]
end

CSV.open('k-shell-controlabilidad.csv', 'w') do |csv|

  controllability.each do |node, score|
    if k_shell[node]
      csv << [node, score, k_shell[node]]
    end
  end

end
