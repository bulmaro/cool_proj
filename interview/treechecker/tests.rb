require 'test/unit'
require './BSTChecker.rb'

# Tree to test
class BSTTests  < Test::Unit::TestCase
  def setup
    @tests =
    [
        # [ nil, true],
        # [ [10,nil,nil], true ],
        # [ [10,[9,nil,nil],nil], true],
        # [ [10,nil,[11,nil,nil]], true],
        [ [10,[11,nil,nil],nil], false],
        # [ [10,nil,[9,nil,nil]], false],
        # [
        #   [10,
        #     [5,nil,nil],
        #     [11,nil,nil]
        #   ], true
        # ],

        # [ [20,
        #     [15,
        #       [10,
        #         [5,nil,nil],
        #         [11,nil,nil]
        #       ],
        #       [16,nil,nil]
        #     ],
        #     [25,
        #       [24,nil,nil],
        #       [30,
        #         [26,nil,nil],
        #         [50,nil,nil]
        #       ]
        #     ]
        #   ],
        #   true
        # ],
        #
        # [ [20,
        #    [15,
        #     [10,
        #      [5,nil,nil],
        #      [9,nil,nil]
        #     ],
        #     [16,nil,nil]
        #    ],
        #    [25,
        #     [24,nil,nil],
        #     [30,
        #      [26,nil,nil],
        #      [50,nil,nil]
        #     ]
        #    ]
        #   ],
        #   false
        # ],
        #
        # [ [20,
        #    [15,
        #     [10,
        #      [5,nil,nil],
        #      [11,nil,nil]
        #     ],
        #     [21,nil,nil]
        #    ],
        #    [25,
        #     [24,nil,nil],
        #     [30,
        #      [26,nil,nil],
        #      [50,nil,nil]
        #     ]
        #    ]
        #   ],
        #   false
        # ],
        #
    ]
  end
  def testAll
    @tests.each do |test|
      tree = test[0]
      expected = test[1]
      assert_equal(expected, validateTree(tree)[2])
    end
  end
end
