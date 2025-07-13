predecir_retencion <- function(data, modelo = "logit", test_size = 0.3, seed = 42, return_model = FALSE) {
  set.seed(seed)
  idx <- caret::createDataPartition(data$retencion, p = 1 - test_size, list = FALSE)
  train <- data[idx, ]
  test <- data[-idx, ]
  
  model <- switch(modelo,
                  logit = glm(retencion ~ ., data = train, family = binomial),
                  rf = randomForest::randomForest(x = train %>% select(-retencion), y = as.factor(train$retencion)),
                  stop("Modelo no soportado"))
  
  pred <- if (modelo == "logit") predict(model, test, type = "response") > 0.5 else predict(model, test %>% select(-retencion))
  acc <- mean(pred == test$retencion)
  cat("Precisión del modelo:", round(acc * 100, 2), "%\n")
  if (return_model) return(model)
}
