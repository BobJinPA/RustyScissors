module Watir
  class Element
    #doesnt work
    def top_edge
      assert_exists
      assert_enabled
      ole_object.getBoundingClientRect.top.to_i
    end

    def top_edge_absolute
      top_edge + page_container.document.parentWindow.screenTop.to_i
    end

    #doesnt work
    def left_edge
      assert_exists
      assert_enabled
      ole_object.getBoundingClientRect.left.to_i
    end

    def left_edge_absolute
      left_edge + page_container.document.parentWindow.screenLeft.to_i
    end

    def right_click
      x = left_edge_absolute
      y = top_edge_absolute
      #puts "x: #{x}, y: #{y}"
      WindowsInput.move_mouse(x, y)
      WindowsInput.right_click
    end

    def left_click
      x = left_edge_absolute
      y = top_edge_absolute
      #puts "x: #{x}, y: #{y}"
      # need some extra push to get the cursor in the right area
      WindowsInput.move_mouse(x + 2, y + 2)
      WindowsInput.left_click
    end
  end
end