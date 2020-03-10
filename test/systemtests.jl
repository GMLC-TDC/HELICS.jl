
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

@testset "System Test Broker Creation" begin

    argv = ["", "--name=gbrokerc", "--timeout=2000", "--root"]

    brk = h.helicsCreateBrokerFromArgs("inproc", "", argv)
    @test h.helicsBrokerGetIdentifier(brk) == "gbrokerc"

    argv[2] = "--name=gbrokerc2"
    argv[3] = "--log-level=what_logs?"

    @test_throws h.HELICSErrorInvalidArgument brk2 = h.helicsCreateBrokerFromArgs("inproc", "", argv)

    h.helicsBrokerDisconnect(brk)

end

@testset "System Test Federate Global Value" begin

    brk = h.helicsCreateBroker("inproc", "gbrokerc", "--root")
    cr = h.helicsCreateCore("inproc", "gcore", "--broker=gbrokerc")

    # test creation of federateInfo from command line arguments
    argv = [
        ""
        "--corename=gcore"
        "--type=test"
        "--period=1.0"
    ]

    fi = h.helicsCreateFederateInfo()
    h.helicsFederateInfoLoadFromArgs(fi, argv)

    fed = h.helicsCreateValueFederate("fed0", fi)

    argv[4] = "--period=frogs" #this is meant to generate an error in command line processing

    fi2 = h.helicsFederateInfoClone(fi)
    @test_throws h.HELICSErrorInvalidArgument h.helicsFederateInfoLoadFromArgs(fi2, argv)

    h.helicsFederateInfoFree(fi2)
    h.helicsFederateInfoFree(fi)

    h.helicsBrokerDisconnect(brk)
    h.helicsCoreDisconnect(cr)

    @test h.helicsBrokerIsConnected(brk) == false

end
