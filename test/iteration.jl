include("init.jl")

@testset "Iteration execution_iteration_test" begin

    broker = createBroker(1)
    vFed1, fedinfo = createValueFederate(1, "fed0")
    # register the publications

    pubid = h.helicsFederateRegisterGlobalPublication(vFed1, "pub1", h.HELICS_DATA_TYPE_DOUBLE, "")

    subid = h.helicsFederateRegisterSubscription(vFed1, "pub1", "")
    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_DELTA, 1.0)

    h.helicsFederateEnterInitializingMode(vFed1)
    h.helicsPublicationPublishDouble(pubid, 27.0)

    comp = h.helicsFederateEnterExecutingModeIterative(vFed1, h.HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED)
    @test comp == h.HELICS_ITERATION_RESULT_ITERATING
    val = h.helicsInputGetDouble(subid)
    @test val == 27.0

    comp = h.helicsFederateEnterExecutingModeIterative(vFed1, h.HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED)

    @test comp == h.HELICS_ITERATION_RESULT_NEXT_STEP

    val2 = h.helicsInputGetDouble(subid)

    @test val2 == val

    h.helicsFederateFinalize(vFed1)
    destroyFederate(vFed1, fedinfo)
    destroyBroker(broker)
end

@testset "Iteration async test" begin

    broker = createBroker(1)
    vFed1, fedinfo1 = createValueFederate(1, "fed0")
    vFed2, fedinfo2 = createValueFederate(1, "fed1")

    # register the publications
    pub1 = h.helicsFederateRegisterGlobalPublication(vFed1, "pub1", h.HELICS_DATA_TYPE_INT)

    sub1 = h.helicsFederateRegisterSubscription(vFed2, "pub1")
    pub2 = h.helicsFederateRegisterGlobalPublication(vFed2, "pub2", h.HELICS_DATA_TYPE_INT)

    sub2 = h.helicsFederateRegisterSubscription(vFed1, "pub2")
    h.helicsFederateSetTimeProperty(vFed1, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)
    h.helicsFederateSetTimeProperty(vFed2, h.HELICS_PROPERTY_TIME_PERIOD, 1.0)
    # vFed1->setLoggingLevel(5)
    # vFed2->setLoggingLevel(5)

    h.helicsFederateEnterInitializingModeAsync(vFed1)
    h.helicsFederateEnterInitializingMode(vFed2)
    h.helicsFederateEnterInitializingModeComplete(vFed1)

    c1 = 0
    c2 = 0

    h.helicsPublicationPublishInteger(pub1, c1)
    h.helicsPublicationPublishInteger(pub2, c2)

    h.helicsFederateEnterExecutingModeAsync(vFed1)
    h.helicsFederateEnterExecutingMode(vFed2)
    h.helicsFederateEnterExecutingModeComplete(vFed1)

    while c1 <= 10
        h.helicsInputGetInteger(sub1), c1
        h.helicsInputGetInteger(sub2), c2
        c1 += 1
        c2 += 1

        if c1 <= 10
            h.helicsPublicationPublishInteger(pub1, c1)
            h.helicsPublicationPublishInteger(pub2, c2)
        end

        h.helicsFederateRequestTimeIterativeAsync(vFed1, 1.0, h.HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED)

        grantedTime, state = h.helicsFederateRequestTimeIterative(vFed2, 1.0, h.HELICS_ITERATION_REQUEST_ITERATE_IF_NEEDED)
        if c1 <= 10
            @test state == h.HELICS_ITERATION_RESULT_ITERATING
            @test grantedTime == 0.0
        else
            @test state == h.HELICS_ITERATION_RESULT_NEXT_STEP
            @test grantedTime == 1.0
        end

        grantedTime, state = h.helicsFederateRequestTimeIterativeComplete(vFed1)
        if c1 <= 10
            @test state == h.HELICS_ITERATION_RESULT_ITERATING
            @test grantedTime == 0.0
        else
            @test state == h.HELICS_ITERATION_RESULT_NEXT_STEP
            @test grantedTime == 1.0
        end
    end

end
