WRAP_CLASS("itk::ExtractImageFilter")

  FOREACH(d1 ${WRAP_ITK_DIMS})
    FOREACH(d2 ${WRAP_ITK_DIMS})
      IF("${d1}" GREATER "${d2}" OR "${d1}" EQUAL "${d2}")
        UNIQUE (types "${WRAP_ITK_SCALAR};${WRAP_ITK_COLOR}")
        FOREACH(t ${types})
          WRAP_TEMPLATE("${ITKM_I${t}${d1}}${ITKM_I${t}${d2}}"
                        "${ITKT_I${t}${d1}},${ITKT_I${t}${d2}}")
        ENDFOREACH(t)
      ENDIF("${d1}" GREATER "${d2}" OR "${d1}" EQUAL "${d2}")
    ENDFOREACH(d2)
  ENDFOREACH(d1)

  SET(body "")
  SET(body "${body}\n\t\t// Get the input region")
  SET(body "${body}\n\t\tInputImageType::RegionType regionInput = \n\t\t\tm_PointerToNative->GetInput()->GetLargestPossibleRegion();")
  SET(body "${body}\n\t\tInputImageType::SizeType size = regionInput.GetSize();")
  SET(body "${body}\n\t\tInputImageType::IndexType index = regionInput.GetIndex();")
  SET(body "${body}\n\t\t")
  SET(body "${body}\n\t\t// Setup the size and index for the output region")
  SET(body "${body}\n\t\tsize[direction]=0;")
  SET(body "${body}\n\t\tindex[direction]=(InputImageType::IndexType::IndexValueType)slice;")
  SET(body "${body}\n\t\t")
  SET(body "${body}\n\t\t// Create output region")
  SET(body "${body}\n\t\tInputImageType::RegionType regionOutput;")
  SET(body "${body}\n\t\tregionOutput.SetSize(size);")
  SET(body "${body}\n\t\tregionOutput.SetIndex(index);")
  SET(body "${body}\n\t\t")
  SET(body "${body}\n\t\t// Set the filter extraction region")
  SET(body "${body}\n\t\tm_PointerToNative->SetExtractionRegion(regionOutput);")

  BEGIN_MANAGED_METHOD("ExtractSlice")
    SET(MANAGED_METHOD_SUMMARY         "Extract the given slice along the given direction. Direction 0 is the slowest changing direction, etc.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "int direction, long slice")
    SET(MANAGED_METHOD_TYPE_BODY       "${body}")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->ExtractSlice(direction, slice);")
  END_MANAGED_METHOD()

  BEGIN_MANAGED_PROPERTY("ExtractionRegion" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the region to be extracted.")
    SET(MANAGED_PROPERTY_TYPE      "itkImageRegion^")
    SET(MANAGED_PROPERTY_GET_BODY  "return itk::ManagedTypes::ToManagedImageRegion<NativeType::InputImageType::ImageDimension>( m_PointerToNative->GetExtractionRegion() );")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetExtractionRegion( itk::ManagedTypes::ToNativeImageRegion<NativeType::InputImageType::ImageDimension>(value) );")
  END_MANAGED_PROPERTY()

END_WRAP_CLASS()