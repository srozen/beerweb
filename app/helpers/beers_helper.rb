module BeersHelper




  def nbReviews(nb)
    if nb > 1 then return true
    else return false
    end
  end

  def nbReviewsII(nb)
  	if nb > 0 then return true
    else return false
    end
  end

end
