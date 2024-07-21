class LLMResponse {
  String causes = "";
  String description = "";
  String treatement = "";

  LLMResponse({causes_, treatement_, description_}) {
    causes = causes_;
    description = description_;
    treatement = treatement_;
  }
}

class DiagnosisResponseAPI {
  double accuracy = 0.0;
  String disease = "";
  LLMResponse? llmResponse;
  String medicine = "";

  DiagnosisResponseAPI({
    accuracy_,
    disease_,
    medicine_,
    causes_,
    treatement_,
    description_,
  }) {
    accuracy = accuracy_;
    disease = disease_;
    medicine = medicine_;

    llmResponse = LLMResponse(
      causes_: causes_,
      description_: description_,
      treatement_: treatement_,
    );
  }
}
