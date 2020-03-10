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
