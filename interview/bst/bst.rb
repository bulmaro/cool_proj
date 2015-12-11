def checkTree(node, shouldBeLessThan, shouldBeMoreThan)
	return false if(node.nil? || (!shouldBeLessThan.nil? && node[0] > shouldBeLessThan) || (!shouldBeMoreThan.nil? && node[0] < shouldBeMoreThan))
 
  	if node[1] != nil		
		t_shouldBeLessThan =  (shouldBeLessThan.nil? || shouldBeLessThan < node[0]) ? node[0] : shouldBeLessThan
		return false if !checkTree(node[1], t_shouldBeLessThan, shouldBeMoreThan)
	end
 
	if node[2] != nil
		t_shouldBeMoreThan = (shouldBeMoreThan.nil? || shouldBeMoreThan > node[0]) ? node[0] : shouldBeMoreThan
		return false if !checkTree(node[2], shouldBeLessThan, t_shouldBeMoreThan)
	end
 
	return true;
end