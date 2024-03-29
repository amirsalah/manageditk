WRAP_CLASS("itk::ImageRandomNonRepeatingConstIteratorWithIndex")

  SET(MANAGED_TYPE_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedImageIteratorWithIndex_TYPE.cxx.in)
  SET(MANAGED_WRAPPER_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedImageIteratorWithIndex_WRAPPER.cxx.in)
  SET(MANAGED_SUBCLASS itk::itkImageConstIteratorWithIndex)

  WRAP_IMAGE_FILTER_USIGN_INT(1)
  WRAP_IMAGE_FILTER_SIGN_INT(1)
  WRAP_IMAGE_FILTER_REAL(1)
  WRAP_IMAGE_FILTER_BOOL(1)

  BEGIN_MANAGED_CONSTRUCTOR()
    SET(MANAGED_CONSTRUCTOR_SUMMARY       "Constructor taking image and region.")
    SET(MANAGED_CONSTRUCTOR_PARAMS        "itk::itkImageBase^ image, itk::itkImageRegion^ region")
    SET(MANAGED_CONSTRUCTOR_TYPE_BODY     "this->Initialise();\n\t\tthis->m_PointerToNative = new NativeType( (NativeType::ImageType*)image->NativePointer.ToPointer(), itk::ManagedTypes::ToNativeImageRegion<NativeType::ImageDimension>(region) );")
    SET(MANAGED_CONSTRUCTOR_WRAPPER_BODY  "this->m_MangledTypeString = image->MangledTypeString;\n\t\tarray<Object^>^ args = {image, region};\n\t\tthis->CreateInstance( args );")
  END_MANAGED_CONSTRUCTOR()
  
  BEGIN_MANAGED_PROPERTY("NumberOfSamples" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the number of random samples to get from the image region.")
    SET(MANAGED_PROPERTY_TYPE      "unsigned long")
    SET(MANAGED_PROPERTY_GET_BODY  "return m_PointerToNative->GetNumberOfSamples();")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetNumberOfSamples( value );")
  END_MANAGED_PROPERTY()

  BEGIN_MANAGED_METHOD("ReinitializeSeed")
    SET(MANAGED_METHOD_SUMMARY         "Reinitialize the seed of the random number generator.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "void")
    SET(MANAGED_METHOD_TYPE_BODY       "this->m_PointerToNative->ReinitializeSeed( );")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->ReinitializeSeed( );")
  END_MANAGED_METHOD()
  
  BEGIN_MANAGED_METHOD("ReinitializeSeed")
    SET(MANAGED_METHOD_SUMMARY         "Reinitialize the seed of the random number generator.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "int value")
    SET(MANAGED_METHOD_TYPE_BODY       "this->m_PointerToNative->ReinitializeSeed( value );")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->ReinitializeSeed( value );")
  END_MANAGED_METHOD()
  
  BEGIN_MANAGED_METHOD("SetPriorityImage")
    SET(MANAGED_METHOD_SUMMARY         "Set the priority image. The priority image controls the order of the random selection. Pixels of the same priority will be ordered randomly, but pixels of lower priority value will be selected first.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "itk::itkImage^ priorityImage")
    SET(MANAGED_METHOD_TYPE_BODY       "this->m_PointerToNative->SetPriorityImage( (NativeType::PriorityImageType*)priorityImage->NativePointer.ToPointer() );")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->SetPriorityImage( priorityImage );")
  END_MANAGED_METHOD()

END_WRAP_CLASS()
