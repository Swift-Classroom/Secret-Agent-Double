import Testing
@testable import SecretAgent

struct SecretAgentTests {
    let protected = protectSecret(
        "UMBRA will fill everyone's sugar bowls with salt!", withPassword: "P455w0rd")
    
    @Test func testPasswordSuccess() async throws {
        #expect(protected("P455w0rd") == "UMBRA will fill everyone's sugar bowls with salt!")
    }
    
    @Test func testPasswordFail() async throws {
        #expect(protected("hunter2") == "Sorry. No hidden secrets here.")
    }
    
    @Test func testCombination1() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let combo = generateCombination(forRoom: 1, usingFunction: { ($0 * 127 + 19) % 256 })
        #expect(combo == (146, 129, 18))
    }
    
    @Test func testCombination2() async throws {
        let combo = generateCombination(
            forRoom: 1,
            usingFunction: {
                ($0 * 73 + 161) % 256
            })
        #expect(combo == (234, 91, 148))
    }
    
}
