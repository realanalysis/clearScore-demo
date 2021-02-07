public struct DTOResponseCredit: Codable {
    public private(set) var accountIDVStatus: String?
    public private(set) var creditReportInfo: DTOCreditReportInfo?
    public private(set) var dashboardStatus: String?
    public private(set) var personaType: String?
    public private(set) var coachingSummary: DTOCoachingSummary?
    public private(set) var augmentedCreditScore: Int?

}
