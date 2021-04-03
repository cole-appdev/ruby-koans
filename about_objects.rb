require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    assert_equal 1.kind_of?(Object), 1.is_a?(Object)
    assert_equal 1.5.kind_of?(Object), 1.5.is_a?(Object)
    assert_equal "string".kind_of?(Object), "string".is_a?(Object)
    assert_equal nil.kind_of?(Object), nil.is_a?(Object)
    assert_equal Object.kind_of?(Object), Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s
    assert_equal "", nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal "123", 123.inspect
    assert_equal "nil", nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal 7.class, obj.object_id.class
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal true, obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id
    assert_equal 3, 1.object_id
    assert_equal 5, 2.object_id
    assert_equal 201, 100.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow? i*2+1 - http://thepaulrayner.com/blog/2013/02/06/object-ids-in-ruby/
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal __, obj           != copy
    assert_equal __, obj.object_id != copy.object_id
  end
end
