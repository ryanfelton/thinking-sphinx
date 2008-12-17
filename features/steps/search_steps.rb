Then /^I can iterate by result and group and count$/ do
  results.each_with_group_and_count do |result, group, count|
    result.should be_kind_of(@model)
    count.should  be_kind_of(Integer)
    group.should  be_kind_of(Integer) unless group.nil?
  end
end

Then /^each result id should match the corresponding sphinx internal id$/ do
  results.each_with_sphinx_internal_id do |result, id|
    result.id.should == id
  end
end

Then /^I should have an array of integers$/ do
  results.each do |result|
    result.should be_kind_of(Integer)
  end
end

Then /^searching for ids should match the record ids of the normal search results$/ do
  normal_results = results
  
  # reset search, switch method
  @results = nil
  @method  = :search_for_ids
  
  results.should == normal_results.collect(&:id)
end