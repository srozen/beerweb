module UsersHelper
  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.login,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
def options_for_status
  ['Ami', 'Public']
end

end
