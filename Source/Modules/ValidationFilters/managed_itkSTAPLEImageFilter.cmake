WRAP_CLASS("itk::STAPLEImageFilter")

  WRAP_IMAGE_FILTER_USIGN_INT(2)
  WRAP_IMAGE_FILTER_SIGN_INT(2)
  WRAP_IMAGE_FILTER_REAL(2)
  WRAP_IMAGE_FILTER_BOOL(2)

  BEGIN_MANAGED_PROPERTY("ForegroundValue" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the binary ON value of the input image.")
    SET(MANAGED_PROPERTY_TYPE      "itkPixel^")
    SET(MANAGED_PROPERTY_GET_BODY  "return itk::ManagedTypes::ToManagedPixel<NativeType::InputPixelType>( m_PointerToNative->GetForegroundValue() );")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetForegroundValue( itk::ManagedTypes::ToNativePixel<NativeType::InputPixelType>( value ) );")
  END_MANAGED_PROPERTY()

  BEGIN_MANAGED_PROPERTY("MaximumIterations" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the maximum number of iterations after which the STAPLE algorithm will be considered to have converged. In general this SHOULD NOT be set and the algorithm should be allowed to converge on its own.")
    SET(MANAGED_PROPERTY_TYPE      "unsigned int")
    SET(MANAGED_PROPERTY_GET_BODY  "return m_PointerToNative->GetMaximumIterations();")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetMaximumIterations( value );")
  END_MANAGED_PROPERTY()

  BEGIN_MANAGED_PROPERTY("ConfidenceWeight" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the scaling for the estimated prior probability that a pixel will be inside the targeted object of segmentation. The default prior probability g_t is calculated automatically as the average fraction of positively classified pixels to the total size of the volume (across all input volumes). ConfidenceWeight will scale this default value as g_t = g_t * ConfidenceWeight. In general, ConfidenceWeight should be left to the default of 1.0.")
    SET(MANAGED_PROPERTY_TYPE      "double")
    SET(MANAGED_PROPERTY_GET_BODY  "return m_PointerToNative->GetConfidenceWeight();")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetConfidenceWeight( value );")
  END_MANAGED_PROPERTY()
  
  BEGIN_MANAGED_PROPERTY("ElapsedIterations" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get the number of elapsed iterations of the iterative E-M algorithm.")
    SET(MANAGED_PROPERTY_TYPE      "unsigned int")
    SET(MANAGED_PROPERTY_GET_BODY  "return m_PointerToNative->GetElapsedIterations();")
  END_MANAGED_PROPERTY()

  BEGIN_MANAGED_METHOD("GetSensitivity")
    SET(MANAGED_METHOD_SUMMARY         "After the filter is updated, this method returns the Sensitivity (true positive fraction, p) value for the i-th expert input volume.")
    SET(MANAGED_METHOD_RETURN_TYPE     "double")
    SET(MANAGED_METHOD_PARAMS          "unsigned int i")
    SET(MANAGED_METHOD_TYPE_BODY       "return m_PointerToNative->GetSensitivity( i );")
    SET(MANAGED_METHOD_WRAPPER_BODY    "return iInstance->GetSensitivity( i );")
  END_MANAGED_METHOD()

  BEGIN_MANAGED_METHOD("GetSpecificity")
    SET(MANAGED_METHOD_SUMMARY         "After the filter is updated, this method returns the Specificity (true negative fraction, q) value for the i-th expert input volume.")
    SET(MANAGED_METHOD_RETURN_TYPE     "double")
    SET(MANAGED_METHOD_PARAMS          "unsigned int i")
    SET(MANAGED_METHOD_TYPE_BODY       "return m_PointerToNative->GetSpecificity( i );")
    SET(MANAGED_METHOD_WRAPPER_BODY    "return iInstance->GetSpecificity( i );")
  END_MANAGED_METHOD()

END_WRAP_CLASS()