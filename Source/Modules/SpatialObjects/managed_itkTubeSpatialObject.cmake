WRAP_CLASS("itk::TubeSpatialObjectPoint")

  SET(MANAGED_TYPE_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedNoSmartPointerObject_TYPE.cxx.in)
  SET(MANAGED_WRAPPER_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedNoSmartPointerObject_WRAPPER.cxx.in)
  SET(MANAGED_SUBCLASS itk::itkNoSmartPointerObject)
  SET(MANGLED_PREFIX "SO")

  WRAP_TEMPLATE("3" "3")

  BEGIN_MANAGED_CONSTRUCTOR()
    SET(MANAGED_CONSTRUCTOR_SUMMARY        "Constructor.")
    SET(MANAGED_CONSTRUCTOR_TYPE_PARAMS    "void")
    SET(MANAGED_CONSTRUCTOR_WRAPPER_PARAMS "unsigned int dim")
    SET(MANAGED_CONSTRUCTOR_TYPE_BODY      "this->Initialise( ); this->m_PointerToNative = new NativeType( );")
    SET(MANAGED_CONSTRUCTOR_WRAPPER_BODY   "this->m_MangledTypeString = dim.ToString(); this->CreateInstance( nullptr );")
  END_MANAGED_CONSTRUCTOR()

  BEGIN_MANAGED_PROPERTY("Position" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the point of the point.")
    SET(MANAGED_PROPERTY_TYPE      "itkPoint^")
    SET(MANAGED_PROPERTY_GET_BODY  "return itk::ManagedTypes::ToManagedPoint<NativeType::PointType::PointDimension>( m_PointerToNative->GetPosition() );")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetPosition( itk::ManagedTypes::ToNativePoint<NativeType::PointType::PointDimension>(value) );")
  END_MANAGED_PROPERTY()

  BEGIN_MANAGED_PROPERTY("Tangent" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the tangent.")
    SET(MANAGED_PROPERTY_TYPE      "itkVector^")
    SET(MANAGED_PROPERTY_GET_BODY  "return itk::ManagedTypes::ToManagedVector<NativeType::PointType::PointDimension>( m_PointerToNative->GetTangent() );")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetTangent( itk::ManagedTypes::ToNativeVector<NativeType::PointType::PointDimension>(value) );")
  END_MANAGED_PROPERTY()

  BEGIN_MANAGED_PROPERTY("Normal1" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the first normal.")
    SET(MANAGED_PROPERTY_TYPE      "itkArray<double>^")
    SET(MANAGED_PROPERTY_GET_BODY  "return itk::ManagedTypes::ToManagedCovariantVector<double, NativeType::PointType::PointDimension>( m_PointerToNative->GetNormal1() );")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetNormal1( itk::ManagedTypes::ToNativeCovariantVector<double, NativeType::PointType::PointDimension>(value) );")
  END_MANAGED_PROPERTY()
  
  BEGIN_MANAGED_PROPERTY("Normal2" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the second normal.")
    SET(MANAGED_PROPERTY_TYPE      "itkArray<double>^")
    SET(MANAGED_PROPERTY_GET_BODY  "return itk::ManagedTypes::ToManagedCovariantVector<double, NativeType::PointType::PointDimension>( m_PointerToNative->GetNormal2() );")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetNormal2( itk::ManagedTypes::ToNativeCovariantVector<double, NativeType::PointType::PointDimension>(value) );")
  END_MANAGED_PROPERTY()
  
  BEGIN_MANAGED_PROPERTY("Radius" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the radius.")
    SET(MANAGED_PROPERTY_TYPE      "float")
    SET(MANAGED_PROPERTY_GET_BODY  "return m_PointerToNative->GetRadius();")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetRadius( value );")
  END_MANAGED_PROPERTY()

END_WRAP_CLASS()

WRAP_CLASS("itk::TubeSpatialObject")

  SET(MANAGED_TYPE_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedSpatialObject_TYPE.cxx.in)
  SET(MANAGED_WRAPPER_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedSpatialObject_WRAPPER.cxx.in)

  WRAP_INCLUDE_TYPE_AFTER_PRAGMA_MANAGED( "itkManagedTubeSpatialObjectPoint.cxx" )
  WRAP_INCLUDE_WRAPPER( "itkManagedTubeSpatialObjectPoint.cxx" )

  WRAP_TEMPLATE("3" "3")

  BEGIN_MANAGED_METHOD("ComputeTangentAndNormals")
    SET(MANAGED_METHOD_SUMMARY         "Calculate the normalized tangent.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "void")
    SET(MANAGED_METHOD_TYPE_BODY       "m_PointerToNative->ComputeTangentAndNormals( );")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->ComputeTangentAndNormals( );")
  END_MANAGED_METHOD()
  
  BEGIN_MANAGED_METHOD("RemoveDuplicatePoints")
    SET(MANAGED_METHOD_SUMMARY         "Remove duplicate points.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "void")
    SET(MANAGED_METHOD_TYPE_BODY       "m_PointerToNative->RemoveDuplicatePoints( );")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->RemoveDuplicatePoints( );")
  END_MANAGED_METHOD()

  BEGIN_MANAGED_PROPERTY("EndType" GETSET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get/set the type of tube end-type: 0 = flat, 1 = rounded.")
    SET(MANAGED_PROPERTY_TYPE      "unsigned int")
    SET(MANAGED_PROPERTY_GET_BODY  "return m_PointerToNative->GetEndType();")
    SET(MANAGED_PROPERTY_SET_BODY  "m_PointerToNative->SetEndType( value );")
  END_MANAGED_PROPERTY()
  
  BEGIN_MANAGED_PROPERTY("NumberOfPoints" GET)
    SET(MANAGED_PROPERTY_SUMMARY   "Get the number of points in the list.")
    SET(MANAGED_PROPERTY_TYPE      "unsigned int")
    SET(MANAGED_PROPERTY_GET_BODY  "return m_PointerToNative->GetNumberOfPoints();")
  END_MANAGED_PROPERTY()

  BEGIN_MANAGED_METHOD("GetPoint")
    SET(MANAGED_METHOD_SUMMARY         "Return a point in the list given the index.")
    SET(MANAGED_METHOD_RETURN_TYPE     "itkTubeSpatialObjectPoint^")
    SET(MANAGED_METHOD_PARAMS          "unsigned long index")
    SET(MANAGED_METHOD_TYPE_BODY       "itkTubeSpatialObjectPoint^ result = gcnew itkTubeSpatialObjectPoint(NativeType::ObjectDimension); result->NativePointer = IntPtr(m_PointerToNative->GetPoint( index )); return result;")
    SET(MANAGED_METHOD_WRAPPER_BODY    "return iInstance->GetPoint( index );")
  END_MANAGED_METHOD()

  BEGIN_MANAGED_METHOD("SetPoint")
    SET(MANAGED_METHOD_SUMMARY         "Set a point in the list at the specified index.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "unsigned long index, itkTubeSpatialObjectPoint^ point")
    SET(MANAGED_METHOD_TYPE_BODY       "NativeType::TubePointType* nativePoint = reinterpret_cast<NativeType::TubePointType*>(point->NativePointer.ToPointer()); m_PointerToNative->SetPoint( index, (*nativePoint) );")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->SetPoint( index, point );")
  END_MANAGED_METHOD()

  BEGIN_MANAGED_METHOD("RemovePoint")
    SET(MANAGED_METHOD_SUMMARY         "Remove a point in the list given the index.")
    SET(MANAGED_METHOD_RETURN_TYPE     "void")
    SET(MANAGED_METHOD_PARAMS          "unsigned long index")
    SET(MANAGED_METHOD_TYPE_BODY       "m_PointerToNative->RemovePoint( index );")
    SET(MANAGED_METHOD_WRAPPER_BODY    "iInstance->RemovePoint( index );")
  END_MANAGED_METHOD()

  SET(body "")
  SET(body "${body}// Create the array\n")
  SET(body "${body}\t\tunsigned long num = m_PointerToNative->GetNumberOfPoints( );\n")
  SET(body "${body}\t\tarray<itkTubeSpatialObjectPoint^>^ result = gcnew array<itkTubeSpatialObjectPoint^>( num );\n")
  SET(body "${body}\t\t\n")
  SET(body "${body}\t\t// Step through unmanaged array\n")
  SET(body "${body}\t\tNativeType::PointListType points = this->m_PointerToNative->GetPoints( );\n")
  SET(body "${body}\t\tfor (unsigned int i=0; i<points.size(); i++)\n")
  SET(body "${body}\t\t{\n")
  SET(body "${body}\t\t\tresult[i] = gcnew itkTubeSpatialObjectPoint(NativeType::ObjectDimension);\n")
  SET(body "${body}\t\t\tresult[i]->DisposeNativeObjectOnFinalize = false;\n")
  SET(body "${body}\t\t\tNativeType::TubePointType* point = (NativeType::TubePointType*)result[i]->NativePointer.ToPointer();\n")
  SET(body "${body}\t\t\t*(point) = points[i];\n")
  SET(body "${body}\t\t}\n")
  SET(body "${body}\t\treturn result;\n")

  BEGIN_MANAGED_METHOD("GetPoints")
    SET(MANAGED_METHOD_SUMMARY         "Returns a managed copy of the list of the tube points.")
    SET(MANAGED_METHOD_RETURN_TYPE     "array<itkTubeSpatialObjectPoint^>^")
    SET(MANAGED_METHOD_PARAMS          "void")
    SET(MANAGED_METHOD_TYPE_BODY       ${body})
    SET(MANAGED_METHOD_WRAPPER_BODY    "return iInstance->GetPoints( );")
  END_MANAGED_METHOD()


END_WRAP_CLASS()
