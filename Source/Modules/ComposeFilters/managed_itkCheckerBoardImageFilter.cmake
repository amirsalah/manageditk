WRAP_CLASS("itk::CheckerBoardImageFilter")
  
  WRAP_IMAGE_FILTER_USIGN_INT(1)
  WRAP_IMAGE_FILTER_SIGN_INT(1)
  WRAP_IMAGE_FILTER_REAL(1)
  WRAP_IMAGE_FILTER_VECTOR(1)
  WRAP_IMAGE_FILTER_COV_VECTOR(1)
  WRAP_IMAGE_FILTER_RGB(1)
  
  BEGIN_MANAGED_METHOD("SetInput1")
    SET(MANAGED_METHOD_SUMMARY         "Set Input1 image.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "itkDataObject^ input")
    SET(MANAGED_METHOD_TYPE_BODY       "\n\t\tINativePointer^ inputPtr = safe_cast<INativePointer^>(input);\n\t\tthis->m_PointerToNative->SetInput(0, reinterpret_cast<NativeType::InputImageType*>(inputPtr->NativePointer.ToPointer()));")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->SetInput1(input);")
  END_MANAGED_METHOD()

  BEGIN_MANAGED_METHOD("SetInput2")
    SET(MANAGED_METHOD_SUMMARY         "Set Input2 image.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "itkDataObject^ input")
    SET(MANAGED_METHOD_TYPE_BODY       "\n\t\tINativePointer^ inputPtr = safe_cast<INativePointer^>(input);\n\t\tthis->m_PointerToNative->SetInput(1, reinterpret_cast<NativeType::InputImageType*>(inputPtr->NativePointer.ToPointer()));")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->SetInput2(input);")
  END_MANAGED_METHOD()
  
  BEGIN_MANAGED_METHOD("SetInput1")
    SET(MANAGED_METHOD_SUMMARY         "Set Input1 image.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "IntPtr inputPtr")
    SET(MANAGED_METHOD_TYPE_BODY       "this->m_PointerToNative->SetInput(0, (NativeType::InputImageType*)inputPtr.ToPointer());")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->SetInput1(inputPtr);")
  END_MANAGED_METHOD()

  BEGIN_MANAGED_METHOD("SetInput2")
    SET(MANAGED_METHOD_SUMMARY         "Set Input2 image.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "IntPtr inputPtr")
    SET(MANAGED_METHOD_TYPE_BODY       "this->m_PointerToNative->SetInput(1, (NativeType::InputImageType*)inputPtr.ToPointer());")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->SetInput2(inputPtr);")
  END_MANAGED_METHOD()

  BEGIN_MANAGED_PROPERTY("CheckerPattern" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Set the pattern size (uniform in all directions).")
    SET(MANAGED_PROPERTY_TYPE      "unsigned int")
    SET(MANAGED_PROPERTY_GET_BODY  "return m_PointerToNative->GetCheckerPattern()[0];")
    SET(MANAGED_PROPERTY_SET_BODY  "NativeType::PatternArrayType pattern; pattern.Fill(value); m_PointerToNative->SetCheckerPattern( pattern );")
  END_MANAGED_PROPERTY()

END_WRAP_CLASS()
