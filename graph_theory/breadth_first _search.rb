class BreadthFirstSearch
  def self.perform(labirint)
    new(labirint).call
  end

  def initialize(labirint)
    @labirint = labirint
    @queue = []
    @visited = []
  end

  def call
    @visited.push entrance.first
    add_to_queue entrance.last[:to]
    until @queue.empty?
      current_queue = @queue
      current_queue.each do |key|
        node = @labirint[key]
        return 'exit!' if node[:type] == :exit

        @visited.push key
        add_to_queue(node[:to])
        remove_from_queue(key)
      end
    end
    'exit not found!'
  end

  private

  def entrance
    @entrance ||= @labirint.detect { |_i, v| v[:type] == :entrance }
  end

  def add_to_queue(nodes)
    nodes.each { |node| @queue.push(node) unless @visited.include?(node) }
  end

  def remove_from_queue(node)
    @queue.delete(node)
  end
end

labirints = [
  {
    a: { type: :entrance, to: %i[b d] },
    b: { type: :node, to: %i[a c e] },
    c: { type: :node, to: %i[b] },
    d: { type: :node, to: %i[a] },
    e: { type: :node, to: %i[b f] },
    f: { type: :exit, to: %i[e] }
  },

  {
    a: { type: :entrance, to: %i[b d] },
    b: { type: :node, to: %i[a c e] },
    c: { type: :node, to: %i[b] },
    d: { type: :node, to: %i[a] },
    e: { type: :node, to: %i[b f] },
    f: { type: :node, to: %i[e] }
  }
]

labirints.each { |labirint| p BreadthFirstSearch.perform(labirint) }

# output

# exit!
# exit not found!
