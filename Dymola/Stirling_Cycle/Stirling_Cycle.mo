package Stirling_Cycle
  package Mechanical_Modules
    model Mechanical
      import  Modelica.Units.SI;
      parameter Boolean animation=true;

      parameter SI.Length cylinderTopPosition=0.42;
      parameter SI.Length pistonLength=0.1;
      parameter SI.Length rodLength=0.2;
      parameter SI.Length crankLength=0.2;
      parameter SI.Length crankPinOffset=0.1;
      parameter SI.Length crankPinLength=0.1;
      parameter SI.Angle cylinderInclinationAngle=0;
      parameter SI.Angle crankAngleOffset=-90;
      parameter SI.Length cylinderLength=cylinderTopPosition - (pistonLength +
          rodLength - crankPinOffset);

      parameter SI.Length cylinderTopPosition1=0.42;
      parameter SI.Length pistonLength1=0.1;
      parameter SI.Length rodLength1=0.2;
      parameter SI.Length crankLength1=0.2;
      parameter SI.Length crankPinOffset1=0.1;
      parameter SI.Length crankPinLength1=0.1;
      parameter SI.Angle cylinderInclinationAngle1=90;
      parameter SI.Angle crankAngleOffset1=-90;
      parameter SI.Length cylinderLength1=cylinderTopPosition1 - (pistonLength1 +
          rodLength1 - crankPinOffset1);

      Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston(
        diameter=0.1,
        r={0,pistonLength,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(
            origin={-124,4},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod(
        widthDirection={1,0,0},
        height=0.06,
        color={0,0,200},
        width=0.02,
        r_shape={0,-0.02,0},
        r={0,rodLength,0},
        animation=animation) annotation (Placement(transformation(
            origin={-84,-36},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute b2(
        n(displayUnit="1") = {1,0,0},
        cylinderLength=cylinderLength,
        animation=animation,
        cylinderDiameter=0.055) annotation (Placement(transformation(extent={{-114,-26},
                {-94,-6}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank4(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,-crankPinOffset,0},
        animation=animation) 
        annotation (Placement(transformation(
            origin={-94,-96},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank3(
        r_shape={-0.01,0,0},
        length=0.12,
        diameter=0.03,
        r={crankPinLength,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{-133.5,-86},
                {-113.5,-66}})));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank1(
        diameter=0.05,
        r_shape={-0.01,0,0},
        length=0.12,
        r={crankLength - crankPinLength,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{-194,-126},
                {-174,-106}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank2(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,crankPinOffset,0},
        animation=animation) annotation (Placement(transformation(
            origin={-154,-96},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b1(
        n(displayUnit="1") = {1,0,0},
        cylinderLength=cylinderLength,
        animation=animation,
        cylinderDiameter=0.055) 
        annotation (Placement(transformation(extent={{-114,-46},{-94,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid(r={crankPinLength/2,0,
            0}, animation=false) 
                   annotation (Placement(transformation(extent={{-144,-66},{-124,-46}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder(
        useAxisFlange=true,
        n(displayUnit="1") = {0,1,0},
        boxWidth=0.02,
        s(start=-0.2)) annotation (Placement(transformation(
            origin={-124,34},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting(r={crankLength,0,
            0}, animation=false) 
                   annotation (Placement(transformation(extent={{-144,64},{-124,84}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination(
        r={crankLength - crankPinLength/2,0,0},
        n_y={0,Modelica.Math.cos(cylinderInclinationAngle),Modelica.Math.sin(
            cylinderInclinationAngle)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-214,4},{-194,24}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle1(
        n_y={0,Modelica.Math.cos(crankAngleOffset),Modelica.Math.sin(
            crankAngleOffset)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-234,-126},{-214,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle2(
        n_y={0,Modelica.Math.cos(-crankAngleOffset),Modelica.Math.sin(-
            crankAngleOffset)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-74,-126},{-54,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop(r={0,
            cylinderTopPosition,0}, animation=false) 
                           annotation (Placement(transformation(
            origin={-174,34},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston1(
        diameter=0.1,
        r={0,pistonLength1,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(
            origin={164,4},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod1(
        widthDirection={1,0,0},
        height=0.06,
        color={0,0,200},
        width=0.02,
        r_shape={0,-0.02,0},
        r={0,rodLength1,0},
        animation=animation) annotation (Placement(transformation(
            origin={204,-36},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute b3(
        n={1,0,0},
        cylinderLength=cylinderLength1,
        animation=animation,
        cylinderDiameter=0.055) annotation (Placement(transformation(extent={{174,-26},
                {194,-6}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank5(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,-crankPinOffset1,0},
        animation=animation) 
        annotation (Placement(transformation(
            origin={194,-96},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank6(
        r_shape={-0.01,0,0},
        length=0.12,
        diameter=0.03,
        r={crankPinLength1,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{154.5,-86},
                {174.5,-66}})));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank7(
        diameter=0.05,
        r_shape={-0.01,0,0},
        length=0.12,
        r={crankLength1 - crankPinLength1,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{94,-126},
                {114,-106}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank8(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,crankPinOffset1,0},
        animation=animation) annotation (Placement(transformation(
            origin={134,-96},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b4(
        n={1,0,0},
        cylinderLength=cylinderLength1,
        animation=animation,
        cylinderDiameter=0.055) 
        annotation (Placement(transformation(extent={{174,-46},{194,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid1(r={crankPinLength1/2,
            0,0}, animation=false) 
                   annotation (Placement(transformation(extent={{144,-66},{164,-46}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder1(
        useAxisFlange=true,
        n(displayUnit="1") = {0,1,0},
        boxWidth=0.02,
        s(start=-0.2)) annotation (Placement(transformation(
            origin={164,34},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting1(r={crankLength1,
            0,0}, animation=false) 
                   annotation (Placement(transformation(extent={{144,64},{164,84}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination1(
        r={crankLength1 - crankPinLength1/2,0,0},
        n_y={0,Modelica.Math.cos(cylinderInclinationAngle1),Modelica.Math.sin(
            cylinderInclinationAngle1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{74,4},{94,24}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle3(
        n_y={0,Modelica.Math.cos(crankAngleOffset1),Modelica.Math.sin(
            crankAngleOffset1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{54,-126},{74,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle4(
        n_y={0,Modelica.Math.cos(-crankAngleOffset1),Modelica.Math.sin(-
            crankAngleOffset1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{214,-126},{234,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop1(r={0,
            cylinderTopPosition1,0}, animation=false) 
                           annotation (Placement(transformation(
            origin={114,34},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a 
        annotation (Placement(transformation(extent={{-260,58},{-228,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b 
        annotation (Placement(transformation(extent={{-60,58},{-28,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a 
        annotation (Placement(transformation(extent={{-260,-142},{-228,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b 
        annotation (Placement(transformation(extent={{-60,-142},{-28,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a1 
        annotation (Placement(transformation(extent={{28,58},{60,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a1 
        annotation (Placement(transformation(extent={{28,-142},{60,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b1 
        annotation (Placement(transformation(extent={{228,-142},{260,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b1 
        annotation (Placement(transformation(extent={{230,60},{262,92}})));
    equation
      connect(b1.frame_a,mid. frame_b) annotation (Line(
          points={{-114,-56},{-124,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod.frame_a,b1. frame_b) annotation (Line(
          points={{-84,-46},{-84,-56},{-94,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.frame_b,piston. frame_b) annotation (Line(
          points={{-124,24},{-124,14}},
          color={95,95,95},
          thickness=0.5));
      connect(crank1.frame_a,crankAngle1. frame_b) 
        annotation (Line(
          points={{-194,-116},{-214,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(b2.frame_a,piston. frame_a) annotation (Line(
          points={{-114,-16},{-124,-16},{-124,-6}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod.frame_b,b2. frame_b) annotation (Line(
          points={{-84,-26},{-84,-16},{-94,-16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank4.frame_b,crankAngle2. frame_a) annotation (Line(
          points={{-94,-106},{-94,-116},{-74,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination.frame_b,cylinderTop. frame_a) 
        annotation (Line(
          points={{-194,14},{-174,14},{-174,24}},
          color={95,95,95},
          thickness=0.5));
      connect(crank1.frame_b,crank2. frame_a) annotation (Line(
          points={{-174,-116},{-154,-116},{-154,-106}},
          color={95,95,95},
          thickness=0.5));
      connect(crank3.frame_b,crank4. frame_a) annotation (Line(
          points={{-113.5,-76},{-94,-76},{-94,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank3.frame_a,crank2. frame_b) annotation (Line(
          points={{-133.5,-76},{-154,-76},{-154,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank2.frame_b,mid. frame_a) annotation (Line(
          points={{-154,-86},{-154,-56},{-144,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderTop.frame_b,cylinder. frame_a) annotation (Line(
          points={{-174,44},{-174,54},{-124,54},{-124,44}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination.frame_a,cylinder_a)  annotation (Line(
          points={{-214,14},{-224,14},{-224,74},{-244,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting.frame_a,cylinder_a)  annotation (Line(
          points={{-144,74},{-244,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting.frame_b,cylinder_b)  annotation (Line(
          points={{-124,74},{-44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle1.frame_a,crank_a)  annotation (Line(
          points={{-234,-116},{-244,-116},{-244,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle2.frame_b,crank_b)  annotation (Line(
          points={{-54,-116},{-44,-116},{-44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(b4.frame_a,mid1. frame_b) annotation (Line(
          points={{174,-56},{164,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod1.frame_a,b4. frame_b) annotation (Line(
          points={{204,-46},{204,-56},{194,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder1.frame_b,piston1. frame_b) annotation (Line(
          points={{164,24},{164,14}},
          color={95,95,95},
          thickness=0.5));
      connect(crank7.frame_a,crankAngle3. frame_b) 
        annotation (Line(
          points={{94,-116},{74,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(b3.frame_a,piston1. frame_a) annotation (Line(
          points={{174,-16},{164,-16},{164,-6}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod1.frame_b,b3. frame_b) annotation (Line(
          points={{204,-26},{204,-16},{194,-16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank5.frame_b,crankAngle4. frame_a) annotation (Line(
          points={{194,-106},{194,-116},{214,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination1.frame_b,cylinderTop1. frame_a) annotation (Line(
          points={{94,14},{114,14},{114,24}},
          color={95,95,95},
          thickness=0.5));
      connect(crank7.frame_b,crank8. frame_a) annotation (Line(
          points={{114,-116},{134,-116},{134,-106}},
          color={95,95,95},
          thickness=0.5));
      connect(crank6.frame_b,crank5. frame_a) annotation (Line(
          points={{174.5,-76},{194,-76},{194,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank6.frame_a,crank8. frame_b) annotation (Line(
          points={{154.5,-76},{134,-76},{134,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank8.frame_b,mid1. frame_a) annotation (Line(
          points={{134,-86},{134,-56},{144,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderTop1.frame_b,cylinder1. frame_a) annotation (Line(
          points={{114,44},{114,54},{164,54},{164,44}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination1.frame_a,cylinder_a1)  annotation (Line(
          points={{74,14},{64,14},{64,74},{44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting1.frame_a,cylinder_a1)  annotation (Line(
          points={{144,74},{44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle3.frame_a,crank_a1)  annotation (Line(
          points={{54,-116},{44,-116},{44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle4.frame_b,crank_b1)  annotation (Line(
          points={{234,-116},{244,-116},{244,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crank_b,crank_a1)  annotation (Line(
          points={{-44,-126},{44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder_a1,cylinder_b)  annotation (Line(
          points={{44,74},{-44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder_b1,mounting1. frame_b) annotation (Line(
          points={{246,76},{246,74},{164,74}},
          color={95,95,95},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-520,-300},
                {520,220}})), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-520,-300},{520,220}})));
    end Mechanical;

    model Mechanical_Sample_Gas
      import  Modelica.Units.SI;
      parameter Boolean animation=true;

      parameter SI.Length cylinderTopPosition=0.42;
      parameter SI.Length pistonLength=0.1;
      parameter SI.Length rodLength=0.2;
      parameter SI.Length crankLength=0.2;
      parameter SI.Length crankPinOffset=0.1;
      parameter SI.Length crankPinLength=0.1;
      parameter SI.Angle cylinderInclinationAngle=0;
      parameter SI.Angle crankAngleOffset=-90;
      parameter SI.Length cylinderLength=cylinderTopPosition - (pistonLength +
          rodLength - crankPinOffset);

      parameter SI.Length cylinderTopPosition1=0.42;
      parameter SI.Length pistonLength1=0.1;
      parameter SI.Length rodLength1=0.2;
      parameter SI.Length crankLength1=0.2;
      parameter SI.Length crankPinOffset1=0.1;
      parameter SI.Length crankPinLength1=0.1;
      parameter SI.Angle cylinderInclinationAngle1=90;
      parameter SI.Angle crankAngleOffset1=-90;
      parameter SI.Length cylinderLength1=cylinderTopPosition1 - (pistonLength1 +
          rodLength1 - crankPinOffset1);

      Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston(
        diameter=0.1,
        r={0,pistonLength,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(
            origin={-124,6},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod(
        widthDirection={1,0,0},
        height=0.06,
        color={0,0,200},
        width=0.02,
        r_shape={0,-0.02,0},
        r={0,rodLength,0},
        animation=animation) annotation (Placement(transformation(
            origin={-84,-36},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute b2(
        n(displayUnit="1") = {1,0,0},
        cylinderLength=cylinderLength,
        animation=animation,
        cylinderDiameter=0.055) annotation (Placement(transformation(extent={{-114,-26},
                {-94,-6}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank4(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,-crankPinOffset,0},
        animation=animation) 
        annotation (Placement(transformation(
            origin={-94,-96},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank3(
        r_shape={-0.01,0,0},
        length=0.12,
        diameter=0.03,
        r={crankPinLength,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{-133.5,-86},
                {-113.5,-66}})));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank1(
        diameter=0.05,
        r_shape={-0.01,0,0},
        length=0.12,
        r={crankLength - crankPinLength,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{-194,-126},
                {-174,-106}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank2(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,crankPinOffset,0},
        animation=animation) annotation (Placement(transformation(
            origin={-154,-96},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b1(
        n(displayUnit="1") = {1,0,0},
        cylinderLength=cylinderLength,
        animation=animation,
        cylinderDiameter=0.055) 
        annotation (Placement(transformation(extent={{-114,-46},{-94,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid(r={crankPinLength/2,0,
            0}, animation=false) 
                   annotation (Placement(transformation(extent={{-144,-66},{-124,-46}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder(
        useAxisFlange=true,
        n(displayUnit="1") = {0,1,0},
        boxWidth=0.02,
        s(start=0.2))  annotation (Placement(transformation(
            origin={-124,34},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting(r={crankLength,0,
            0}, animation=false) 
                   annotation (Placement(transformation(extent={{-144,64},{-124,84}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination(
        r={crankLength - crankPinLength/2,0,0},
        n_y={0,Modelica.Math.cos(cylinderInclinationAngle),Modelica.Math.sin(
            cylinderInclinationAngle)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-214,4},{-194,24}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle1(
        n_y={0,Modelica.Math.cos(crankAngleOffset),Modelica.Math.sin(
            crankAngleOffset)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-234,-126},{-214,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle2(
        n_y={0,Modelica.Math.cos(-crankAngleOffset),Modelica.Math.sin(-
            crankAngleOffset)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-74,-126},{-54,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop(r={0,
            cylinderTopPosition,0}, animation=false) 
                           annotation (Placement(transformation(
            origin={-174,34},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston1(
        diameter=0.1,
        r={0,pistonLength1,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(
            origin={164,4},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod1(
        widthDirection={1,0,0},
        height=0.06,
        color={0,0,200},
        width=0.02,
        r_shape={0,-0.02,0},
        r={0,rodLength1,0},
        animation=animation) annotation (Placement(transformation(
            origin={204,-36},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute b3(
        n={1,0,0},
        cylinderLength=cylinderLength1,
        animation=animation,
        cylinderDiameter=0.055) annotation (Placement(transformation(extent={{174,-26},
                {194,-6}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank5(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,-crankPinOffset1,0},
        animation=animation) 
        annotation (Placement(transformation(
            origin={194,-96},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank6(
        r_shape={-0.01,0,0},
        length=0.12,
        diameter=0.03,
        r={crankPinLength1,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{154.5,-86},
                {174.5,-66}})));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank7(
        diameter=0.05,
        r_shape={-0.01,0,0},
        length=0.12,
        r={crankLength1 - crankPinLength1,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{94,-126},
                {114,-106}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank8(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,crankPinOffset1,0},
        animation=animation) annotation (Placement(transformation(
            origin={134,-96},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b4(
        n={1,0,0},
        cylinderLength=cylinderLength1,
        animation=animation,
        cylinderDiameter=0.055) 
        annotation (Placement(transformation(extent={{174,-46},{194,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid1(r={crankPinLength1/2,
            0,0}, animation=false) 
                   annotation (Placement(transformation(extent={{144,-66},{164,-46}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder1(
        useAxisFlange=true,
        n(displayUnit="1") = {0,1,0},
        boxWidth=0.02,
        s(start=0.2))  annotation (Placement(transformation(
            origin={164,34},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting1(r={crankLength1,
            0,0}, animation=false) 
                   annotation (Placement(transformation(extent={{144,64},{164,84}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination1(
        r={crankLength1 - crankPinLength1/2,0,0},
        n_y={0,Modelica.Math.cos(cylinderInclinationAngle1),Modelica.Math.sin(
            cylinderInclinationAngle1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{74,4},{94,24}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle3(
        n_y={0,Modelica.Math.cos(crankAngleOffset1),Modelica.Math.sin(
            crankAngleOffset1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{54,-126},{74,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle4(
        n_y={0,Modelica.Math.cos(-crankAngleOffset1),Modelica.Math.sin(-
            crankAngleOffset1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{214,-126},{234,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop1(r={0,
            cylinderTopPosition1,0}, animation=false) 
                           annotation (Placement(transformation(
            origin={114,34},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a 
        annotation (Placement(transformation(extent={{-260,58},{-228,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b 
        annotation (Placement(transformation(extent={{-60,58},{-28,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a 
        annotation (Placement(transformation(extent={{-260,-142},{-228,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b 
        annotation (Placement(transformation(extent={{-60,-142},{-28,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a1 
        annotation (Placement(transformation(extent={{28,58},{60,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a1 
        annotation (Placement(transformation(extent={{28,-142},{60,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b1 
        annotation (Placement(transformation(extent={{228,-142},{260,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b1 
        annotation (Placement(transformation(extent={{230,60},{262,92}})));
      Modelica.Blocks.Sources.Sine sine(
        amplitude=12000,                                 f=30,
        offset=0)                                              annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-48,-6})));
      Gas_Force sample_Gas annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-86,34})));
    equation
      connect(b1.frame_a,mid. frame_b) annotation (Line(
          points={{-114,-56},{-124,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod.frame_a,b1. frame_b) annotation (Line(
          points={{-84,-46},{-84,-56},{-94,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.frame_b,piston. frame_b) annotation (Line(
          points={{-124,24},{-124,16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank1.frame_a,crankAngle1. frame_b) 
        annotation (Line(
          points={{-194,-116},{-214,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(b2.frame_a,piston. frame_a) annotation (Line(
          points={{-114,-16},{-124,-16},{-124,-4}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod.frame_b,b2. frame_b) annotation (Line(
          points={{-84,-26},{-84,-16},{-94,-16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank4.frame_b,crankAngle2. frame_a) annotation (Line(
          points={{-94,-106},{-94,-116},{-74,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination.frame_b,cylinderTop. frame_a) 
        annotation (Line(
          points={{-194,14},{-174,14},{-174,24}},
          color={95,95,95},
          thickness=0.5));
      connect(crank1.frame_b,crank2. frame_a) annotation (Line(
          points={{-174,-116},{-154,-116},{-154,-106}},
          color={95,95,95},
          thickness=0.5));
      connect(crank3.frame_b,crank4. frame_a) annotation (Line(
          points={{-113.5,-76},{-94,-76},{-94,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank3.frame_a,crank2. frame_b) annotation (Line(
          points={{-133.5,-76},{-154,-76},{-154,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank2.frame_b,mid. frame_a) annotation (Line(
          points={{-154,-86},{-154,-56},{-144,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderTop.frame_b,cylinder. frame_a) annotation (Line(
          points={{-174,44},{-174,54},{-124,54},{-124,44}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination.frame_a,cylinder_a)  annotation (Line(
          points={{-214,14},{-224,14},{-224,74},{-244,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting.frame_a,cylinder_a)  annotation (Line(
          points={{-144,74},{-244,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting.frame_b,cylinder_b)  annotation (Line(
          points={{-124,74},{-44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle1.frame_a,crank_a)  annotation (Line(
          points={{-234,-116},{-244,-116},{-244,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle2.frame_b,crank_b)  annotation (Line(
          points={{-54,-116},{-44,-116},{-44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(b4.frame_a,mid1. frame_b) annotation (Line(
          points={{174,-56},{164,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod1.frame_a,b4. frame_b) annotation (Line(
          points={{204,-46},{204,-56},{194,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder1.frame_b,piston1. frame_b) annotation (Line(
          points={{164,24},{164,14}},
          color={95,95,95},
          thickness=0.5));
      connect(crank7.frame_a,crankAngle3. frame_b) 
        annotation (Line(
          points={{94,-116},{74,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(b3.frame_a,piston1. frame_a) annotation (Line(
          points={{174,-16},{164,-16},{164,-6}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod1.frame_b,b3. frame_b) annotation (Line(
          points={{204,-26},{204,-16},{194,-16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank5.frame_b,crankAngle4. frame_a) annotation (Line(
          points={{194,-106},{194,-116},{214,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination1.frame_b,cylinderTop1. frame_a) annotation (Line(
          points={{94,14},{114,14},{114,24}},
          color={95,95,95},
          thickness=0.5));
      connect(crank7.frame_b,crank8. frame_a) annotation (Line(
          points={{114,-116},{134,-116},{134,-106}},
          color={95,95,95},
          thickness=0.5));
      connect(crank6.frame_b,crank5. frame_a) annotation (Line(
          points={{174.5,-76},{194,-76},{194,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank6.frame_a,crank8. frame_b) annotation (Line(
          points={{154.5,-76},{134,-76},{134,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank8.frame_b,mid1. frame_a) annotation (Line(
          points={{134,-86},{134,-56},{144,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderTop1.frame_b,cylinder1. frame_a) annotation (Line(
          points={{114,44},{114,54},{164,54},{164,44}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination1.frame_a,cylinder_a1)  annotation (Line(
          points={{74,14},{64,14},{64,74},{44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting1.frame_a,cylinder_a1)  annotation (Line(
          points={{144,74},{44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle3.frame_a,crank_a1)  annotation (Line(
          points={{54,-116},{44,-116},{44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle4.frame_b,crank_b1)  annotation (Line(
          points={{234,-116},{244,-116},{244,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crank_b,crank_a1)  annotation (Line(
          points={{-44,-126},{44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder_a1,cylinder_b)  annotation (Line(
          points={{44,74},{-44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder_b1,mounting1. frame_b) annotation (Line(
          points={{246,76},{246,74},{164,74}},
          color={95,95,95},
          thickness=0.5));
      connect(sine.y, sample_Gas.f_mt) annotation (Line(points={{-48,5},{-48,
              21.8},{-80,21.8}}, color={0,0,127}));
      connect(sample_Gas.flange_b, cylinder.support) annotation (Line(points={{
              -86,44},{-86,38},{-118,38}}, color={0,127,0}));
      connect(cylinder.axis, sample_Gas.flange_a) annotation (Line(points={{
              -118,26},{-116,26},{-116,24},{-86,24}}, color={0,127,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-520,-300},
                {520,220}})), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-520,-300},{520,220}})));
    end Mechanical_Sample_Gas;

    model Gas_Force
      extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
      Modelica.Blocks.Interfaces.RealInput f_mt 
        annotation (Placement(transformation(extent={{-142,-80},{-102,-40}})));
    equation
      f = -f_mt;
        annotation (Placement(transformation(extent={{-144,-80},{-104,-40}})));
    end Gas_Force;

    model Mechanical_test
      inner Modelica.Mechanics.MultiBody.World world 
        annotation (Placement(transformation(extent={{-88,40},{-68,60}})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true,
          n(displayUnit="1") = {1,0,0}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-32,-20})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.5) 
        annotation (Placement(transformation(extent={{-78,-64},{-58,-44}})));
      Mechanical_Sample_Gas mechanical_Sample_Gas 
        annotation (Placement(transformation(extent={{-10,14},{94,66}})));
    equation
      connect(world.frame_b, revolute.frame_b) annotation (Line(
          points={{-68,50},{-56,50},{-56,-20},{-42,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(inertia.flange_b, revolute.axis) annotation (Line(points={{-58,
              -54},{-32,-54},{-32,-30}}, color={0,0,0}));
      connect(revolute.frame_a, mechanical_Sample_Gas.crank_a) annotation (Line(
          points={{-22,-20},{17.6,-20},{17.6,31.4}},
          color={95,95,95},
          thickness=0.5));
      connect(mechanical_Sample_Gas.cylinder_a, revolute.frame_b) annotation (
          Line(
          points={{17.6,51.4},{-56,51.4},{-56,-20},{-42,-20}},
          color={95,95,95},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Mechanical_test;

  end Mechanical_Modules;

  package Gas_Dynamic_1
    partial model Gas_Partial1
      Modelica.Blocks.Interfaces.RealInput u 
        annotation (Placement(transformation(extent={{-156,18},{-116,58}})));
      Modelica.Blocks.Interfaces.RealInput u1 
        annotation (Placement(transformation(extent={{-160,-62},{-120,-22}})));
      Modelica.Blocks.Interfaces.RealOutput fo 
        annotation (Placement(transformation(extent={{106,-10},{126,10}})));
      Modelica.Units.SI.Force f;
    equation
      fo = f;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Gas_Partial1;

    model Gas_Dynamic1
      extends Gas_Partial1;
      parameter Modelica.Units.SI.Pressure Po = 100000;
      parameter Modelica.Units.SI.ThermodynamicTemperature To = 293.15;
      parameter .Real M = 29;
      parameter .Real R = 8314.472;
      parameter .Real cv = 717;
      parameter .Real mu = 1.33e-5;
      parameter .Real d1 "diameter of first piston";
      parameter .Real l_d;
      parameter .Real d2 "diameter of second piston";
      parameter .Real dc;
      constant .Real pi = 3.1415926;
      parameter .Real A1 = pi*(d1^2)/4;
      parameter .Real A2 = pi*(d2^2)/4;
      parameter .Real A_an = pi*(dc^2 - d1^2)/4;
      parameter .Real V_1 = A_an * l_d;
      parameter .Real Vm1;
      parameter .Real Vm2;
      parameter .Real V1o = Vm1 + A1*(1+sin(3.1514/2))/10;
      parameter .Real V2o = Vm2 + A2*(1/10) - A1*(1+sin(3.1514/2))/10 + 2*l_d*A1;
      parameter .Real n1_o = (Po*V1o)/(R*To);
      parameter .Real n2_o = (Po*V2o)/(R*To);
      parameter Modelica.Units.SI.Volume VT = V1o + V2o + V_1;
      parameter .Real nt_o = (Po*VT)/(R*To);
      parameter .Real A_l = pi*d1*l_d;
      parameter .Real Rp = R/M;
       .Real nt(start = nt_o);
       .Real V1   ;
       .Real V2   ;
       .Real P1(start = Po);
       .Real P2(start = Po);
       .Real n1(start = n1_o);
       .Real n2(start = n2_o);
       .Real n_l(start = nt_o - n1_o - n2_o);
       .Real m1   ;
       .Real m2   ;
       .Real m_l   ;
       .Real mt   ;
       .Real T1(start = To);
       .Real T2(start = To);
       .Real T_l(start = To);
       .Real sp   ;
       .Real sd   ;
       .Real ro1   ;
       .Real ro2   ;
       .Real P_l(start = Po);
       .Real c;
       .Real mp2   ;
       .Real mp1   ;
       .Real ro_l   ;
    equation
      sd = (1+sin(u1*time+3.1514/2))/10;
      sp = (1+sin(u*time))/10;

      V1 = Vm1 + A1*sd;
      V2 = Vm2 + A2*sp - A1*sd + 2*l_d*A1;

      P_l = (P1+P2)/2;


      // 初始化“质量”
      M*n1 = m1;
      M*n2 = m2;
      M*n_l = m_l;

      mt = m1 + m2 + m_l;
      nt = mt/M;

      //
      V1*P1 = n1*R*T1;
      V2*P2 = n2*R*T2;

      // 初始化“密度”
      ro1 = P1/(Rp*T1);
      ro2 = P2/(Rp*T2);
      ro_l = P_l/(Rp*T_l);

      if c<0 then
        mp1 = c*A_an*ro_l;
        mp2 = c*A_an*ro2;
      else
        mp1 = c*A_an*ro1;
        mp2 = c*A_an*ro_l;
      end if;

      der(m1) = -mp1;
      der(m_l) = mp1 - mp2;
      der(m2) = mp2;

      (P1-P2)*A_an - A_l*mu*(der(sd)/((dc-d1)/2)) = c*der(m_l) + m_l*der(c);


      der(T1) = 0;
      der(T2) = 0;
      der(T_l) = 0;

      f = (P2-Po)*A2;
    end Gas_Dynamic1;

    model Gas_Dynamic1_test
      Gas_Dynamic1 gas_Dynamic1_1(
      d1 = 0.15,
      l_d = 0.1,
      d2 = 0.12,
      dc = 0.18,
      P1(fixed = true),
      n1(fixed = true),
      n2(fixed = true),
      nt(fixed = true),
      Vm1 = 0.01,
      Vm2 = 0.0105);
      Modelica.Blocks.Sources.Constant const(k=120) 
        annotation (Placement(transformation(extent={{-72,-40},{-52,-20}})));
    equation
      connect(const.y, gas_Dynamic1_1.u) annotation (Line(points={{-51,-30},{-23.8,-30},
              {-23.8,12.4}}, color={0,0,127}));
      connect(const.y, gas_Dynamic1_1.u1) annotation (Line(points={{-51,-30},{
              -22,-30},{-22,4},{-15.8,4},{-15.8,10}},
                                             color={0,0,127}));
                    annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-20,26})),
                  Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Gas_Dynamic1_test;
  end Gas_Dynamic_1;

  package Gas_Dynamic_2
    model Gas_Dynamic2_test
      Modelica.Blocks.Sources.Ramp ramp(
        height=200,
        duration=10,
        offset=273.15) 
                      annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-60,-30})));
      Modelica.Blocks.Sources.Constant const(k=293.73) 
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={28,-30})));
      Modelica.Blocks.Sources.Constant const1(k=100) 
                                                   annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={64,18})));
      Gas_Dynamic2 gas_Dynamic2_1(
      d1 = 0.15,
      l_d = 0.1,
      d2 = 0.12,
      dc = 0.18,
      P1(fixed = true),
      n1(fixed = true),
      n2(fixed = true),
      nt(fixed = true),
      Vm1 = 0.001,
      Vm2 = 0.00105,
      Uc = 10,
      Uf = 100) 
          annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-30,6})));
    equation
      connect(gas_Dynamic2_1.u, const1.y) annotation (Line(points={{-44.2,12},{-44.2,
              36},{53,36},{53,18}}, color={0,0,127}));
      connect(gas_Dynamic2_1.u1, const1.y) annotation (Line(points={{-16,12},{16,12},
              {16,16},{53,16},{53,18}}, color={0,0,127}));
      connect(ramp.y, gas_Dynamic2_1.u2) annotation (Line(points={{-60,-19},{-60,-6},
              {-44,-6},{-44,8.88178e-16}}, color={0,0,127}));
      connect(const.y, gas_Dynamic2_1.u3) annotation (Line(points={{28,-19},{28,6},{
              -16,6},{-16,-4.44089e-16}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Gas_Dynamic2_test;

    partial model Gas_Partial2
      Modelica.Blocks.Interfaces.RealInput u 
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={60,142})));
      Modelica.Blocks.Interfaces.RealInput u1 
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=90,
            origin={60,-140})));
      Modelica.Blocks.Interfaces.RealOutput fo 
        annotation (Placement(transformation(extent={{118,40},{138,60}})));
      Modelica.Units.SI.Force f;
      Modelica.Units.SI.Force f1;
      Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={-60,140})));
      Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-60,-140})));
      Modelica.Blocks.Interfaces.RealOutput fo1 
        annotation (Placement(transformation(extent={{118,-60},{138,-40}})));
    equation
      fo = f;
      fo1 = f1;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Gas_Partial2;

    model Gas_Dynamic2
      extends Gas_Partial2;
      parameter Modelica.Units.SI.Pressure Po = 100000;
      parameter Modelica.Units.SI.ThermodynamicTemperature To = 273.15;

      parameter .Real M = 29;
      parameter .Real R = 8314.472;
      parameter .Real cv = 717;
      parameter .Real mu = 1.33e-5;
      /*
  parameter .Real M = 4;
  parameter .Real R = 8.314472;
  parameter .Real cv = 3213.7;
  parameter .Real mu = 1.89e-5;
*/
      parameter .Real d1 "diameter of first piston";
      parameter .Real l_d;
      parameter .Real d2 "diameter of second piston";
      parameter .Real dc;
      constant .Real pi = 3.1415926;
      parameter .Real A1 = pi*(d1^2)/4;
      parameter .Real A2 = pi*(d2^2)/4;
      parameter .Real A_an = pi*(dc^2 - d1^2)/4;
      parameter .Real V_1 = A_an * l_d;
      parameter .Real Vm1;
      parameter .Real Vm2;
      parameter .Real V1o = Vm1 + A1*(1+sin(3.1514/2))/10;
      parameter .Real V2o = Vm2 + A2*(1/10) - A1*(1+sin(3.1514/2))/10 + 2*l_d*A1;
      parameter .Real n1_o = (Po*V1o)/(R*To);
      parameter .Real n2_o = (Po*V2o)/(R*To);
      parameter Modelica.Units.SI.Volume VT = V1o + V2o + V_1;
      parameter .Real nt_o = (Po*VT)/(R*To);
      parameter .Real A_l = pi*d1*l_d;
      parameter .Real Rp = R/M;
      parameter .Real Uc;
      parameter .Real Uf;
      parameter .Real Ac = A1;
      parameter .Real Af = A2;

       .Real nt(start = nt_o);
       .Real V1   ;
       .Real V2   ;
       .Real P1(start = Po);
       .Real P2(start = Po);
       .Real n1(start = n1_o);
       .Real n2(start = n2_o);
       .Real n_l(start = nt_o - n1_o - n2_o);
       .Real m1   ;
       .Real m2   ;
       .Real m_l   ;
       .Real mt   ;
       .Real T1(start = To);
       .Real T2(start = To);
       .Real T_l(start = To);
       .Real sp   ;
       .Real sd   ;
       .Real ro1   ;
       .Real ro2   ;
       .Real P_l(start = Po);
       .Real c;
       .Real mp2   ;
       .Real mp1   ;
       .Real ro_l   ;
       .Real Qc(start = n1_o*M*cv*To);
       .Real Qf(start = n2_o*M*cv*To);
       .Real Q_l(start = (nt_o-n1_o-n2_o)*M*cv*To);
       .Real Qpc;
       .Real Qpf;

    equation
      sd = (1+sin(u1*time+3.1514/2))/10;
      sp = (1+sin(u*time))/10;

      V1 = Vm1 + A1*sd;
      V2 = Vm2 + A2*sp - A1*sd + 2*l_d*A1;

      P_l = (P1+P2)/2;

      // 初始化“质量”
      M*n1 = m1;
      M*n2 = m2;
      M*n_l = m_l;

      mt = m1 + m2 + m_l;
      nt = mt/M;

      //
      V1*P1 = n1*R*T1;
      V2*P2 = n2*R*T2;

      // 初始化“密度”
      ro1 = P1/(Rp*T1);
      ro2 = P2/(Rp*T2);
      ro_l = P_l/(Rp*T_l);

      if c<0 then
        mp1 = c*A_an*ro_l;
        mp2 = c*A_an*ro2;
      else
        mp1 = c*A_an*ro1;
        mp2 = c*A_an*ro_l;
      end if;

      der(m1) = -mp1;
      der(m_l) = mp1 - mp2;
      der(m2) = mp2;

      (P1-P2)*A_an - A_l*mu*(der(sd)/((dc-d1)/2)) = c*der(m_l) + m_l*der(c);

      Qpc = Uc*Ac*(u2-T1);
      Qpf = -Uf*Af*(T2-u3);
      Qc = m1*cv*T1;
      Qf = m2*cv*T2;
      Q_l = m_l*cv*T_l;

      if c<0 then
        der(Qc) = Qpc - mp1*cv*T_l;
      else
        der(Qc) = Qpc - mp1*cv*T1;
      end if;

      if c<0 then
        der(Qf) = Qpf + mp2*cv*T2;
      else
        der(Qf) = Qpf + mp2*cv*T_l;
      end if;

      if c<0 then
        der(Q_l) = -mp2*cv*T2 + mp1*cv*T_l;
      else
        der(Q_l) = -mp2*cv*T_l + mp1*cv*T1;

      end if;

      f = (P2-Po)*A2;
      f1 = (P1-Po)*A1;
    end Gas_Dynamic2;

    model Mechanical_Gas
      import  Modelica.Units.SI;
      parameter Boolean animation=true;

      parameter SI.Length cylinderTopPosition=0.42;
      parameter SI.Length pistonLength=0.1;
      parameter SI.Length rodLength=0.2;
      parameter SI.Length crankLength=0.2;
      parameter SI.Length crankPinOffset=0.1;
      parameter SI.Length crankPinLength=0.1;
      parameter SI.Angle cylinderInclinationAngle=0;
      parameter SI.Angle crankAngleOffset=-90;
      parameter SI.Length cylinderLength=cylinderTopPosition - (pistonLength +
          rodLength - crankPinOffset);

      parameter SI.Length cylinderTopPosition1=0.42;
      parameter SI.Length pistonLength1=0.1;
      parameter SI.Length rodLength1=0.2;
      parameter SI.Length crankLength1=0.2;
      parameter SI.Length crankPinOffset1=0.1;
      parameter SI.Length crankPinLength1=0.1;
      parameter SI.Angle cylinderInclinationAngle1=90;
      parameter SI.Angle crankAngleOffset1=-90;
      parameter SI.Length cylinderLength1=cylinderTopPosition1 - (pistonLength1 +
          rodLength1 - crankPinOffset1);

      Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston(
        diameter=0.1,
        r={0,pistonLength,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(
            origin={-124,4},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod(
        widthDirection={1,0,0},
        height=0.06,
        color={0,0,200},
        width=0.02,
        r_shape={0,-0.02,0},
        r={0,rodLength,0},
        animation=animation) annotation (Placement(transformation(
            origin={-84,-36},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute b2(
        n(displayUnit="1") = {1,0,0},
        cylinderLength=cylinderLength,
        animation=animation,
        cylinderDiameter=0.055) annotation (Placement(transformation(extent={{-114,-26},
                {-94,-6}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank4(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,-crankPinOffset,0},
        animation=animation) 
        annotation (Placement(transformation(
            origin={-94,-96},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank3(
        r_shape={-0.01,0,0},
        length=0.12,
        diameter=0.03,
        r={crankPinLength,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{-133.5,-86},
                {-113.5,-66}})));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank1(
        diameter=0.05,
        r_shape={-0.01,0,0},
        length=0.12,
        r={crankLength - crankPinLength,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{-194,-126},
                {-174,-106}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank2(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,crankPinOffset,0},
        animation=animation) annotation (Placement(transformation(
            origin={-154,-96},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b1(
        n(displayUnit="1") = {1,0,0},
        cylinderLength=cylinderLength,
        animation=animation,
        cylinderDiameter=0.055) 
        annotation (Placement(transformation(extent={{-114,-46},{-94,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid(r={crankPinLength/2,0,
            0}, animation=false) 
                   annotation (Placement(transformation(extent={{-144,-66},{-124,-46}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder(
        useAxisFlange=true,
        n(displayUnit="1") = {0,1,0},
        boxWidth=0.02,
        s(start=-0.2)) annotation (Placement(transformation(
            origin={-124,34},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting(r={crankLength,0,
            0}, animation=false) 
                   annotation (Placement(transformation(extent={{-144,64},{-124,84}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination(
        r={crankLength - crankPinLength/2,0,0},
        n_y={0,Modelica.Math.cos(cylinderInclinationAngle),Modelica.Math.sin(
            cylinderInclinationAngle)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-214,4},{-194,24}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle1(
        n_y={0,Modelica.Math.cos(crankAngleOffset),Modelica.Math.sin(
            crankAngleOffset)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-234,-126},{-214,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle2(
        n_y={0,Modelica.Math.cos(-crankAngleOffset),Modelica.Math.sin(-
            crankAngleOffset)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-74,-126},{-54,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop(r={0,
            cylinderTopPosition,0}, animation=false) 
                           annotation (Placement(transformation(
            origin={-174,34},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston1(
        diameter=0.1,
        r={0,pistonLength1,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(
            origin={164,4},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod1(
        widthDirection={1,0,0},
        height=0.06,
        color={0,0,200},
        width=0.02,
        r_shape={0,-0.02,0},
        r={0,rodLength1,0},
        animation=animation) annotation (Placement(transformation(
            origin={204,-36},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute b3(
        n={1,0,0},
        cylinderLength=cylinderLength1,
        animation=animation,
        cylinderDiameter=0.055) annotation (Placement(transformation(extent={{174,-26},
                {194,-6}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank5(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,-crankPinOffset1,0},
        animation=animation) 
        annotation (Placement(transformation(
            origin={194,-96},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank6(
        r_shape={-0.01,0,0},
        length=0.12,
        diameter=0.03,
        r={crankPinLength1,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{154.5,-86},
                {174.5,-66}})));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank7(
        diameter=0.05,
        r_shape={-0.01,0,0},
        length=0.12,
        r={crankLength1 - crankPinLength1,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{94,-126},
                {114,-106}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank8(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,crankPinOffset1,0},
        animation=animation) annotation (Placement(transformation(
            origin={134,-96},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b4(
        n={1,0,0},
        cylinderLength=cylinderLength1,
        animation=animation,
        cylinderDiameter=0.055) 
        annotation (Placement(transformation(extent={{174,-46},{194,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid1(r={crankPinLength1/2,
            0,0}, animation=false) 
                   annotation (Placement(transformation(extent={{144,-66},{164,-46}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder1(
        useAxisFlange=true,
        n(displayUnit="1") = {0,1,0},
        boxWidth=0.02,
        s(start=-0.2)) annotation (Placement(transformation(
            origin={164,34},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting1(r={crankLength1,
            0,0}, animation=false) 
                   annotation (Placement(transformation(extent={{144,64},{164,84}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination1(
        r={crankLength1 - crankPinLength1/2,0,0},
        n_y={0,Modelica.Math.cos(cylinderInclinationAngle1),Modelica.Math.sin(
            cylinderInclinationAngle1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{74,4},{94,24}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle3(
        n_y={0,Modelica.Math.cos(crankAngleOffset1),Modelica.Math.sin(
            crankAngleOffset1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{54,-126},{74,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle4(
        n_y={0,Modelica.Math.cos(-crankAngleOffset1),Modelica.Math.sin(-
            crankAngleOffset1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{214,-126},{234,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop1(r={0,
            cylinderTopPosition1,0}, animation=false) 
                           annotation (Placement(transformation(
            origin={114,34},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a 
        annotation (Placement(transformation(extent={{-260,58},{-228,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b 
        annotation (Placement(transformation(extent={{-60,58},{-28,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a 
        annotation (Placement(transformation(extent={{-260,-142},{-228,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b 
        annotation (Placement(transformation(extent={{-60,-142},{-28,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a1 
        annotation (Placement(transformation(extent={{28,58},{60,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a1 
        annotation (Placement(transformation(extent={{28,-142},{60,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b1 
        annotation (Placement(transformation(extent={{228,-142},{260,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b1 
        annotation (Placement(transformation(extent={{230,60},{262,92}})));
      Mechanical_Modules.Gas_Force sample_Gas annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-86,34})));
      Gas_Dynamic2 gas_Dynamic2_1(
      d1 = 0.15,
      l_d = 0.1,
      d2 = 0.12,
      dc = 0.18,
      P1(fixed = true),
      n1(fixed = true),
      n2(fixed = true),
      nt(fixed = true),
      Vm1 = 0.00583,
      Vm2 = 0.00816,
      Uc = 10000,
      Uf = 20000) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={4,-6})));
      Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1 
        annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
      Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor2 
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={50,0})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=600,
        duration=50,
        offset=293.15) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-34,-60})));
      Modelica.Blocks.Sources.Constant const1(k=293.15) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={44,-62})));
      Mechanical_Modules.Gas_Force sample_Gas1 
                                              annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={204,26})));
    equation
      connect(b1.frame_a,mid. frame_b) annotation (Line(
          points={{-114,-56},{-124,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod.frame_a,b1. frame_b) annotation (Line(
          points={{-84,-46},{-84,-56},{-94,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.frame_b,piston. frame_b) annotation (Line(
          points={{-124,24},{-124,14}},
          color={95,95,95},
          thickness=0.5));
      connect(crank1.frame_a,crankAngle1. frame_b) 
        annotation (Line(
          points={{-194,-116},{-214,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(b2.frame_a,piston. frame_a) annotation (Line(
          points={{-114,-16},{-124,-16},{-124,-6}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod.frame_b,b2. frame_b) annotation (Line(
          points={{-84,-26},{-84,-16},{-94,-16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank4.frame_b,crankAngle2. frame_a) annotation (Line(
          points={{-94,-106},{-94,-116},{-74,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination.frame_b,cylinderTop. frame_a) 
        annotation (Line(
          points={{-194,14},{-174,14},{-174,24}},
          color={95,95,95},
          thickness=0.5));
      connect(crank1.frame_b,crank2. frame_a) annotation (Line(
          points={{-174,-116},{-154,-116},{-154,-106}},
          color={95,95,95},
          thickness=0.5));
      connect(crank3.frame_b,crank4. frame_a) annotation (Line(
          points={{-113.5,-76},{-94,-76},{-94,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank3.frame_a,crank2. frame_b) annotation (Line(
          points={{-133.5,-76},{-154,-76},{-154,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank2.frame_b,mid. frame_a) annotation (Line(
          points={{-154,-86},{-154,-56},{-144,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderTop.frame_b,cylinder. frame_a) annotation (Line(
          points={{-174,44},{-174,54},{-124,54},{-124,44}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination.frame_a,cylinder_a)  annotation (Line(
          points={{-214,14},{-224,14},{-224,74},{-244,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting.frame_a,cylinder_a)  annotation (Line(
          points={{-144,74},{-244,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting.frame_b,cylinder_b)  annotation (Line(
          points={{-124,74},{-44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle1.frame_a,crank_a)  annotation (Line(
          points={{-234,-116},{-244,-116},{-244,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle2.frame_b,crank_b)  annotation (Line(
          points={{-54,-116},{-44,-116},{-44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(b4.frame_a,mid1. frame_b) annotation (Line(
          points={{174,-56},{164,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod1.frame_a,b4. frame_b) annotation (Line(
          points={{204,-46},{204,-56},{194,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder1.frame_b,piston1. frame_b) annotation (Line(
          points={{164,24},{164,14}},
          color={95,95,95},
          thickness=0.5));
      connect(crank7.frame_a,crankAngle3. frame_b) 
        annotation (Line(
          points={{94,-116},{74,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(b3.frame_a,piston1. frame_a) annotation (Line(
          points={{174,-16},{164,-16},{164,-6}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod1.frame_b,b3. frame_b) annotation (Line(
          points={{204,-26},{204,-16},{194,-16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank5.frame_b,crankAngle4. frame_a) annotation (Line(
          points={{194,-106},{194,-116},{214,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination1.frame_b,cylinderTop1. frame_a) annotation (Line(
          points={{94,14},{114,14},{114,24}},
          color={95,95,95},
          thickness=0.5));
      connect(crank7.frame_b,crank8. frame_a) annotation (Line(
          points={{114,-116},{134,-116},{134,-106}},
          color={95,95,95},
          thickness=0.5));
      connect(crank6.frame_b,crank5. frame_a) annotation (Line(
          points={{174.5,-76},{194,-76},{194,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank6.frame_a,crank8. frame_b) annotation (Line(
          points={{154.5,-76},{134,-76},{134,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank8.frame_b,mid1. frame_a) annotation (Line(
          points={{134,-86},{134,-56},{144,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderTop1.frame_b,cylinder1. frame_a) annotation (Line(
          points={{114,44},{114,54},{164,54},{164,44}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination1.frame_a,cylinder_a1)  annotation (Line(
          points={{74,14},{64,14},{64,74},{44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting1.frame_a,cylinder_a1)  annotation (Line(
          points={{144,74},{44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle3.frame_a,crank_a1)  annotation (Line(
          points={{54,-116},{44,-116},{44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle4.frame_b,crank_b1)  annotation (Line(
          points={{234,-116},{244,-116},{244,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crank_b,crank_a1)  annotation (Line(
          points={{-44,-126},{44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder_a1,cylinder_b)  annotation (Line(
          points={{44,74},{-44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder_b1,mounting1. frame_b) annotation (Line(
          points={{246,76},{246,74},{164,74}},
          color={95,95,95},
          thickness=0.5));
      connect(sample_Gas.flange_b, cylinder.support) annotation (Line(points={{
              -86,44},{-86,38},{-118,38}}, color={0,127,0}));
      connect(cylinder.axis, sample_Gas.flange_a) annotation (Line(points={{
              -118,26},{-116,26},{-116,24},{-86,24}}, color={0,127,0}));
      connect(gas_Dynamic2_1.fo, sample_Gas.f_mt) 
        annotation (Line(points={{-1,6.8},{-1,21.8},{-80,21.8}},
                                                               color={0,0,127}));
      connect(positionSensor2.flange, cylinder1.axis) annotation (Line(points={{60,-1.72085e-15},
              {60,-4},{140,-4},{140,16},{170,16},{170,26}}, color={0,127,0}));
      connect(positionSensor1.flange, cylinder.axis) annotation (Line(points={{-50,0},
              {-84,0},{-84,8},{-104,8},{-104,26},{-118,26}}, color={0,127,0}));
      connect(positionSensor1.s, gas_Dynamic2_1.u) annotation (Line(points={{-29,0},
              {-19.6,0},{-19.6,4.44089e-16},{-10.2,4.44089e-16}}, color={0,0,127}));
      connect(positionSensor2.s, gas_Dynamic2_1.u1) annotation (Line(points={{39,8.88178e-16},
              {28.5,8.88178e-16},{28.5,-8.88178e-16},{18,-8.88178e-16}}, color={0,0,
              127}));
      connect(ramp.y, gas_Dynamic2_1.u2) annotation (Line(points={{-34,-49},{-34,-24},
              {-10,-24},{-10,-12}}, color={0,0,127}));
      connect(const1.y, gas_Dynamic2_1.u3) annotation (Line(points={{44,-51},{44,-24},
              {18,-24},{18,-12}}, color={0,0,127}));
      connect(gas_Dynamic2_1.fo1, sample_Gas1.f_mt) annotation (Line(points={{9,
              6.8},{9,28},{68,28},{68,40},{96,40},{96,60},{136,60},{136,56},{
              212,56},{212,44},{220,44},{220,13.8},{210,13.8}}, color={0,0,127}));
      connect(sample_Gas1.flange_a, cylinder1.axis) annotation (Line(points={{
              204,16},{204,4},{184,4},{184,26},{170,26}}, color={0,127,0}));
      connect(cylinder1.support, sample_Gas1.flange_b) annotation (Line(points=
              {{170,38},{172,38},{172,36},{204,36}}, color={0,127,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-520,-300},
                {520,220}})), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-520,-300},{520,220}})));
    end Mechanical_Gas;
  end Gas_Dynamic_2;

  package Mechanical_Gas
    model Stirling
      import  Modelica.Units.SI;
      parameter Boolean animation=true;

      parameter SI.Length cylinderTopPosition=0.42;
      parameter SI.Length pistonLength=0.1;
      parameter SI.Length rodLength=0.2;
      parameter SI.Length crankLength=0.2;
      parameter SI.Length crankPinOffset=0.1;
      parameter SI.Length crankPinLength=0.1;
      parameter SI.Angle cylinderInclinationAngle=0;
      parameter SI.Angle crankAngleOffset=-1.5707963267949;
      parameter SI.Length cylinderLength=cylinderTopPosition - (pistonLength +
          rodLength - crankPinOffset);

      parameter SI.Length cylinderTopPosition1=0.42;
      parameter SI.Length pistonLength1=0.1;
      parameter SI.Length rodLength1=0.2;
      parameter SI.Length crankLength1=0.2;
      parameter SI.Length crankPinOffset1=0.1;
      parameter SI.Length crankPinLength1=0.1;
      parameter SI.Angle cylinderInclinationAngle1=1.5707963267949;
      parameter SI.Angle crankAngleOffset1=-1.5707963267949;
      parameter SI.Length cylinderLength1=cylinderTopPosition1 - (pistonLength1 +
          rodLength1 - crankPinOffset1);

      Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston(
        diameter=0.1,
        r={0,pistonLength,0},
        innerDiameter=0.05,
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(
            origin={-126,6},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod(
        widthDirection={1,0,0},
        height=0.06,
        color={0,0,200},
        width=0.02,
        r_shape={0,-0.02,0},
        r={0,rodLength,0},
        animation=animation) annotation (Placement(transformation(
            origin={-84,-36},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute b2(
        n(displayUnit="1") = {1,0,0},
        cylinderLength=cylinderLength,
        animation=animation,
        cylinderDiameter=0.055) annotation (Placement(transformation(extent={{-114,-26},
                {-94,-6}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank4(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,-crankPinOffset,0},
        animation=animation) 
        annotation (Placement(transformation(
            origin={-94,-96},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank3(
        r_shape={-0.01,0,0},
        length=0.12,
        diameter=0.03,
        r={crankPinLength,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{-133.5,-86},
                {-113.5,-66}})));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank1(
        diameter=0.05,
        r_shape={-0.01,0,0},
        length=0.12,
        r={crankLength - crankPinLength,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{-194,-126},
                {-174,-106}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank2(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,crankPinOffset,0},
        animation=animation) annotation (Placement(transformation(
            origin={-154,-96},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b1(
        n(displayUnit="1") = {1,0,0},
        cylinderLength=cylinderLength,
        animation=animation,
        cylinderDiameter=0.055) 
        annotation (Placement(transformation(extent={{-114,-46},{-94,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid(r={crankPinLength/2,0,
            0}, animation=false) 
                   annotation (Placement(transformation(extent={{-144,-66},{-124,-46}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder(
        useAxisFlange=true,
        n(displayUnit="1") = {0,1,0},
        boxWidth=0.02,
        s(start=0.2))  annotation (Placement(transformation(
            origin={-124,34},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting(r={crankLength,0,
            0}, animation=false) 
                   annotation (Placement(transformation(extent={{-144,64},{-124,84}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination(
        r={crankLength - crankPinLength/2,0,0},
        n_y={0,Modelica.Math.cos(cylinderInclinationAngle),Modelica.Math.sin(
            cylinderInclinationAngle)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-214,4},{-194,24}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle1(
        n_y={0,Modelica.Math.cos(crankAngleOffset),Modelica.Math.sin(
            crankAngleOffset)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-234,-126},{-214,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle2(
        n_y={0,Modelica.Math.cos(-crankAngleOffset),Modelica.Math.sin(-
            crankAngleOffset)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{-74,-126},{-54,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop(r={0,
            cylinderTopPosition,0}, animation=false) 
                           annotation (Placement(transformation(
            origin={-174,34},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder piston1(
        diameter=0.1,
        r={0,pistonLength1,0},
        innerDiameter=0.05,
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(
            origin={164,4},
            extent={{10,10},{-10,-10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.BodyBox connectingRod1(
        widthDirection={1,0,0},
        height=0.06,
        color={0,0,200},
        width=0.02,
        r_shape={0,-0.02,0},
        r={0,rodLength1,0},
        animation=animation) annotation (Placement(transformation(
            origin={204,-36},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.Revolute b3(
        n={1,0,0},
        cylinderLength=cylinderLength1,
        animation=animation,
        cylinderDiameter=0.055) annotation (Placement(transformation(extent={{174,-26},
                {194,-6}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank5(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,-crankPinOffset1,0},
        animation=animation) 
        annotation (Placement(transformation(
            origin={194,-96},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank6(
        r_shape={-0.01,0,0},
        length=0.12,
        diameter=0.03,
        r={crankPinLength1,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{154.5,-86},
                {174.5,-66}})));
      Modelica.Mechanics.MultiBody.Parts.BodyCylinder crank7(
        diameter=0.05,
        r_shape={-0.01,0,0},
        length=0.12,
        r={crankLength1 - crankPinLength1,0,0},
        color={180,180,180},
        animation=animation) annotation (Placement(transformation(extent={{94,-126},
                {114,-106}})));
      Modelica.Mechanics.MultiBody.Parts.BodyBox crank8(
        height=0.05,
        widthDirection={1,0,0},
        width=0.02,
        r={0,crankPinOffset1,0},
        animation=animation) annotation (Placement(transformation(
            origin={134,-96},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint b4(
        n={1,0,0},
        cylinderLength=cylinderLength1,
        animation=animation,
        cylinderDiameter=0.055) 
        annotation (Placement(transformation(extent={{174,-46},{194,-66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mid1(r={crankPinLength1/2,
            0,0}, animation=false) 
                   annotation (Placement(transformation(extent={{144,-66},{164,-46}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic cylinder1(
        useAxisFlange=true,
        n(displayUnit="1") = {0,1,0},
        boxWidth=0.02,
        s(start=0.2))  annotation (Placement(transformation(
            origin={164,34},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation mounting1(r={crankLength1,
            0,0}, animation=false) 
                   annotation (Placement(transformation(extent={{144,64},{164,84}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation cylinderInclination1(
        r={crankLength1 - crankPinLength1/2,0,0},
        n_y={0,Modelica.Math.cos(cylinderInclinationAngle1),Modelica.Math.sin(
            cylinderInclinationAngle1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{74,4},{94,24}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle3(
        n_y={0,Modelica.Math.cos(crankAngleOffset1),Modelica.Math.sin(
            crankAngleOffset1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{54,-126},{74,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation crankAngle4(
        n_y={0,Modelica.Math.cos(-crankAngleOffset1),Modelica.Math.sin(-
            crankAngleOffset1)},
        animation=false,
        rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors) 
        annotation (Placement(transformation(extent={{214,-126},{234,-106}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation cylinderTop1(r={0,
            cylinderTopPosition1,0}, animation=false) 
                           annotation (Placement(transformation(
            origin={114,34},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a 
        annotation (Placement(transformation(extent={{-260,58},{-228,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b 
        annotation (Placement(transformation(extent={{-60,58},{-28,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a 
        annotation (Placement(transformation(extent={{-260,-142},{-228,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b 
        annotation (Placement(transformation(extent={{-60,-142},{-28,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_a1 
        annotation (Placement(transformation(extent={{28,58},{60,90}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_a1 
        annotation (Placement(transformation(extent={{28,-142},{60,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a crank_b1 
        annotation (Placement(transformation(extent={{228,-142},{260,-110}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a cylinder_b1 
        annotation (Placement(transformation(extent={{230,60},{262,92}})));
      Modelica.Blocks.Sources.Constant const1(k=273.15+50) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={42,-36})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=440,
        duration=0,
        offset=273.15) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-38,-36})));
      Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor 
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={26,10})));
      Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1 
        annotation (Placement(transformation(extent={{-80,-2},{-60,18}})));
      Mechanical_Modules.Gas_Force sample_Gas annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-90,42})));
      Gas_Dynamic_3.Gas_Dynamic3 gas_Dynamic3_1(
      d1 = 0.14,
      l_d = 0.1,
      d2 = 0.14,
      dc = 0.16,
      P1(fixed = true),
      n1(fixed = true),
      n2(fixed = true),
      nt(fixed = true),
      Vm1 = 0.0015,
      Vm2 = 0.002,
      Uc = 1150,
      Uf = 1000,Z=10,Po=8.999999999999999e5) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-22,4})));
      Mechanical_Modules.Gas_Force sample_Gas1 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={202,40})));
    equation
      connect(b1.frame_a,mid. frame_b) annotation (Line(
          points={{-114,-56},{-124,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod.frame_a,b1. frame_b) annotation (Line(
          points={{-84,-46},{-84,-56},{-94,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.frame_b,piston. frame_b) annotation (Line(
          points={{-124,24},{-124,16},{-126,16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank1.frame_a,crankAngle1. frame_b) 
        annotation (Line(
          points={{-194,-116},{-214,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(b2.frame_a,piston. frame_a) annotation (Line(
          points={{-114,-16},{-126,-16},{-126,-4}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod.frame_b,b2. frame_b) annotation (Line(
          points={{-84,-26},{-84,-16},{-94,-16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank4.frame_b,crankAngle2. frame_a) annotation (Line(
          points={{-94,-106},{-94,-116},{-74,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination.frame_b,cylinderTop. frame_a) 
        annotation (Line(
          points={{-194,14},{-174,14},{-174,24}},
          color={95,95,95},
          thickness=0.5));
      connect(crank1.frame_b,crank2. frame_a) annotation (Line(
          points={{-174,-116},{-154,-116},{-154,-106}},
          color={95,95,95},
          thickness=0.5));
      connect(crank3.frame_b,crank4. frame_a) annotation (Line(
          points={{-113.5,-76},{-94,-76},{-94,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank3.frame_a,crank2. frame_b) annotation (Line(
          points={{-133.5,-76},{-154,-76},{-154,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank2.frame_b,mid. frame_a) annotation (Line(
          points={{-154,-86},{-154,-56},{-144,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderTop.frame_b,cylinder. frame_a) annotation (Line(
          points={{-174,44},{-174,54},{-124,54},{-124,44}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination.frame_a,cylinder_a)  annotation (Line(
          points={{-214,14},{-224,14},{-224,74},{-244,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting.frame_a,cylinder_a)  annotation (Line(
          points={{-144,74},{-244,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting.frame_b,cylinder_b)  annotation (Line(
          points={{-124,74},{-44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle1.frame_a,crank_a)  annotation (Line(
          points={{-234,-116},{-244,-116},{-244,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle2.frame_b,crank_b)  annotation (Line(
          points={{-54,-116},{-44,-116},{-44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(b4.frame_a,mid1. frame_b) annotation (Line(
          points={{174,-56},{164,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod1.frame_a,b4. frame_b) annotation (Line(
          points={{204,-46},{204,-56},{194,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder1.frame_b,piston1. frame_b) annotation (Line(
          points={{164,24},{164,14}},
          color={95,95,95},
          thickness=0.5));
      connect(crank7.frame_a,crankAngle3. frame_b) 
        annotation (Line(
          points={{94,-116},{74,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(b3.frame_a,piston1. frame_a) annotation (Line(
          points={{174,-16},{164,-16},{164,-6}},
          color={95,95,95},
          thickness=0.5));
      connect(connectingRod1.frame_b,b3. frame_b) annotation (Line(
          points={{204,-26},{204,-16},{194,-16}},
          color={95,95,95},
          thickness=0.5));
      connect(crank5.frame_b,crankAngle4. frame_a) annotation (Line(
          points={{194,-106},{194,-116},{214,-116}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination1.frame_b,cylinderTop1. frame_a) annotation (Line(
          points={{94,14},{114,14},{114,24}},
          color={95,95,95},
          thickness=0.5));
      connect(crank7.frame_b,crank8. frame_a) annotation (Line(
          points={{114,-116},{134,-116},{134,-106}},
          color={95,95,95},
          thickness=0.5));
      connect(crank6.frame_b,crank5. frame_a) annotation (Line(
          points={{174.5,-76},{194,-76},{194,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank6.frame_a,crank8. frame_b) annotation (Line(
          points={{154.5,-76},{134,-76},{134,-86}},
          color={95,95,95},
          thickness=0.5));
      connect(crank8.frame_b,mid1. frame_a) annotation (Line(
          points={{134,-86},{134,-56},{144,-56}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderTop1.frame_b,cylinder1. frame_a) annotation (Line(
          points={{114,44},{114,54},{164,54},{164,44}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinderInclination1.frame_a,cylinder_a1)  annotation (Line(
          points={{74,14},{64,14},{64,74},{44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(mounting1.frame_a,cylinder_a1)  annotation (Line(
          points={{144,74},{44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle3.frame_a,crank_a1)  annotation (Line(
          points={{54,-116},{44,-116},{44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crankAngle4.frame_b,crank_b1)  annotation (Line(
          points={{234,-116},{244,-116},{244,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(crank_b,crank_a1)  annotation (Line(
          points={{-44,-126},{44,-126}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder_a1,cylinder_b)  annotation (Line(
          points={{44,74},{-44,74}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder_b1,mounting1. frame_b) annotation (Line(
          points={{246,76},{246,74},{164,74}},
          color={95,95,95},
          thickness=0.5));
      connect(sample_Gas.flange_b, cylinder.support) 
        annotation (Line(points={{-90,52},{-118,52},{-118,38}}, color={0,127,0}));
      connect(cylinder.axis, positionSensor1.flange) annotation (Line(points={{-118,
              26},{-96,26},{-96,8},{-80,8}}, color={0,127,0}));
      connect(positionSensor.flange, cylinder1.axis) annotation (Line(points={{36,10},
              {36,8},{68,8},{68,40},{96,40},{96,60},{136,60},{136,56},{180,56},{180,
              26},{170,26}}, color={0,127,0}));
      connect(positionSensor1.s, gas_Dynamic3_1.u) 
        annotation (Line(points={{-59,8},{-59,10},{-36.2,10}}, color={0,0,127}));
      connect(gas_Dynamic3_1.u1, positionSensor.s) annotation (Line(points={{-8,10},
              {3.5,10},{3.5,10},{15,10}}, color={0,0,127}));
      connect(gas_Dynamic3_1.fo, sample_Gas.f_mt) annotation (Line(points={{-27,
              16.8},{-27,29.8},{-84,29.8}},
                                      color={0,0,127}));
      connect(ramp.y, gas_Dynamic3_1.u2) annotation (Line(points={{-38,-25},{-38,-13.5},
              {-36,-13.5},{-36,-2}}, color={0,0,127}));
      connect(gas_Dynamic3_1.u3, const1.y) annotation (Line(points={{-8,-2},{-8,-12},
              {42,-12},{42,-25}}, color={0,0,127}));
      connect(sample_Gas.flange_a, cylinder.axis) 
        annotation (Line(points={{-90,32},{-90,26},{-118,26}}, color={0,127,0}));
      connect(gas_Dynamic3_1.fo1, sample_Gas1.f_mt) annotation (Line(points={{
              -17,16.8},{-17,20},{4,20},{4,-8},{140,-8},{140,16},{208,16},{208,
              27.8}}, color={0,0,127}));
      connect(sample_Gas1.flange_a, cylinder1.axis) annotation (Line(points={{
              202,30},{204,30},{204,26},{170,26}}, color={0,127,0}));
      connect(sample_Gas1.flange_b, cylinder1.support) annotation (Line(points=
              {{202,50},{184,50},{184,38},{170,38}}, color={0,127,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-520,-300},
                {520,220}})), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-520,-300},{520,220}})));
    end Stirling;

  end Mechanical_Gas;

  package Gas_Dynamic_3
    model Gas_Dynamic3
      extends Gas_Dynamic_2.Gas_Partial2;
      parameter Modelica.Units.SI.Pressure Po = 900000;
      parameter Modelica.Units.SI.Pressure P_ini = 100000;
      parameter Modelica.Units.SI.ThermodynamicTemperature To = 273.15;

      parameter .Real M = 4;
      parameter .Real R = 8314.472;
      parameter .Real cv = 3213.7;
      parameter .Real mu = 1.89e-5;

      parameter .Real d1 "diameter of first piston";
      parameter .Real l_d;
      parameter .Real d2 "diameter of second piston";
      parameter .Real dc;
      constant .Real pi = 3.1415926;
      parameter .Real A1 = pi*(d1^2)/4;
      parameter .Real A2 = pi*(d2^2)/4;
      parameter .Real A_an = pi*(dc^2 - d1^2)/4;
      parameter .Real V_1 = A_an * l_d * 10;
      parameter .Real Vm1;
      parameter .Real Vm2;
      parameter .Real V1o = Vm1 + A1*(1+sin(3.1514/2))/10;
      parameter .Real V2o = Vm2 + A2*(1/10) - A1*(1+sin(3.1514/2))/10;
      parameter .Real n1_o = (Po*V1o)/(R*To);
      parameter .Real n2_o = (Po*V2o)/(R*To);
      parameter Modelica.Units.SI.Volume VT = V1o + V2o + V_1;
      parameter .Real nt_o = (Po*VT)/(R*To);
      parameter .Real A_l = pi*d1*l_d;
      parameter .Real Rp = R/M;
      parameter .Real Uc;
      parameter .Real Uf;
      parameter .Real Ac = A1;
      parameter .Real Af = A2;

      parameter .Real m_reg = 0.01;
      parameter .Real cp_reg = 1000;
      parameter .Real U_reg = 200;

      // calculate power
      parameter .Real Z = 1;

      // others Q_loss
      parameter .Real k_o = 5;

       .Real power_cal;
       .Real nt(start = nt_o);
       .Real V1   ;
       .Real V2   ;
       .Real P1(start = Po);
       .Real P2(start = Po);
       .Real n1(start = n1_o);
       .Real n2(start = n2_o);
       .Real n_l(start = nt_o - n1_o - n2_o);
       .Real m1   ;
       .Real m2   ;
       .Real m_l   ;
       .Real mt   ;
       .Real T1(start = To);
       .Real T2(start = To);
       .Real T_l(start = To);
       .Real sp   ;
       .Real sd   ;
       .Real ro1   ;
       .Real ro2   ;
       .Real P_l(start = Po);
       .Real c;
       .Real mp2   ;
       .Real mp1   ;
       .Real ro_l   ;
       .Real Qc(start = n1_o*M*cv*To);
       .Real Qf(start = n2_o*M*cv*To);
       .Real Q_l(start = (nt_o-n1_o-n2_o)*M*cv*To);
       .Real Qpc;
       .Real Qpf;

       .Real T_reg(start = To);
       .Real Q_reg(start = m_reg*cp_reg*To);
       .Real Qp_reg;

       .Real B_n;
       //.Real power_one_cycle;
       .Real power;
       // conduction loss
       .Real Qpo;
       .Real Qpr;
    equation
      sd = -u;
      sp = -u1;

      V1 = Vm1 + A1*sd;
      V2 = Vm2 + A2*sp - A1*sd + 2*l_d*A1;

      P_l = (P1+P2)/2;

      // 初始化“质量”
      M*n1 = m1;
      M*n2 = m2;
      M*n_l = m_l;

      mt = m1 + m2 + m_l;
      nt = mt/M;

      //
      V1*P1 = n1*R*T1;
      V2*P2 = n2*R*T2;

      // 初始化“密度”
      ro1 = P1/(Rp*T1);
      ro2 = P2/(Rp*T2);
      ro_l = P_l/(Rp*T_l);

      Qpc = Uc*(u2-T1);
      Qpf = (-Uf)*(T2-u3);
      Qpo = k_o * (u2 - u3);
      Qpr = nt * 15000 * (T1 - T2);
      Qc = m1*cv*T1;
      Qf = m2*cv*T2;

      Q_l = m_l*cv*T_l;

      if c<0 then
        mp1 = c*A_an*ro_l*1;
        mp2 = c*A_an*ro2*1;
      else
        mp1 = c*A_an*ro1*1;
        mp2 = c*A_an*ro_l*1;
      end if;

      der(m1) = -mp1;
      der(m_l) = mp1 - mp2;
      der(m2) = mp2;

      B_n = 0.33*(u2-u3)/(u2+u3);

      if c<0 then
        power_cal = -(B_n*Z*pi/8*P_l*d1*d1*c);
      else
        power_cal = (B_n*Z*pi/8*P_l*d1*d1*c);
      end if;

      (P1-P2)*A_an - A_l*mu*(der(sd)/((dc-d1)/2)) = c*der(m_l)/5000 + m_l*der(c)/5000;


      Qp_reg =  U_reg*(T_reg - T_l);


      Q_reg = m_reg*cp_reg*(T_reg);


      der(Q_reg) = -Qp_reg;

      if c<0 then
        der(Q_l) = -mp2*cv*T2 + mp1*cv*T_l + Qp_reg;
      else
        der(Q_l) = -mp2*cv*T_l + mp1*cv*T1 + Qp_reg;
      end if;

      if c<0 then
        der(Qc) = Qpc - mp1*cv*T_l - power_cal - Qpo - Qpr;
      else
        der(Qc) = Qpc - mp1*cv*T1;
      end if;

      if c<0 then
        der(Qf) = Qpf + mp2*cv*T2;
      else
        der(Qf) = Qpf + mp2*cv*T_l;
      end if;

      power = Qpc + Qpf - Qpo - Qpr;

      f = (P2-P_ini)*A2;
      f1 = (P1-P_ini)*A1*16/25;

    end Gas_Dynamic3;

    model Gas_Dynamic3_test
      Modelica.Blocks.Sources.Ramp ramp(height=600,
        duration=3,                                 offset=273.15) 
                      annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-50,-26})));
      Modelica.Blocks.Sources.Constant const(k=293.15) 
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={52,-32})));
      Modelica.Blocks.Sources.Constant const1(k=120) 
                                                   annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-42,42})));
      Gas_Dynamic3_1 gas_Dynamic3_1_1(
      d1 = 0.15,
      l_d = 0.1,
      d2 = 0.12,
      dc = 0.18,
      P1(fixed = true),
      n1(fixed = true),
      n2(fixed = true),
      nt(fixed = true),
      Vm1 = 0.00583,
      Vm2 = 0.00816,
      Uc = 800,
      Uf = 800) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={6,0})));
      //Vm1 = 0.00583,
      //Vm2 = 0.00816,
    equation
      connect(const1.y, gas_Dynamic3_1_1.u) 
        annotation (Line(points={{-42,31},{-42,6},{-8.2,6}}, color={0,0,127}));
      connect(const1.y, gas_Dynamic3_1_1.u1) annotation (Line(points={{-42,31},
              {-42,6},{-14,6},{-14,16},{28,16},{28,6},{20,6}},
                                                          color={0,0,127}));
      connect(ramp.y, gas_Dynamic3_1_1.u2) 
        annotation (Line(points={{-50,-15},{-50,-6},{-8,-6}}, color={0,0,127}));
      connect(const.y, gas_Dynamic3_1_1.u3) 
        annotation (Line(points={{52,-21},{52,-6},{20,-6}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Gas_Dynamic3_test;

    model Gas_Dynamic3_1
      extends Gas_Dynamic_2.Gas_Partial2;
      // 系统初始参数----------------------------------------------------------------
      // 系统内的起始气压
      parameter Modelica.Units.SI.Pressure Po = 900000;
      // 系统外的大气压
      parameter Modelica.Units.SI.Pressure P_ini = 100000;
      // 系统内的起始温度
      parameter Modelica.Units.SI.ThermodynamicTemperature To = 293.15;

      // 气体热力学参数---------------------------------------------------------------
      // 氦气的摩尔质量
      parameter .Real M = 4;
      // 气体常数（J/(kmol*K)）
      parameter .Real R = 8314.472;
      // 氦气比热容
      parameter .Real cv = 3213.7;
      // 粘性系数
      parameter .Real mu = 1.89e-5;
      // 膨胀活塞直径
      parameter .Real d1 "diameter of first piston";
      // 活塞长度
      parameter .Real l_d;
      // 压缩活塞直径
      parameter .Real d2 "diameter of second piston";
      // 气缸直径
      parameter .Real dc;
      // Π
      constant .Real pi = 3.1415926;
      // 膨胀活塞面积
      parameter .Real A1 = pi*(d1^2)/4;
      // 压缩活塞面积
      parameter .Real A2 = pi*(d2^2)/4;
      // 活塞和气缸间气隙的横截面积
      parameter .Real A_an = pi*(dc^2 - d1^2)/4;
      // 通道体积
      parameter .Real V_1 = A_an * l_d * 10;
      // 膨胀气缸死体积
      parameter .Real Vm1;
      // 压缩气缸死体积
      parameter .Real Vm2;
      // 膨胀气缸内工质的起始体积
      parameter .Real V1o = Vm1 + A1*(1+sin(3.1514/2))/10;
      // 压缩气缸内工质的起始体积
      parameter .Real V2o = Vm2 + A2*(1/10) - A1*(1+sin(3.1514/2))/10;
      // 膨胀气缸内工质的起始的物质的量
      parameter .Real n1_o = (Po*V1o)/(R*To);
      // 压缩气缸内工质的起始的物质的量
      parameter .Real n2_o = (Po*V2o)/(R*To);
      // 发动机内工质的总体积
      parameter Modelica.Units.SI.Volume VT = V1o + V2o + V_1;
      // 发动机内所有工质的起始的物质的量
      parameter .Real nt_o = (Po*VT)/(R*To);
      // 通道面积
      parameter .Real A_l = pi*d1*l_d;
      // 氦气的理想气体常数
      parameter .Real Rp = R/M;
      // 加热端的换热系数
      parameter .Real Uc;
      // 冷却端的换热系数
      parameter .Real Uf;
      // 加热端的换热面积
      parameter .Real Ac = A1;
      // 冷却端的换热面积
      parameter .Real Af = A2;

      // 蓄热器参数------------------------------------------------------------------
      // 蓄热器质量
      parameter .Real m_reg = 0.01;
      // 蓄热器比热容
      parameter .Real cp_reg = 1000;
      // 蓄热器换热能力（W/K）
      parameter .Real U_reg = 200;

      // 功率相关参数----------------------------------------------------------------
      // calculate power
      parameter .Real Z = 1;

      // 热损失相关参数---------------------------------------------------------------
      // 热传导损失的系数
      parameter .Real k_o = 5;

      // 待求解变量------------------------------------------------------------------
      // 气体工质的总物质的量
       .Real nt(start = nt_o);
       // 膨胀气缸内工质的体积
       .Real V1   ;
       // 压缩气缸内工质的体积
       .Real V2   ;
       // 膨胀气缸内工质的气压
       .Real P1(start = Po);
       // 压缩气缸内工质的气压
       .Real P2(start = Po);
       // 膨胀气缸内工质的物质的量
       .Real n1(start = n1_o);
       // 压缩气缸内工质的物质的量
       .Real n2(start = n2_o);
       // 通道内工质的物质的量
       .Real n_l(start = nt_o - n1_o - n2_o);
       // 膨胀气缸内工质的质量
       .Real m1   ;
       // 压缩气缸内工质的质量
       .Real m2   ;
       // 通道内工质的质量
       .Real m_l   ;
       // 发动机系统内工质的总质量
       .Real mt   ;
       // 膨胀气缸内工质的温度
       .Real T1(start = To);
       // 压缩气缸内工质的温度
       .Real T2(start = To);
       // 通道内工质的温度
       .Real T_l(start = To);
       // 压缩活塞的位移
       .Real sp   ;
       // 膨胀活塞的位移
       .Real sd   ;
       // 膨胀气缸内工质的密度
       .Real ro1   ;
       // 压缩气缸内工质的密度
       .Real ro2   ;
       // 通道内工质的气压
       .Real P_l(start = Po);
       // 膨胀活塞的运动速度
       .Real c;
       // 压缩气缸内工质的质量流
       .Real mp2   ;
       // 膨胀气缸内工质的质量流
       .Real mp1   ;
       // 通道内工质的密度
       .Real ro_l   ;
       // 膨胀气缸内工质的热量
       .Real Qc(start = n1_o*M*cv*To);
       // 压缩气缸内工质的热量
       .Real Qf(start = n2_o*M*cv*To);
       // 通道内工质的热量
       .Real Q_l(start = (nt_o-n1_o-n2_o)*M*cv*To);
       // 膨胀气缸内工质从热源的吸热量（系统的总热量流入）
       .Real Qpc;
       // 压缩气缸内工质向冷源的放热量（系统的总热量流出）
       .Real Qpf;

       // 蓄热器温度
       .Real T_reg(start = To);
       // 蓄热器热量
       .Real Q_reg(start = m_reg*cp_reg*To);
       // 蓄热器热流
       .Real Qp_reg;

       // 计算功率用的系数
       .Real B_n;
       // 参与计算的实时功率（不方便记录）
       .Real power_cal;
       // 功率
       .Real power;
       // 热传导损耗
       .Real Qpo;
       // 蓄热器损耗
       .Real Qpr;
    equation
      // 两个活塞的位移轨迹
      sd = (1+sin(u1*time+3.1514/2))/10;
      sp = (1+sin(u*time))/10;

      V1 = Vm1 + A1*sd;
      V2 = Vm2 + A2*sp - A1*sd + 2*l_d*A1;

      P_l = (P1+P2)/2;

      // 初始化“质量”
      M*n1 = m1;
      M*n2 = m2;
      M*n_l = m_l;

      mt = m1 + m2 + m_l;
      nt = mt/M;

      //
      V1*P1 = n1*R*T1;
      V2*P2 = n2*R*T2;

      // 初始化“密度”
      ro1 = P1/(Rp*T1);
      ro2 = P2/(Rp*T2);
      ro_l = P_l/(Rp*T_l);

      Qpc = Uc*(u2-T1);
      Qpf = (-Uf)*(T2-u3);
      Qpo = k_o * (u2 - u3);
      Qpr = nt * 15000 * (T1 - T2);
      Qc = m1*cv*T1;
      Qf = m2*cv*T2;

      Q_l = m_l*cv*T_l;

      // 根据活塞的运动方向判断热流走向
      if c<0 then
        mp1 = c*A_an*ro_l*1;
        mp2 = c*A_an*ro2*1;
      else
        mp1 = c*A_an*ro1*1;
        mp2 = c*A_an*ro_l*1;
      end if;

      // 各部分的质量流
      der(m1) = -mp1;
      der(m_l) = mp1 - mp2;
      der(m2) = mp2;

      B_n = 0.33*(u2-u3)/(u2+u3);

      // 计算实时功率
      if c<0 then
        power_cal = -(B_n*Z*pi/8*P_l*d1*d1*c);
      else
        power_cal = (B_n*Z*pi/8*P_l*d1*d1*c);
      end if;


      (P1-P2)*A_an - A_l*mu*(der(sd)/((dc-d1)/2)) = c*der(m_l)/(u*20) + m_l*der(c)/(u*20);


      Qp_reg =  U_reg*(T_reg - T_l);


      Q_reg = m_reg*cp_reg*(T_reg);


      der(Q_reg) = -Qp_reg;

      // 根据活塞运动方向判断通道内热量的改变情况
      if c<0 then
        der(Q_l) = -mp2*cv*T2 + mp1*cv*T_l + Qp_reg;
      else
        der(Q_l) = -mp2*cv*T_l + mp1*cv*T1 + Qp_reg;
      end if;

      // 根据活塞运动方向判断高温气缸内工质的热量改变情况
      if c<0 then
        der(Qc) = Qpc - mp1*cv*T_l - power_cal - Qpo - Qpr;
      else
        der(Qc) = Qpc - mp1*cv*T1;
      end if;

      // 根据活塞运动方向判断高温气缸内工质的热量改变情况
      if c<0 then
        der(Qf) = Qpf + mp2*cv*T2;
      else
        der(Qf) = Qpf + mp2*cv*T_l;
      end if;

      // 能量守恒，计算功率
      power = Qpc + Qpf - Qpo - Qpr;

      // 压缩活塞的驱动力
      f = (P2-P_ini)*A2;
      // 膨胀活塞的驱动力
      f1 = (P1-P_ini)*A1*16/25;
    end Gas_Dynamic3_1;
  end Gas_Dynamic_3;

  package Stirling
    model Stirling_test
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true, n(
            displayUnit="1") = {1,0,0}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-26,-20})));
      inner Modelica.Mechanics.MultiBody.World world 
        annotation (Placement(transformation(extent={{-80,38},{-60,58}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2) 
        annotation (Placement(transformation(extent={{-64,-74},{-44,-54}})));
      Mechanical_Gas.Stirling stirling(
        crankAngleOffset=-1.5707963267949,
        cylinderInclinationAngle1=1.5707963267949,
        crankAngleOffset1=-1.5707963267949) 
        annotation (Placement(transformation(extent={{56,10},{160,62}})));
    equation
      connect(world.frame_b, revolute.frame_b) annotation (Line(
          points={{-60,48},{-52,48},{-52,-20},{-36,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(inertia.flange_b, revolute.axis) 
        annotation (Line(points={{-44,-64},{-26,-64},{-26,-30}}, color={0,0,0}));
      connect(world.frame_b, stirling.cylinder_a) annotation (Line(
          points={{-60,48},{52,48},{52,66},{83.6,66},{83.6,47.4}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute.frame_a, stirling.crank_a) annotation (Line(
          points={{-16,-20},{83.6,-20},{83.6,27.4}},
          color={95,95,95},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {200,100}})), Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{200,100}})),
        experiment(StopTime=10,Interval=0.001,__Dymola_Algorithm="Dassl",Algorithm=Dassl,InlineIntegrator=false,InlineStepSize=false,StartTime=0,StoreEventValue=0,Tolerance=0.0001));
    end Stirling_test;

  end Stirling;

  package Stirling_711
    model Gas_Dynamic_711
      extends Gas_Dynamic_2.Gas_Partial2;
      // 系统初始参数----------------------------------------------------------------
      // 系统内的起始气压
      parameter Modelica.Units.SI.Pressure Po = 1000000;
      // 系统外的大气压
      parameter Modelica.Units.SI.Pressure P_ini = 100000;
      // 系统内的起始温度
      parameter Modelica.Units.SI.ThermodynamicTemperature To = 273.15;

      // 气体热力学参数---------------------------------------------------------------
      // 氦气的摩尔质量
      parameter .Real M = 4;
      // 气体常数（J/(kmol*K)）
      parameter .Real R = 8314.472;
      // 氦气比热容
      parameter .Real cv = 3213.7;
      // 粘性系数
      parameter .Real mu = 1.89e-5;
      // 膨胀活塞直径
      parameter .Real d1 "diameter of first piston";
      // 活塞长度
      parameter .Real l_d;
      // 压缩活塞直径
      parameter .Real d2 "diameter of second piston";
      // 气缸直径
      parameter .Real dc;
      // Π
      constant .Real pi = 3.1415926;
      // 膨胀活塞面积
      parameter .Real A1 = pi*(d1^2)/4;
      // 压缩活塞面积
      parameter .Real A2 = pi*(d2^2)/4;
      // 活塞和气缸间气隙的横截面积
      parameter .Real A_an = pi*(dc^2 - d1^2)/4;
      // 通道体积
      parameter .Real V_1 = A_an * l_d * 10;
      // 膨胀气缸死体积
      parameter .Real Vm1;
      // 压缩气缸死体积
      parameter .Real Vm2;
      // 膨胀气缸内工质的起始体积
      parameter .Real V1o = Vm1 + A1*(1+sin(3.1514/2))/10;
      // 压缩气缸内工质的起始体积
      parameter .Real V2o = Vm2 + A2*(1/10) - A1*(1+sin(3.1514/2))/10;
      // 膨胀气缸内工质的起始的物质的量
      parameter .Real n1_o = (Po*V1o)/(R*To);
      // 压缩气缸内工质的起始的物质的量
      parameter .Real n2_o = (Po*V2o)/(R*To);
      // 发动机内工质的总体积
      parameter Modelica.Units.SI.Volume VT = V1o + V2o + V_1;
      // 发动机内所有工质的起始的物质的量
      parameter .Real nt_o = (Po*VT)/(R*To);
      // 通道面积
      parameter .Real A_l = pi*d1*l_d;
      // 氦气的理想气体常数
      parameter .Real Rp = R/M;
      // 加热端的换热系数
      parameter .Real Uc;
      // 冷却端的换热系数
      parameter .Real Uf;
      // 加热端的换热面积
      parameter .Real Ac = A1;
      // 冷却端的换热面积
      parameter .Real Af = A2;

      // 蓄热器参数------------------------------------------------------------------
      // 蓄热器质量
      parameter .Real m_reg = 0.01;
      // 蓄热器比热容
      parameter .Real cp_reg = 1000;
      // 蓄热器换热能力（W/K）
      parameter .Real U_reg = 200;

      // 功率相关参数----------------------------------------------------------------
      // calculate power
      parameter .Real Z = 1;

      // 热损失相关参数---------------------------------------------------------------
      // 热传导损失的系数
      parameter .Real k_o = 5;

      // 待求解变量------------------------------------------------------------------
      // 气体工质的总物质的量
       .Real nt(start = nt_o);
       // 膨胀气缸内工质的体积
       .Real V1   ;
       // 压缩气缸内工质的体积
       .Real V2   ;
       // 膨胀气缸内工质的气压
       .Real P1(start = Po);
       // 压缩气缸内工质的气压
       .Real P2(start = Po);
       // 膨胀气缸内工质的物质的量
       .Real n1(start = n1_o);
       // 压缩气缸内工质的物质的量
       .Real n2(start = n2_o);
       // 通道内工质的物质的量
       .Real n_l(start = nt_o - n1_o - n2_o);
       // 膨胀气缸内工质的质量
       .Real m1   ;
       // 压缩气缸内工质的质量
       .Real m2   ;
       // 通道内工质的质量
       .Real m_l   ;
       // 发动机系统内工质的总质量
       .Real mt   ;
       // 膨胀气缸内工质的温度
       .Real T1(start = To);
       // 压缩气缸内工质的温度
       .Real T2(start = To);
       // 通道内工质的温度
       .Real T_l(start = To);
       // 压缩活塞的位移
       .Real sp   ;
       // 膨胀活塞的位移
       .Real sd   ;
       // 膨胀气缸内工质的密度
       .Real ro1   ;
       // 压缩气缸内工质的密度
       .Real ro2   ;
       // 通道内工质的气压
       .Real P_l(start = Po);
       // 膨胀活塞的运动速度
       .Real c;
       // 压缩气缸内工质的质量流
       .Real mp2   ;
       // 膨胀气缸内工质的质量流
       .Real mp1   ;
       // 通道内工质的密度
       .Real ro_l   ;
       // 膨胀气缸内工质的热量
       .Real Qc(start = n1_o*M*cv*To);
       // 压缩气缸内工质的热量
       .Real Qf(start = n2_o*M*cv*To);
       // 通道内工质的热量
       .Real Q_l(start = (nt_o-n1_o-n2_o)*M*cv*To);
       // 膨胀气缸内工质从热源的吸热量（系统的总热量流入）
       .Real Qpc;
       // 压缩气缸内工质向冷源的放热量（系统的总热量流出）
       .Real Qpf;

       // 蓄热器温度
       .Real T_reg(start = To);
       // 蓄热器热量
       .Real Q_reg(start = m_reg*cp_reg*To);
       // 蓄热器热流
       .Real Qp_reg;

       // 计算功率用的系数
       .Real B_n;
       // 参与计算的实时功率（不方便记录）
       .Real power_cal;
       // 功率
       .Real power;
       // 热传导损耗
       .Real Qpo;
       // 蓄热器损耗
       .Real Qpr;
       // 流阻热损
       .Real Qfr;
    equation
      // 两个活塞的位移轨迹(行程为0.1m)
      sd = (sin(u1*time+3.1514/2))/20;
      sp = (sin(u*time))/20;

      V1 = Vm1 + A1*sd;
      V2 = Vm2 + A2*sp - A1*sd + 2*l_d*A1;

      P_l = (P1+P2)/2;

      // 初始化“质量”
      M*n1 = m1;
      M*n2 = m2;
      M*n_l = m_l;

      mt = m1 + m2 + m_l;
      nt = mt/M;

      //
      V1*P1 = n1*R*T1;
      V2*P2 = n2*R*T2;

      // 初始化“密度”
      ro1 = P1/(Rp*T1);
      ro2 = P2/(Rp*T2);
      ro_l = P_l/(Rp*T_l);

      Qpc = Uc*(u2-T1);
      Qpf = (-Uf)*(T2-u3);
      Qpo = k_o * (u2 - u3);
      Qpr = nt * 5000 * (T1 - T2);
      if c<0 then
        Qfr = -1000*c*A_l;
      else
        Qfr = 1000*c*A_l;
      end if;
      Qc = m1*cv*T1;
      Qf = m2*cv*T2;

      Q_l = m_l*cv*T_l;

      // 根据活塞的运动方向判断热流走向
      if c<0 then
        mp1 = c*A_an*ro_l*1;
        mp2 = c*A_an*ro2*1;
      else
        mp1 = c*A_an*ro1*1;
        mp2 = c*A_an*ro_l*1;
      end if;

      // 各部分的质量流
      der(m1) = -mp1;
      der(m_l) = mp1 - mp2;
      der(m2) = mp2;

      B_n = 0.33*(u2-u3)/(u2+u3);

      // 计算实时功率
      if c<0 then
        power_cal = -(B_n*Z*pi/8*P_l*d1*d1*c);
      else
        power_cal = (B_n*Z*pi/8*P_l*d1*d1*c);
      end if;

      (P1-P2)*A_an - A_l*mu*(der(sd)/((dc-d1)/2)) = c*der(m_l)/(u) + m_l*der(c)/(u);

      Qp_reg =  U_reg*(T_reg - T_l);

      Q_reg = m_reg*cp_reg*(T_reg);

      der(Q_reg) = -Qp_reg;

      // 根据活塞运动方向判断通道内热量的改变情况
      if c<0 then
        der(Q_l) = -mp2*cv*T2 + mp1*cv*T_l + Qp_reg;
      else
        der(Q_l) = -mp2*cv*T_l + mp1*cv*T1 + Qp_reg;
      end if;

      // 根据活塞运动方向判断高温气缸内工质的热量改变情况
      if c<0 then
        der(Qc) = Qpc - mp1*cv*T_l - power_cal - Qpo - Qpr - Qfr;
      else
        der(Qc) = Qpc - mp1*cv*T1;
      end if;

      // 根据活塞运动方向判断高温气缸内工质的热量改变情况
      if c<0 then
        der(Qf) = Qpf + mp2*cv*T2;
      else
        der(Qf) = Qpf + mp2*cv*T_l;
      end if;

      // 能量守恒，计算功率
      power = Qpc + Qpf - Qpo - Qpr - Qfr;

      // 压缩活塞的驱动力
      f = (P2-P_ini)*A2;
      // 膨胀活塞的驱动力
      f1 = (P1-P_ini)*A1*16/25;
    end Gas_Dynamic_711;

    model Test_711
      Modelica.Blocks.Sources.Ramp ramp(height=600,
        duration=3,                                 offset=273.15) 
                      annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-50,-26})));
      Modelica.Blocks.Sources.Constant const(k=273.15) 
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={52,-32})));
      Modelica.Blocks.Sources.Constant const1(k=251.2) 
                                                   annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-42,42})));
      //Vm1 = 0.00583,
      //Vm2 = 0.00816,
      Gas_Dynamic_711 gas_Dynamic_711_1(
      d1 = 0.15,
      l_d = 0.1,
      d2 = 0.15,
      dc = 0.18,
      P1(fixed = true),
      n1(fixed = true),
      n2(fixed = true),
      nt(fixed = true),
      Vm1 = 0.004615,
      Vm2 = 0.002938,
      Uc = 1500,
      Uf = 1000) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-2,0})));
    equation
      connect(ramp.y, gas_Dynamic_711_1.u2) 
        annotation (Line(points={{-50,-15},{-50,-6},{-16,-6}}, color={0,0,127}));
      connect(const.y, gas_Dynamic_711_1.u3) 
        annotation (Line(points={{52,-21},{52,-6},{12,-6}}, color={0,0,127}));
      connect(const1.y, gas_Dynamic_711_1.u) 
        annotation (Line(points={{-42,31},{-42,6},{-16.2,6}}, color={0,0,127}));
      connect(const1.y, gas_Dynamic_711_1.u1) annotation (Line(points={{-42,31},{-42,
              6},{-22,6},{-22,16},{20,16},{20,6},{12,6}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Test_711;
  end Stirling_711;

  package V4_Stirling
    model V4
      Mechanical_Gas.Stirling stirling(
        cylinderInclinationAngle=0,
        crankAngleOffset=-1.5707963267949,
        cylinderInclinationAngle1=1.5707963267949,
        crankAngleOffset1=-1.5707963267949) 
        annotation (Placement(transformation(extent={{-76,34},{-38,54}})));
      inner Modelica.Mechanics.MultiBody.World world 
        annotation (Placement(transformation(extent={{-162,36},{-142,56}})));
      Mechanical_Gas.Stirling stirling1(
        cylinderInclinationAngle=1.5707963267949,
        crankAngleOffset=-1.5707963267949,
        cylinderInclinationAngle1=3.1415926535898,
        crankAngleOffset1=-1.5707963267949) 
        annotation (Placement(transformation(extent={{-26,34},{12,54}})));
      Mechanical_Gas.Stirling stirling2(
        cylinderInclinationAngle=3.1415926535898,
        crankAngleOffset=-1.5707963267949,
        cylinderInclinationAngle1=4.7123889803847,
        crankAngleOffset1=-1.5707963267949) 
        annotation (Placement(transformation(extent={{24,34},{62,54}})));
      Mechanical_Gas.Stirling stirling3(
        cylinderInclinationAngle=4.7123889803847,
        crankAngleOffset=-1.5707963267949,
        cylinderInclinationAngle1=6.2831853071796,
        crankAngleOffset1=-1.5707963267949) 
        annotation (Placement(transformation(extent={{76,34},{114,54}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2) 
        annotation (Placement(transformation(extent={{-188,-102},{-168,-82}})));
      Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true,
          n(displayUnit="1") = {1,0,0}) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-120,-48})));
    equation
      connect(world.frame_b, revolute.frame_b) annotation (Line(
          points={{-142,46},{-136,46},{-136,-48},{-130,-48}},
          color={95,95,95},
          thickness=0.5));
      connect(world.frame_b, stirling.cylinder_a) annotation (Line(
          points={{-142,46},{-82,46},{-82,60},{-65.9154,60},{-65.9154,48.3846}},
          color={95,95,95},
          thickness=0.5));

      connect(inertia.flange_b, revolute.axis) annotation (Line(points={{-168,
              -92},{-120,-92},{-120,-58}}, color={0,0,0}));
      connect(stirling.cylinder_b1, stirling1.cylinder_a) annotation (Line(
          points={{-48.0115,48.4615},{-48.0115,60},{-15.9154,60},{-15.9154,
              48.3846}},
          color={95,95,95},
          thickness=0.5));
      connect(stirling.crank_b1, stirling1.crank_a) annotation (Line(
          points={{-48.0846,40.6923},{-48.0846,28},{-15.9154,28},{-15.9154,
              40.6923}},
          color={95,95,95},
          thickness=0.5));
      connect(stirling1.cylinder_b1, stirling2.cylinder_a) annotation (Line(
          points={{1.98846,48.4615},{0,48.4615},{0,60},{34.0846,60},{34.0846,
              48.3846}},
          color={95,95,95},
          thickness=0.5));
      connect(stirling1.crank_b1, stirling2.crank_a) annotation (Line(
          points={{1.91538,40.6923},{0,40.6923},{0,28},{34.0846,28},{34.0846,
              40.6923}},
          color={95,95,95},
          thickness=0.5));
      connect(stirling2.cylinder_b1, stirling3.cylinder_a) annotation (Line(
          points={{51.9885,48.4615},{50,48.4615},{50,60},{86.0846,60},{86.0846,
              48.3846}},
          color={95,95,95},
          thickness=0.5));
      connect(stirling2.crank_b1, stirling3.crank_a) annotation (Line(
          points={{51.9154,40.6923},{50,40.6923},{50,28},{86.0846,28},{86.0846,
              40.6923}},
          color={95,95,95},
          thickness=0.5));
      connect(revolute.frame_a, stirling.crank_a) annotation (Line(
          points={{-110,-48},{-65.9154,-48},{-65.9154,40.6923}},
          color={95,95,95},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -240,-140},{220,140}})), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-240,-140},{220,140}})));
    end V4;
  end V4_Stirling;
  annotation (uses(Modelica(version="4.0.0")));
end Stirling_Cycle;