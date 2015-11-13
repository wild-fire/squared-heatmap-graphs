require 'csv'

controllability = {}
k_shell = {}
pagerank = {}

CSV.foreach('data/controlabilidad.csv', headers: true).each do |row|
  controllability[row["nodo"]] = row["controlabilidad"]
end

CSV.foreach('data/kshell.csv', headers: true).each do |row|
  k_shell[row["nodo"]] = row["k-shell"]
end

CSV.foreach('data/pagerank.csv', headers: true).each do |row|
  pagerank[row["nodo"]] = row["pagerank"]
end

CSV.open('data/k-shell-controlabilidad.csv', 'w') do |csv|

  csv << ["nodo", "controlability", "kshell"]

  controllability.each do |node, score|
    if k_shell[node]
      csv << [node, score, k_shell[node]]
    end
  end

end


CSV.open('data/k-shell-pagerank.csv', 'w') do |csv|

  csv << ["nodo", "pagerank", "kshell"]

  pagerank.each do |node, score|
    if k_shell[node]
      csv << [node, score, k_shell[node]]
    end
  end

end


CSV.open('data/controlabilidad-pagerank.csv', 'w') do |csv|

  csv << ["nodo", "pagerank", "controlabilidad"]

  pagerank.each do |node, score|
    if controllability[node]
      csv << [node, score, controllability[node]]
    end
  end

end
