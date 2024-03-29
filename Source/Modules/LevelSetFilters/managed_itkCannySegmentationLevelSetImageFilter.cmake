WRAP_CLASS("itk::CannySegmentationLevelSetImageFilter")

  SET(MANAGED_TYPE_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedSegmentationLevelSetImageFilter_TYPE.cxx.in)
  SET(MANAGED_WRAPPER_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedSegmentationLevelSetImageFilter_WRAPPER.cxx.in)

  FILTER_DIMS(dims 2+)
  FOREACH(d ${dims})
    FOREACH(t ${WRAP_ITK_REAL})
      WRAP_TEMPLATE("${ITKM_I${t}${d}}${ITKM_I${t}${d}}${ITKM_${t}}" "${ITKT_I${t}${d}},${ITKT_I${t}${d}},${ITKT_${t}}")
    ENDFOREACH(t)
  ENDFOREACH(d)
  
  BEGIN_MANAGED_PROPERTY("Threshold" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the threshold parameter used by the underlying level set function.")
    SET(MANAGED_PROPERTY_TYPE      "itkPixel^")
    SET(MANAGED_PROPERTY_GET_BODY  "return itk::ManagedTypes::ToManagedPixel<NativeType::ScalarValueType>( m_PointerToNative->GetThreshold() );")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetThreshold( itk::ManagedTypes::ToNativePixel<NativeType::ScalarValueType>( value ) );")
  END_MANAGED_PROPERTY()

  BEGIN_MANAGED_PROPERTY("Variance" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the variance parameter used by the underlying level set function.")
    SET(MANAGED_PROPERTY_TYPE      "double")
    SET(MANAGED_PROPERTY_GET_BODY  "return m_PointerToNative->GetVariance();")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetVariance( value );")
  END_MANAGED_PROPERTY()

  BEGIN_MANAGED_METHOD("GetCannyImage")
    SET(MANAGED_METHOD_SUMMARY         "Get the Canny image that was used to create the speed and advection images.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "itkImageBase^ image")
    SET(MANAGED_METHOD_TYPE_BODY       "image->NativePointer = IntPtr((OutputImageType*)this->m_PointerToNative->GetCannyImage());")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->GetCannyImage( image );")
  END_MANAGED_METHOD()

END_WRAP_CLASS()
