WRAP_CLASS("itk::BSplineInterpolateImageFunction")
  
  SET(MANAGED_TYPE_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedImageFunction_TYPE.cxx.in)
  SET(MANAGED_WRAPPER_TEMPLATE ${MANAGED_ITK_SOURCE_COMMON_PATH}/itkManagedImageFunction_WRAPPER.cxx.in)

  FOREACH(d ${WRAP_ITK_DIMS})
    FOREACH(t ${WRAP_ITK_SCALAR})
      WRAP_TEMPLATE("${ITKM_I${t}${d}}${ITKM_D}" "${ITKT_I${t}${d}},${ITKT_D}")
    ENDFOREACH(t)
  ENDFOREACH(d)
END_WRAP_CLASS()
