include("init.jl")

@testset "ValueFederate Creation" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()
    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate State" begin

    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    state = h.helicsFederateGetState(vFed)
    @test state == 0

    h.helicsFederateEnterExecutingMode(vFed)

    state = h.helicsFederateGetState(vFed)
    @test state == 2

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate publication registration" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    pubid1 = h.helicsFederateRegisterTypePublication(vFed, "pub1", "string", "")
    pubid2 = h.helicsFederateRegisterGlobalTypePublication(vFed, "pub2", "int", "")
    pubid3 = h.helicsFederateRegisterTypePublication(vFed, "pub3", "double", "V")

    h.helicsFederateEnterExecutingMode(vFed)

    @test h.helicsPublicationGetKey(pubid1) == "TestA Federate/pub1"
    @test h.helicsPublicationGetKey(pubid2) == "pub2"

    @test h.helicsPublicationGetKey(pubid3) == "TestA Federate/pub3"
    @test h.helicsPublicationGetType(pubid3) == "double"
    @test h.helicsPublicationGetUnits(pubid3) == "V"

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate named point" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    defaultValue = "start of a longer string in place of the shorter one and now this should be very long"
    defVal = 5.3
    #testValue1 = "inside of the functional relationship of helics"
    testValue1 = "short string"
    testVal1 = 45.7823
    testValue2 = "I am a string"
    testVal2 = 0.0

    pubid = h.helicsFederateRegisterGlobalPublication(vFed, "pub1", h.HELICS_DATA_TYPE_NAMED_POINT, "")
    subid = h.helicsFederateRegisterSubscription(vFed, "pub1", "")

    h.helicsInputSetDefaultNamedPoint(subid, defaultValue, defVal)

    h.helicsFederateEnterExecutingMode(vFed)

    # publish string1 at time=0.0
    h.helicsPublicationPublishNamedPoint(pubid, testValue1, testVal1)

    @test h.helicsInputGetNamedPoint(subid) == (defaultValue, defVal)

    @test h.helicsFederateRequestTime(vFed, 1.0) == 0.01

    # # get the value
    @test h.helicsInputGetNamedPoint(subid) == (testValue1, testVal1)

    # publish a second string
    h.helicsPublicationPublishNamedPoint(pubid, testValue2, testVal2)

    # # make sure the value is still what we expect
    @test h.helicsInputGetNamedPoint(subid) == (testValue1, testVal1)
    # # make sure the string is what we expect
    # # @test value3 == testValue1
    # @test val3 == [testValue1, testVal1]

    # # advance time
    @test h.helicsFederateRequestTime(vFed, 2.0) == 0.02

    # # make sure the value was updated
    @test h.helicsInputGetNamedPoint(subid) == (testValue2, testVal2)

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)

end

@testset "ValueFederate Test Bool" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    defaultValue = true
    testValue1 = true
    testValue2 = false

    # register the publications
    pubid = h.helicsFederateRegisterGlobalPublication(vFed, "pub1", h.HELICS_DATA_TYPE_BOOLEAN, "")
    subid = h.helicsFederateRegisterSubscription(vFed, "pub1", "")

    h.helicsInputSetDefaultBoolean(subid, defaultValue)

    h.helicsFederateEnterExecutingMode(vFed)

    # publish string1 at time=0.0
    h.helicsPublicationPublishBoolean(pubid, testValue1)
    val = h.helicsInputGetBoolean(subid)

    @test val == defaultValue

    grantedtime = h.helicsFederateRequestTime(vFed, 1.0)
    @test grantedtime == 0.01

    # get the value
    val = h.helicsInputGetBoolean(subid)

    # make sure the string is what we expect
    @test val == testValue1

    # publish a second string
    h.helicsPublicationPublishBoolean(pubid, testValue2)

    # make sure the value is still what we expect
    val = h.helicsInputGetBoolean(subid)
    @test val == testValue1
    # advance time
    grantedtime = h.helicsFederateRequestTime(vFed, 2.0)
    # make sure the value was updated
    @test grantedtime == 0.02

    val = h.helicsInputGetBoolean(subid)
    @test val == testValue2

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)

end

@testset "ValueFederate publisher registration" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    pubid1 = h.helicsFederateRegisterPublication(vFed, "pub1", h.HELICS_DATA_TYPE_STRING, "")
    pubid2 = h.helicsFederateRegisterGlobalPublication(vFed, "pub2", h.HELICS_DATA_TYPE_INT, "")
    pubid3 = h.helicsFederateRegisterPublication(vFed, "pub3", h.HELICS_DATA_TYPE_DOUBLE, "V")
    h.helicsFederateEnterExecutingMode(vFed)

    publication_key = h.helicsPublicationGetKey(pubid1)
    @test publication_key == "TestA Federate/pub1"
    publication_type = h.helicsPublicationGetType(pubid1)
    @test publication_type == "string"
    publication_key = h.helicsPublicationGetKey(pubid2)
    @test publication_key == "pub2"
    publication_key = h.helicsPublicationGetKey(pubid3)
    @test publication_key == "TestA Federate/pub3"
    publication_type = h.helicsPublicationGetType(pubid3)
    @test publication_type == "double"
    publication_units = h.helicsPublicationGetUnits(pubid3)
    @test publication_units == "V"
    publication_type = h.helicsPublicationGetType(pubid2)
    @test publication_type == "int64"

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate subscription and publication registration" begin

    broker = createBroker()
    vFed, fedinfo = createValueFederate(1, "fed0")

    pubid = h.helicsFederateRegisterPublication(vFed, "pub1", h.HELICS_DATA_TYPE_STRING, "")
    pubid2 = h.helicsFederateRegisterGlobalPublication(vFed, "pub2", h.HELICS_DATA_TYPE_INT, "volts")
    pubid3 = h.helicsFederateRegisterTypePublication(vFed, "pub3", "double", "V")

    subid1 = h.helicsFederateRegisterSubscription(vFed, "sub1", "")
    subid2 = h.helicsFederateRegisterSubscription(vFed, "sub2", "")
    subid3 = h.helicsFederateRegisterSubscription(vFed, "sub3", "V")

    h.helicsFederateEnterExecutingMode(vFed)

    publication_type = h.helicsPublicationGetType(pubid3)
    @test publication_type == "double"

    sub_key = h.helicsSubscriptionGetKey(subid1)
    @test sub_key == "sub1"
    sub_type = h.helicsInputGetType(subid1)
    @test sub_type == ""
    sub_key = h.helicsSubscriptionGetKey(subid2)
    @test sub_key == "sub2"
    sub_key = h.helicsSubscriptionGetKey(subid3)
    @test sub_key == "sub3"
    sub_type = h.helicsInputGetType(subid3)
    @test sub_type == ""
    sub_units = h.helicsInputGetUnits(subid3)
    @test sub_units == "V"
    sub_type = h.helicsInputGetType(subid2)
    @test sub_type == ""

    subid_b = h.helicsFederateGetSubscription(vFed, "sub1")
    tmp = h.helicsSubscriptionGetKey(subid_b)
    @test tmp == "sub1"
    # check the getSubscriptionByIndex function
    subid_c = h.helicsFederateGetInputByIndex(vFed, 2)
    tmp = h.helicsInputGetUnits(subid_c)
    @test tmp == "V"
    # check publications

    sv = h.helicsPublicationGetKey(pubid)
    sv2 = h.helicsPublicationGetKey(pubid2)
    @test sv == "Testfed0/pub1"
    @test sv2 == "pub2"
    pub3name = h.helicsPublicationGetKey(pubid3)
    @test pub3name == "Testfed0/pub3"

    type = h.helicsPublicationGetType(pubid3)
    @test type == "double"
    units = h.helicsPublicationGetUnits(pubid3)
    @test units == "V"

    # check the getSubscription function

    pubid_b = h.helicsFederateGetPublication(vFed, "Testfed0/pub1")
    tmp = h.helicsPublicationGetType(pubid_b)
    @test tmp == "string"
    # check the getSubscriptionByIndex function
    pubid_c = h.helicsFederateGetPublicationByIndex(vFed, 1)
    tmp = h.helicsPublicationGetUnits(pubid_c)
    @test tmp == "volts"

    #this one should be invalid
    @test_throws h.HELICSErrorInvalidArgument pubid_d = h.helicsFederateGetPublicationByIndex(vFed, 5)

    h.helicsFederateFinalize(vFed)

    state = h.helicsFederateGetState(vFed)
    @test state == h.HELICS_STATE_FINALIZE

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)

end


@testset "ValueFederate single transfer" begin

    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    pubid = h.helicsFederateRegisterGlobalPublication(vFed, "pub1", h.HELICS_DATA_TYPE_STRING, "")
    subid = h.helicsFederateRegisterSubscription(vFed, "pub1", "")

    h.helicsFederateEnterExecutingMode(vFed)

    h.helicsPublicationPublishString(pubid, "string1")

    grantedtime = h.helicsFederateRequestTime(vFed, 1.0)
    @test grantedtime == 0.01

    s = h.helicsInputGetString(subid)
    @test s == "string1"

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate test double" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    defaultValue = 1.0
    testValue = 2.0
    pubid = h.helicsFederateRegisterGlobalPublication(vFed, "pub1", h.HELICS_DATA_TYPE_DOUBLE, "")
    subid = h.helicsFederateRegisterSubscription(vFed, "pub1", "")
    h.helicsInputSetDefaultDouble(subid, defaultValue)

    h.helicsFederateEnterExecutingMode(vFed)

    # publish string1 at time=0.0
    h.helicsPublicationPublishDouble(pubid, testValue)

    value = h.helicsInputGetDouble(subid)
    @test value == defaultValue

    grantedtime = h.helicsFederateRequestTime(vFed, 1.0)
    @test grantedtime == 0.01

    value = h.helicsInputGetDouble(subid)
    @test value == testValue

    # publish string1 at time=0.0
    h.helicsPublicationPublishDouble(pubid, testValue + 1)

    grantedtime = h.helicsFederateRequestTime(vFed, 2.0)
    @test grantedtime == 0.02

    value = h.helicsInputGetDouble(subid)
    @test value == testValue + 1

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate test complex" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    rDefaultValue = 1.0
    iDefaultValue = 1.0
    rTestValue = 2.0
    iTestValue = 2.0
    pubid = h.helicsFederateRegisterGlobalPublication(vFed, "pub1", h.HELICS_DATA_TYPE_COMPLEX, "")
    subid = h.helicsFederateRegisterSubscription(vFed, "pub1", "")
    h.helicsInputSetDefaultComplex(subid, (rDefaultValue + im * iDefaultValue))

    h.helicsFederateEnterExecutingMode(vFed)

    # publish string1 at time=0.0
    h.helicsPublicationPublishComplex(pubid, (rTestValue + im * iTestValue))

    @test rDefaultValue + im * iDefaultValue == h.helicsInputGetComplex(subid)

    grantedtime = h.helicsFederateRequestTime(vFed, 1.0)
    @test grantedtime == 0.01

    @test (rTestValue + im * iTestValue) == h.helicsInputGetComplex(subid)

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate test integer" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    defaultValue = 1
    testValue = 2
    pubid = h.helicsFederateRegisterGlobalPublication(vFed, "pub1", h.HELICS_DATA_TYPE_INT, "")
    subid = h.helicsFederateRegisterSubscription(vFed, "pub1", "")
    h.helicsInputSetDefaultInteger(subid, defaultValue)

    h.helicsFederateEnterExecutingMode(vFed)

    h.helicsPublicationPublishInteger(pubid, testValue)

    value = h.helicsInputGetInteger(subid)
    @test value == defaultValue

    grantedtime = h.helicsFederateRequestTime(vFed, 1.0)
    @test grantedtime == 0.01

    value = h.helicsInputGetInteger(subid)
    @test value == testValue

    h.helicsPublicationPublishInteger(pubid, testValue + 1)

    grantedtime = h.helicsFederateRequestTime(vFed, 2.0)
    @test grantedtime == 0.02

    value = h.helicsInputGetInteger(subid)
    @test value == testValue + 1

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate test string" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    defaultValue = "String1"
    testValue = "String2"
    pubid = h.helicsFederateRegisterGlobalPublication(vFed, "pub1", h.HELICS_DATA_TYPE_STRING, "")
    subid = h.helicsFederateRegisterSubscription(vFed, "pub1", "")
    h.helicsInputSetDefaultString(subid, defaultValue)

    h.helicsFederateEnterExecutingMode(vFed)

    h.helicsPublicationPublishString(pubid, testValue)

    value = h.helicsInputGetString(subid)
    @test value == defaultValue

    grantedtime = h.helicsFederateRequestTime(vFed, 1.0)
    @test grantedtime == 0.01

    value = h.helicsInputGetString(subid)
    @test value == testValue

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate test vectorD" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    defaultValue = [0.0, 1.0, 2.0]
    testValue = [3.0, 4.0, 5.0]
    pubid = h.helicsFederateRegisterGlobalPublication(vFed, "pub1", h.HELICS_DATA_TYPE_VECTOR, "")
    subid = h.helicsFederateRegisterSubscription(vFed, "pub1", "")
    h.helicsInputSetDefaultVector(subid, defaultValue)

    h.helicsFederateEnterExecutingMode(vFed)

    h.helicsPublicationPublishVector(pubid, testValue)

    @test h.helicsInputGetVector(subid) == defaultValue

    grantedtime = h.helicsFederateRequestTime(vFed, 1.0)
    @test grantedtime == 0.01

    value = h.helicsInputGetVector(subid)

    @test value == testValue

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)
end

@testset "ValueFederate test single transfer" begin
    broker = createBroker()
    vFed, fedinfo = createValueFederate()

    s = "n2"

    pubid = h.helicsFederateRegisterGlobalPublication(vFed, "pub1", h.HELICS_DATA_TYPE_STRING, "")
    subid = h.helicsFederateRegisterSubscription(vFed, "pub1", "")

    h.helicsFederateEnterExecutingMode(vFed)

    h.helicsPublicationPublishString(pubid, "string1")

    grantedtime = h.helicsFederateRequestTime(vFed, 1.0)
    @test grantedtime == 0.01

    s = h.helicsInputGetString(subid)

    @test s == "string1"

    time = h.helicsInputLastUpdateTime(subid)
    @test time == 0.01

    h.helicsPublicationPublishString(pubid, "string2")

    destroyFederate(vFed, fedinfo)
    destroyBroker(broker)

end

@testset "ValueFederate default value tests" begin
    broker = createBroker()
    vFed1, fedinfo = createValueFederate(1, "fed0")

    inp_raw1 = h.helicsFederateRegisterInput(vFed1, "key1", h.HELICS_DATA_TYPE_RAW, "raw")
    inp_raw2 = h.helicsFederateRegisterInput(vFed1, "key2", h.HELICS_DATA_TYPE_RAW, "raw")

    inp_bool = h.helicsFederateRegisterInput(vFed1, "key3", h.HELICS_DATA_TYPE_BOOLEAN, "")

    inp_time = h.helicsFederateRegisterInput(vFed1, "key4", h.HELICS_DATA_TYPE_TIME, "")

    inp_char = h.helicsFederateRegisterInput(vFed1, "key5", h.HELICS_DATA_TYPE_STRING, "")

    inp_vect = h.helicsFederateRegisterInput(vFed1, "key6", h.HELICS_DATA_TYPE_VECTOR, "V")

    inp_double = h.helicsFederateRegisterInput(vFed1, "key7", h.HELICS_DATA_TYPE_DOUBLE, "kW")

    inp_double2 = h.helicsFederateRegisterInput(vFed1, "key8", h.HELICS_DATA_TYPE_DOUBLE, "")

    inp_np = h.helicsFederateRegisterInput(vFed1, "key9", h.HELICS_DATA_TYPE_NAMED_POINT, "")

    h.helicsInputSetMinimumChange(inp_double, 1100.0)
    h.helicsInputSetDefaultDouble(inp_double, 10000.0)

    h.helicsInputSetOption(inp_double2, h.HELICS_HANDLE_OPTION_CONNECTION_REQUIRED, true)

    pub = h.helicsFederateRegisterPublication(vFed1, "", h.HELICS_DATA_TYPE_INT, "MW")
    h.helicsPublicationSetOption(pub, h.HELICS_HANDLE_OPTION_CONNECTION_REQUIRED, true)
    h.helicsPublicationAddTarget(pub, "Testfed0/key7")
    h.helicsPublicationAddTarget(pub, "Testfed0/key8")

    h.helicsInputSetDefaultRaw(inp_raw1, "")
    data = "this is a string"
    h.helicsInputSetDefaultRaw(inp_raw2, data)

    h.helicsInputSetDefaultBoolean(inp_bool, true)

    h.helicsInputSetDefaultTime(inp_time, 12.3)
    h.helicsInputSetDefaultChar(inp_char, 'q')
    h.helicsInputSetDefaultVector(inp_vect, Float64[])
    h.helicsInputSetDefaultNamedPoint(inp_np, data, 15.7)

    h.helicsFederateEnterExecutingMode(vFed1)
    @test h.helicsInputGetInjectionUnits(inp_double) == "MW"
    @test h.helicsInputGetInjectionUnits(inp_double2) == "MW"
    @test h.helicsInputGetType(inp_double) == "double"
    @test h.helicsInputGetPublicationType(inp_double) == "int64"

    c2 = h.helicsInputGetChar(inp_char)
    @test c2 == 'q'
    h.helicsInputGetVector(inp_vect)

    optset = h.helicsInputGetOption(inp_double2, h.HELICS_HANDLE_OPTION_CONNECTION_REQUIRED)
    @test optset == true

    optset = h.helicsPublicationGetOption(pub, h.HELICS_HANDLE_OPTION_CONNECTION_REQUIRED)
    @test optset == true
    h.helicsPublicationPublishInteger(pub, 12)

    h.helicsFederateRequestNextStep(vFed1)
    @test h.helicsInputGetDouble(inp_double) == 12000.0
    @test h.helicsInputGetDouble(inp_double2) == 12.0

    h.helicsPublicationPublishInteger(pub, 13)

    h.helicsFederateRequestNextStep(vFed1)
    @test h.helicsInputIsUpdated(inp_double) == false
    @test h.helicsInputIsUpdated(inp_double2) == true

    @test h.helicsInputGetDouble(inp_double) == 12000.0
    @test h.helicsInputGetDouble(inp_double2) == 13.0

    h.helicsPublicationPublishInteger(pub, 15)

    h.helicsFederateRequestNextStep(vFed1)

    @test h.helicsInputIsUpdated(inp_double) == true
    @test h.helicsInputIsUpdated(inp_double2) == true

    h.helicsInputClearUpdate(inp_double)
    h.helicsInputClearUpdate(inp_double2)

    @test h.helicsInputIsUpdated(inp_double) == false
    @test h.helicsInputIsUpdated(inp_double2) == false

    _, rval = h.helicsInputGetNamedPoint(inp_np)
    @test rval == 15.7

    out, rval = h.helicsInputGetNamedPoint(inp_np)
    @test out == "this is a string"
    @test rval == 15.7

    h.helicsFederateFinalize(vFed1)

end
