
@testset "System Test Core Creation" begin
    brk = h.helicsCreateBroker("inproc", "gbrokerc", "--root")

    argv = ["", "--name=gcore", "--timeout=2000", "--broker=gbrokerc"]

    cr = h.helicsCreateCoreFromArgs("inproc", "", argv)
    @test h.helicsCoreGetIdentifier(cr) == "gcore"

    argv = ["--name=gcore2", "--log-level=what_logs?"]

    @test_throws h.HELICSErrorInvalidArgument cr2 = h.helicsCreateCoreFromArgs("inproc", "", argv)

    h.helicsBrokerDisconnect(brk)
    h.helicsCoreDisconnect(cr)

    @test h.helicsBrokerIsConnected(brk) == false
end
