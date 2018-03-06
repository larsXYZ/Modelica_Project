within WasteWater.ASM1;
package Examples "Demonstration examples of the components of the ASM1 library"

  extends Modelica.Icons.Library;


  class BenchPlant "COST Benchmark WWTP Configuration"
    import WasteWater;

    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark
    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
    extends Modelica.Icons.Example;

    ASM1.EffluentSink Effluent annotation (Placement(transformation(extent={{88,
              -28},{108,-8}})));
    ASM1.SludgeSink WasteSludge annotation (Placement(transformation(extent={{
              87,-51},{107,-31}})));
    ASM1.SecClarModTakacs Settler annotation (Placement(transformation(extent={
              {48,-5},{68,15}})));
    ASM1.divider2 divider annotation (Placement(transformation(extent={{20,-6},
              {40,14}})));
    WasteWater.ASM1.nitri_old tank5(V=1333, Kla=84)
      annotation (Placement(transformation(extent={{-6,-6},{14,14}})));
    WasteWater.ASM1.nitri_old tank4(V=1333, Kla=240)
      annotation (Placement(transformation(extent={{-32,-6},{-12,14}})));
    WasteWater.ASM1.nitri_old tank3(V=1333, Kla=240)
      annotation (Placement(transformation(extent={{-58,-5},{-38,15}})));
    ASM1.deni tank2 annotation (Placement(transformation(extent={{-48,22},{-28,
              42}})));
    ASM1.deni tank1 annotation (Placement(transformation(extent={{-76,22},{-56,
              42}})));
    ASM1.mixer3 mixer annotation (Placement(transformation(extent={{-104,22},{
              -84,42}})));
    ASM1.sensor_NO sensor_NO annotation (Placement(transformation(extent={{-42,
              48},{-22,68}})));
    ASM1.sensor_O2 sensor_O2 annotation (Placement(transformation(extent={{1,25},
              {18,42}})));
    Modelica.Blocks.Sources.Constant Qa(k=55338)
      annotation (Placement(transformation(extent={{-75,-65},{-55,-45}})));
    ASM1.pump RecyclePump(Q_max=55338) annotation (Placement(transformation(
          origin={-84,-12},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM1.pump ReturnPump(Q_max=18446) annotation (Placement(transformation(
          origin={26,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM1.pump WastePump(Q_max=385) annotation (Placement(transformation(extent=
              {{59,-55},{79,-35}})));
    Modelica.Blocks.Sources.Constant Qr(k=18446)
      annotation (Placement(transformation(extent={{22,-68},{42,-48}})));
    sensor_NH sensor_NH1 annotation (Placement(transformation(extent={{64,15},{
              80,31}})));
    WasteWater.ASM1.sensor_NO sensor_NO1 annotation (Placement(transformation(
            extent={{81,15},{97,31}})));
    WasteWater.ASM1.sensor_TKN sensor_TKN1 annotation (Placement(transformation(
            extent={{97,14},{113,30}})));
    WasteWater.ASM1.sensor_COD sensor_COD1 annotation (Placement(transformation(
            extent={{97,-5},{113,11}})));
    WasteWater.ASM1.sensor_TSS sensor_TSS1 annotation (Placement(transformation(
            extent={{32,15},{48,30}})));
    Modelica.Blocks.Sources.Constant Temperature(k=15)
      annotation (Placement(transformation(extent={{-104,49},{-84,69}})));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime(
      fileName=Modelica.Utilities.Files.loadResource("modelica://WasteWater/Resources/ASM1/Inf_dry.txt"),
      table=[0,0; 1,1],
      columns=integer(({16,3,4,5,6,7,8,9,10,11,12,13,14,15})),
      tableName="Inf_dry",
      tableOnFile=("Inf_dry") <> "NoName") annotation (Placement(transformation(
            extent={{-111,79},{-91,99}})));
    WasteWater.ASM1.WWSource wWSource
      annotation (Placement(transformation(extent={{-83,79},{-63,99}})));
  equation
    connect(divider.Out1, Settler.Feed) annotation (Line(points={{40,6.6},{44,
            6.6},{44,6.4},{48,6.4}}));
    connect(tank5.Out, divider.In) annotation (Line(points={{14,4},{17,4},{17,
            4.3},{20,4.3}}));
    connect(tank4.Out, tank5.In) annotation (Line(points={{-12,4},{-6,4}}));
    connect(tank3.Out, tank4.In) annotation (Line(points={{-38,5},{-35,5},{-35,
            4},{-32,4}}));
    connect(tank3.In, tank2.Out) annotation (Line(points={{-58,5},{-70,5},{-70,
            18},{-18,18},{-18,32},{-28,32}}));
    connect(tank1.Out, tank2.In) annotation (Line(points={{-56,32},{-48,32}}));
    connect(mixer.Out, tank1.In) annotation (Line(points={{-84,31.6},{-80,31.6},
            {-80,32},{-76,32}}));
    connect(sensor_NO.In, tank2.MeasurePort) annotation (Line(points={{-32,48},
            {-32,36.5},{-32.5,36.5}}));
    connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,2.5},{44,
            2.5},{44,-9},{-15,-9},{-15,-8.7},{-74,-8.7}}));
    connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-94,-14.8},{
            -104,-14.8},{-104,27.5}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{55,-4.6},{
            55,-22.7},{36,-22.7}}));
    connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{16,-28.8},{
            14.5,-28.8},{14.5,-29},{-113,-29},{-113,31.5},{-104,31.5}}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{79,-42.2},
            {81,-42.2},{81,-42},{83,-42},{83,-42.2},{87,-42.2}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{59,-48.3},{
            52,-48.3},{52,-31},{61,-31},{61,-4.6}}));
    connect(WastePump.u, Qr.y) annotation (Line(points={{60.1,-42.5},{46,-42.5},
            {46,-58},{43,-58}}, color={0,0,255}));
    connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{72,15},{
            72,10.7},{68.2,10.7}}));
    connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{89,15},{
            89,10.7},{68.2,10.7}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{105,14},
            {105,10.7},{68.2,10.7}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{105,-5},
            {105,10.7},{68.2,10.7}}));
    connect(Effluent.In, Settler.Effluent) annotation (Line(points={{88,-16},{
            78.5,-16},{78.5,10.7},{68.2,10.7}}));
    connect(Qr.y, ReturnPump.u) annotation (Line(points={{43,-58},{46,-58},{46,
            -28.5},{34.9,-28.5}}, color={0,0,255}));
    connect(tank5.MeasurePort, sensor_O2.In) annotation (Line(points={{9.5,8.5},
            {9.5,17},{9.5,25}}));
    connect(sensor_TSS1.In, divider.Out1) annotation (Line(points={{40,15},{40,
            6.6}}));

    connect(Qa.y, RecyclePump.u) annotation (Line(
        points={{-54,-55},{-46,-55},{-46,-14.5},{-75.1,-14.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temperature.y, tank1.T) annotation (Line(
        points={{-83,59},{-78,59},{-78,36},{-76,36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temperature.y, tank2.T) annotation (Line(
        points={{-83,59},{-51,59},{-51,36},{-48,36}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(tank5.T, tank2.T) annotation (Line(
        points={{-6,8},{-6,72},{-51,72},{-51,36},{-48,36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tank4.T, tank2.T) annotation (Line(
        points={{-32,8},{-37,8},{-37,15},{-6,15},{-6,72},{-51,72},{-51,36},{-48,
            36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tank3.T, tank2.T) annotation (Line(
        points={{-58,9},{-63,9},{-63,15},{-6,15},{-6,72},{-51,72},{-51,36},{-48,
            36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(CombiTableTime.y, wWSource.data) annotation (Line(
        points={{-90,89},{-82,89}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(wWSource.Out, mixer.In1) annotation (Line(
        points={{-63.2,82},{-111,82},{-111,35.5},{-104,35.5}},
        color={0,0,0},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-120,-100},{120,105}},
          grid={1,1}), graphics),
      Documentation(info="This ASM1 plant consists of 2 denitrification tanks (tank1 and tank2),
3 nitrification tanks (tank3 - tank5) and a secondary clarifier by Takacs.
Furthermore there are 2 control loops modelled.
This configuration corresponds to the COST simulation benchmark [1].

Change into the directory ../ASM1 and translate the model.
Before simulating the model load initial values from the script file bench_asm1.mos
that is provided besides the model.
A 14 days dynamic influent data file is provided. So you may simulate up to 14 days.
But start with 1 day as it may take some time for simulation.
After simulation you may have a look at internal concentrations but most interesting
are the relevant concentrations at the effluent of a plant which can be viewed via the
sensors at the effluent of the secondary clarifier.

References:

[1] J.B. Copp: The COST Simulation Benchmark. 2000. http://www.ensic.u-nancy.fr/COSTWWTP/


PS: For those who want to reproduce the exact figures from the COST simulation benchmark some remarks:
    The aeration system in this library is different from that in COST, so be sure to produce an airflow
    corresponding to the desired Kla in COST. Furthermore in this library biological parameters are standard
    parameters from the ASM1 distribution and implemented with temperature dependency which may vary a bit from
    the parameter set used in COST.
    But it is possible. During the validation phase of this library the steady state and dynamic results
    from the COST simulation benchmark could exactly be reproduced.
"),   experiment(
        StopTime=14,
        __Dymola_NumberOfIntervals=5000,
        __Dymola_Algorithm="lsodar"),
      __Dymola_experimentSetupOutput);
  end BenchPlant;


  model JenaSecClarModTakacs
    "Secondary Clarifier Model based on Takacs prepared for a special plant"

    extends WasteWater.Icons.SecClar;
    extends ASM1.SecClar.Takacs.Interfaces.ratios;
    package SCP = ASM1.SecClar.Takacs;
    import SI = Modelica.SIunits;
    package WI = ASM1.Interfaces;
    package WWU = WasteWater.WasteWaterUnits;
    parameter SI.Length hsc=4.0 "height of secondary clarifier";
    parameter Integer n=10 "number of layers of SC model";
    parameter SI.Length zm=hsc/(1.0*n)
      "height of m-th secondary clarifier layer";
    parameter SI.Area Asc=1500.0 "area of secondary clarifier";
    parameter WWU.MassConcentration Xt=3000.0 "threshold for X";
    // total sludge concentration in clarifier feed
    WWU.MassConcentration Xf;
    // layers 1 to 10
    WI.WWFlowAsm1in Feed annotation (Placement(transformation(extent={{-110,4},
              {-90,24}})));
    WI.WWFlowAsm1out Effluent annotation (Placement(transformation(extent={{92,
              47},{112,67}})));
    WI.WWFlowAsm1out Return annotation (Placement(transformation(extent={{-40,
              -106},{-20,-86}})));
    WI.WWFlowAsm1out Waste annotation (Placement(transformation(extent={{20,
              -106},{40,-86}})));
    SCP.bottom_layer S1(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      rXs=rXs,
      rXbh=rXbh,
      rXba=rXba,
      rXp=rXp,
      rXi=rXi,
      rXnd=rXnd) annotation (Placement(transformation(extent={{-35,-93},{35,-78}})));
    SCP.lower_layer S2(
      zm=zm,
      Asc=Asc,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,-74},{35,-59}})));
    SCP.lower_layer S3(
      zm=zm,
      Asc=Asc,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,-55},{35,-40}})));
    SCP.feed_layer S4(
      zm=zm,
      Asc=Asc,
      Xf=Xf) annotation (Placement(transformation(extent={{-36,-36},{34,-22}})));
    SCP.upper_layer S5(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-36,-16},{34,-4}})));
    SCP.upper_layer S6(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-36,2},{34,16}})));
    SCP.upper_layer S7(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-35,21},{35,36}})));
    SCP.upper_layer S8(
      zm=zm,
      Asc=Asc,
      Xt=Xt,
      Xf=Xf) annotation (Placement(transformation(extent={{-35,40},{35,55}})));
    SCP.upper_layer S9(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt) annotation (Placement(transformation(extent={{-35,59},{35,74}})));
    SCP.top_layer S10(
      zm=zm,
      Asc=Asc,
      Xf=Xf,
      Xt=Xt,
      rXs=rXs,
      rXbh=rXbh,
      rXba=rXba,
      rXp=rXp,
      rXi=rXi,
      rXnd=rXnd) annotation (Placement(transformation(extent={{-35,78},{35,93}})));
  equation

    connect(S1.Up, S2.Dn) annotation (Line(points={{-2.22045e-15,-78},{
            -2.22045e-15,-74}}));
    connect(S2.Up, S3.Dn) annotation (Line(points={{-2.22045e-15,-59},{
            -2.22045e-15,-55}}));
    connect(S7.Up, S8.Dn) annotation (Line(points={{-2.22045e-15,36},{
            -2.22045e-15,40}}));
    connect(S9.Up, S10.Dn) annotation (Line(points={{-2.22045e-15,74},{
            -2.22045e-15,78}}));
    connect(S8.Up, S9.Dn) annotation (Line(points={{-2.22045e-15,55},{
            -2.22045e-15,59}}));
    connect(S1.PQw, Waste) annotation (Line(points={{17.5,-93},{30,-93},{30,-96}}));
    connect(S10.Out, Effluent) annotation (Line(points={{35,85.5},{67.5,85.5},{
            67.5,57},{102,57}}));
    connect(S1.PQr, Return) annotation (Line(points={{-21,-93},{-30,-93},{-30,
            -96}}));
    connect(S4.Dn, S3.Up) annotation (Line(points={{-1,-36},{-1,-38},{0,-38},{0,
            -40}}));
    connect(S4.Up, S5.Dn) annotation (Line(points={{-1,-22},{-2,-22},{-2,-22},{
            0,-22},{-2,-22},{-2,-16}}));
    connect(S5.Up, S6.Dn) annotation (Line(points={{-1,-4},{-2,-4},{-2,-4},{-2,
            -2},{0,-2},{0,2}}));
    connect(S6.Up, S7.Dn) annotation (Line(points={{-1,16},{-1,18},{0,18},{0,21}}));
    connect(Feed, S4.In) annotation (Line(points={{-100,14},{-67.5,14},{-67.5,
            -28.72},{-36,-28.72}}));

    // total sludge concentration in clarifier feed
    Xf = 0.75*(Feed.Xs + Feed.Xbh + Feed.Xba + Feed.Xp + Feed.Xi);

    // ratios of solid components
    rXs = Feed.Xs/Xf;
    rXbh = Feed.Xbh/Xf;
    rXba = Feed.Xba/Xf;
    rXp = Feed.Xp/Xf;
    rXi = Feed.Xi/Xf;
    rXnd = Feed.Xnd/Xf;

    annotation (
      Documentation(info="This component models an ASM1 10 - layer secondary clarifier with 6 layers above the feed_layer (including top_layer)
and 3 layers below the feed_layer (including bottom_layer).

Parameters:
  hsc -  height of clarifier [m]
  n   -  number of layers
  Asc -  surface area of sec. clar. [m2]
  Xt  -  threshold value for Xtss [mg/l]
"));
  end JenaSecClarModTakacs;

  class BenchPlant2 "COST Benchmark WWTP Configuration"
    import WasteWater;

    //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark
    //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
    extends Modelica.Icons.Example;

    ASM1.EffluentSink Effluent annotation (Placement(transformation(extent={{88,
              -28},{108,-8}})));
    ASM1.SludgeSink WasteSludge annotation (Placement(transformation(extent={{
              87,-51},{107,-31}})));
    ASM1.SecClarModTakacs Settler annotation (Placement(transformation(extent={
              {48,-5},{68,15}})));
    ASM1.divider2 divider annotation (Placement(transformation(extent={{20,-6},
              {40,14}})));
    WasteWater.ASM1.nitri_constant tank5(V=1333)
      annotation (Placement(transformation(extent={{-5,-6},{15,14}})));
    WasteWater.ASM1.nitri_variable tank4(V=1333)
      annotation (Placement(transformation(extent={{-31,-6},{-11,14}})));
    WasteWater.ASM1.nitri_variable tank3(V=1333)
      annotation (Placement(transformation(extent={{-57,-5},{-37,15}})));
    ASM1.deni tank2 annotation (Placement(transformation(extent={{-48,22},{-28,
              42}})));
    ASM1.deni tank1 annotation (Placement(transformation(extent={{-76,22},{-56,
              42}})));
    ASM1.mixer3 mixer annotation (Placement(transformation(extent={{-104,22},{
              -84,42}})));
    ASM1.sensor_NO sensor_NO annotation (Placement(transformation(extent={{-42,
              48},{-22,68}})));
    ASM1.sensor_O2 sensor_O2 annotation (Placement(transformation(extent={{3,25},{
              20,42}})));
    Modelica.Blocks.Sources.Constant Qa(k=55338)
      annotation (Placement(transformation(extent={{-75,-65},{-55,-45}})));
    ASM1.pump RecyclePump(Q_max=55338) annotation (Placement(transformation(
          origin={-84,-12},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM1.pump ReturnPump(Q_max=18446) annotation (Placement(transformation(
          origin={26,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    ASM1.pump WastePump(Q_max=385) annotation (Placement(transformation(extent=
              {{59,-55},{79,-35}})));
    Modelica.Blocks.Sources.Constant Qr(k=18446)
      annotation (Placement(transformation(extent={{22,-68},{42,-48}})));
    sensor_NH sensor_NH1 annotation (Placement(transformation(extent={{64,15},{
              80,31}})));
    WasteWater.ASM1.sensor_NO sensor_NO1 annotation (Placement(transformation(
            extent={{81,15},{97,31}})));
    WasteWater.ASM1.sensor_TKN sensor_TKN1 annotation (Placement(transformation(
            extent={{97,14},{113,30}})));
    WasteWater.ASM1.sensor_COD sensor_COD1 annotation (Placement(transformation(
            extent={{97,-5},{113,11}})));
    WasteWater.ASM1.sensor_TSS sensor_TSS1 annotation (Placement(transformation(
            extent={{32,15},{48,30}})));
    Modelica.Blocks.Sources.Constant Temperature(k=15)
      annotation (Placement(transformation(extent={{-104,49},{-84,69}})));
    Modelica.Blocks.Sources.CombiTimeTable CombiTableTime(
      fileName=Modelica.Utilities.Files.loadResource("modelica://WasteWater/Resources/ASM1/Inf_dry.txt"),
      table=[0,0; 1,1],
      columns=integer(({16,3,4,5,6,7,8,9,10,11,12,13,14,15})),
      tableName="Inf_dry",
      tableOnFile=("Inf_dry") <> "NoName") annotation (Placement(transformation(
            extent={{-111,77},{-91,97}})));
    WasteWater.ASM1.WWSource wWSource1
      annotation (Placement(transformation(extent={{-83,77},{-63,97}})));
  equation
    connect(divider.Out1, Settler.Feed) annotation (Line(points={{40,6.6},{44,
            6.6},{44,6.4},{48,6.4}}));
    connect(tank5.Out, divider.In) annotation (Line(points={{15,4},{17,4},{17,
            4.3},{20,4.3}}));
    connect(tank4.Out, tank5.In) annotation (Line(points={{-11,4},{-5,4}}));
    connect(tank3.Out, tank4.In) annotation (Line(points={{-37,5},{-31,5},{-31,
            4}}));
    connect(tank3.In, tank2.Out) annotation (Line(points={{-57,5},{-70,5},{-70,
            18},{-18,18},{-18,32},{-28,32}}));
    connect(tank1.Out, tank2.In) annotation (Line(points={{-56,32},{-48,32}}));
    connect(mixer.Out, tank1.In) annotation (Line(points={{-84,31.6},{-80,31.6},
            {-80,32},{-76,32}}));
    connect(sensor_NO.In, tank2.MeasurePort) annotation (Line(points={{-32,48},
            {-32,36.5},{-32.5,36.5}}));
    connect(divider.Out2, RecyclePump.In) annotation (Line(points={{40,2.5},{44,
            2.5},{44,-9},{-15,-9},{-15,-8.7},{-74,-8.7}}));
    connect(RecyclePump.Out, mixer.In3) annotation (Line(points={{-94,-14.8},{
            -104,-14.8},{-104,27.5}}));
    connect(Settler.Return, ReturnPump.In) annotation (Line(points={{55,-4.6},{
            55,-22.7},{36,-22.7}}));
    connect(ReturnPump.Out, mixer.In2) annotation (Line(points={{16,-28.8},{
            14.5,-28.8},{14.5,-29},{-113,-29},{-113,31.5},{-104,31.5}}));
    connect(WastePump.Out, WasteSludge.In) annotation (Line(points={{79,-42.2},
            {81,-42.2},{81,-42},{83,-42},{83,-42.2},{87,-42.2}}));
    connect(WastePump.In, Settler.Waste) annotation (Line(points={{59,-48.3},{
            52,-48.3},{52,-31},{61,-31},{61,-4.6}}));
    connect(WastePump.u, Qr.y) annotation (Line(points={{60.1,-42.5},{46,-42.5},
            {46,-58},{43,-58}}, color={0,0,255}));
    connect(sensor_NH1.In, Settler.Effluent) annotation (Line(points={{72,15},{
            72,10.7},{68.2,10.7}}));
    connect(sensor_NO1.In, Settler.Effluent) annotation (Line(points={{89,15},{
            89,10.7},{68.2,10.7}}));
    connect(sensor_TKN1.In, Settler.Effluent) annotation (Line(points={{105,14},
            {105,10.7},{68.2,10.7}}));
    connect(sensor_COD1.In, Settler.Effluent) annotation (Line(points={{105,-5},
            {105,10.7},{68.2,10.7}}));
    connect(Effluent.In, Settler.Effluent) annotation (Line(points={{88,-16},{
            78.5,-16},{78.5,10.7},{68.2,10.7}}));
    connect(Qr.y, ReturnPump.u) annotation (Line(points={{43,-58},{46,-58},{46,
            -28.5},{34.9,-28.5}}, color={0,0,255}));
    connect(tank5.MeasurePort, sensor_O2.In) annotation (Line(points={{10.5,8.5},
            {10.5,25},{11.5,25}}));
    connect(sensor_TSS1.In, divider.Out1) annotation (Line(points={{40,15},{40,
            6.6}}));

    connect(Qa.y, RecyclePump.u) annotation (Line(
        points={{-54,-55},{-46,-55},{-46,-14.5},{-75.1,-14.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temperature.y, tank1.T) annotation (Line(
        points={{-83,59},{-78,59},{-78,36},{-76,36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Temperature.y, tank2.T) annotation (Line(
        points={{-83,59},{-51,59},{-51,36},{-48,36}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(tank5.T, tank2.T) annotation (Line(
        points={{-5,8},{-5,72},{-51,72},{-51,36},{-48,36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tank4.T, tank2.T) annotation (Line(
        points={{-31,8},{-37,8},{-37,15},{-6,15},{-6,72},{-51,72},{-51,36},{-48,
            36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tank3.T, tank2.T) annotation (Line(
        points={{-57,9},{-63,9},{-63,15},{-6,15},{-6,72},{-51,72},{-51,36},{-48,
            36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(CombiTableTime.y, wWSource1.data) annotation (Line(
        points={{-90,87},{-78,87},{-78,89},{-76,89},{-76,87},{-82,87}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(wWSource1.Out, mixer.In1) annotation (Line(
        points={{-63.2,80},{-63,80},{-63,71},{-113,71},{-113,35.5},{-104,35.5}},

        color={0,0,0},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-120,-100},{120,105}},
          grid={1,1}), graphics),
      Documentation(info="This ASM1 plant consists of 2 denitrification tanks (tank1 and tank2),
3 nitrification tanks (tank3 - tank5) and a secondary clarifier by Takacs.
Furthermore there are 2 control loops modelled.
This configuration corresponds to the COST simulation benchmark [1].

Change into the directory ../ASM1 and translate the model.
Before simulating the model load initial values from the script file bench_asm1.mos
that is provided besides the model.
A 14 days dynamic influent data file is provided. So you may simulate up to 14 days.
But start with 1 day as it may take some time for simulation.
After simulation you may have a look at internal concentrations but most interesting
are the relevant concentrations at the effluent of a plant which can be viewed via the
sensors at the effluent of the secondary clarifier.

References:

[1] J.B. Copp: The COST Simulation Benchmark. 2000. http://www.ensic.u-nancy.fr/COSTWWTP/


PS: For those who want to reproduce the exact figures from the COST simulation benchmark some remarks:
    The aeration system in this library is different from that in COST, so be sure to produce an airflow
    corresponding to the desired Kla in COST. Furthermore in this library biological parameters are standard
    parameters from the ASM1 distribution and implemented with temperature dependency which may vary a bit from
    the parameter set used in COST.
    But it is possible. During the validation phase of this library the steady state and dynamic results
    from the COST simulation benchmark could exactly be reproduced.
"),   experiment(
        StopTime=14,
        __Dymola_NumberOfIntervals=5000,
        __Dymola_Algorithm="lsodar"),
      __Dymola_experimentSetupOutput);
  end BenchPlant2;
  annotation (
    Documentation(info="This package contains example ASM1 wastewater treatment plant models to demonstrate the usage of
the WasteWater.ASM1 library.
Open the models and simulate them according to the description provided in the models.

The following demo models are present:

 - SmallPlant
 - BenchPlant
 - ComplexPlant

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2003, Gerald Reichl
"));
end Examples;
