
`timescale 1 ns / 1 ps

	module Pmod_DHB1 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXI_GPIO
		parameter integer C_S_AXI_GPIO_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_GPIO_ADDR_WIDTH	= 4,

		// Parameters of Axi Slave Bus Interface S_AXI_PWM
		parameter integer C_S_AXI_PWM_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_PWM_ADDR_WIDTH	= 7,

		// Parameters of Axi Slave Bus Interface S_AXI_MOTOR_FB
		parameter integer C_S_AXI_MOTOR_FB_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_MOTOR_FB_ADDR_WIDTH	= 5
	)
	(
		// Users to add ports here
    // GPIO Ports:
    input  wire [3:0] gpio_tri_i,
    output wire [3:0] gpio_tri_o,
    output wire [3:0] gpio_tri_t,
    // GPIO2 Ports:
    input  wire [3:0] gpio2_tri_i,
    output wire [3:0] gpio2_tri_o,
    output wire [3:0] gpio2_tri_t,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXI_GPIO
		input wire  s_axi_gpio_aclk,
		input wire  s_axi_gpio_aresetn,
		input wire [C_S_AXI_GPIO_ADDR_WIDTH-1 : 0] s_axi_gpio_awaddr,
		input wire [2 : 0] s_axi_gpio_awprot,
		input wire  s_axi_gpio_awvalid,
		output wire  s_axi_gpio_awready,
		input wire [C_S_AXI_GPIO_DATA_WIDTH-1 : 0] s_axi_gpio_wdata,
		input wire [(C_S_AXI_GPIO_DATA_WIDTH/8)-1 : 0] s_axi_gpio_wstrb,
		input wire  s_axi_gpio_wvalid,
		output wire  s_axi_gpio_wready,
		output wire [1 : 0] s_axi_gpio_bresp,
		output wire  s_axi_gpio_bvalid,
		input wire  s_axi_gpio_bready,
		input wire [C_S_AXI_GPIO_ADDR_WIDTH-1 : 0] s_axi_gpio_araddr,
		input wire [2 : 0] s_axi_gpio_arprot,
		input wire  s_axi_gpio_arvalid,
		output wire  s_axi_gpio_arready,
		output wire [C_S_AXI_GPIO_DATA_WIDTH-1 : 0] s_axi_gpio_rdata,
		output wire [1 : 0] s_axi_gpio_rresp,
		output wire  s_axi_gpio_rvalid,
		input wire  s_axi_gpio_rready,

		// Ports of Axi Slave Bus Interface S_AXI_PWM
		input wire  s_axi_pwm_aclk,
		input wire  s_axi_pwm_aresetn,
		input wire [C_S_AXI_PWM_ADDR_WIDTH-1 : 0] s_axi_pwm_awaddr,
		input wire [2 : 0] s_axi_pwm_awprot,
		input wire  s_axi_pwm_awvalid,
		output wire  s_axi_pwm_awready,
		input wire [C_S_AXI_PWM_DATA_WIDTH-1 : 0] s_axi_pwm_wdata,
		input wire [(C_S_AXI_PWM_DATA_WIDTH/8)-1 : 0] s_axi_pwm_wstrb,
		input wire  s_axi_pwm_wvalid,
		output wire  s_axi_pwm_wready,
		output wire [1 : 0] s_axi_pwm_bresp,
		output wire  s_axi_pwm_bvalid,
		input wire  s_axi_pwm_bready,
		input wire [C_S_AXI_PWM_ADDR_WIDTH-1 : 0] s_axi_pwm_araddr,
		input wire [2 : 0] s_axi_pwm_arprot,
		input wire  s_axi_pwm_arvalid,
		output wire  s_axi_pwm_arready,
		output wire [C_S_AXI_PWM_DATA_WIDTH-1 : 0] s_axi_pwm_rdata,
		output wire [1 : 0] s_axi_pwm_rresp,
		output wire  s_axi_pwm_rvalid,
		input wire  s_axi_pwm_rready,

		// Ports of Axi Slave Bus Interface S_AXI_MOTOR_FB
		input wire  s_axi_motor_fb_aclk,
		input wire  s_axi_motor_fb_aresetn,
		input wire [C_S_AXI_MOTOR_FB_ADDR_WIDTH-1 : 0] s_axi_motor_fb_awaddr,
		input wire [2 : 0] s_axi_motor_fb_awprot,
		input wire  s_axi_motor_fb_awvalid,
		output wire  s_axi_motor_fb_awready,
		input wire [C_S_AXI_MOTOR_FB_DATA_WIDTH-1 : 0] s_axi_motor_fb_wdata,
		input wire [(C_S_AXI_MOTOR_FB_DATA_WIDTH/8)-1 : 0] s_axi_motor_fb_wstrb,
		input wire  s_axi_motor_fb_wvalid,
		output wire  s_axi_motor_fb_wready,
		output wire [1 : 0] s_axi_motor_fb_bresp,
		output wire  s_axi_motor_fb_bvalid,
		input wire  s_axi_motor_fb_bready,
		input wire [C_S_AXI_MOTOR_FB_ADDR_WIDTH-1 : 0] s_axi_motor_fb_araddr,
		input wire [2 : 0] s_axi_motor_fb_arprot,
		input wire  s_axi_motor_fb_arvalid,
		output wire  s_axi_motor_fb_arready,
		output wire [C_S_AXI_MOTOR_FB_DATA_WIDTH-1 : 0] s_axi_motor_fb_rdata,
		output wire [1 : 0] s_axi_motor_fb_rresp,
		output wire  s_axi_motor_fb_rvalid,
		input wire  s_axi_motor_fb_rready
	);

  wire [3:0] ilslice_m1_direction, ilslice_m2_direction;
  wire [1:0] ilslice_pwm;
  wire       ilslice_m1_enable, ilslice_m2_enable;
  wire       ilslice_m1_feedback, ilslice_m2_feedback;

  // Instantiation of Axi Bus Interface S_AXI_GPIO: AXI GPIO 2.0
	axi_gpio_0 # ( 
    // GPIO Parameters:
    .C_ALL_INPUTS(0),
    .C_ALL_OUTPUTS(0),
    .C_GPIO_WIDTH(4),
    .C_DOUT_DEFAULT(32'h00000000),
    .C_TRI_DEFAULT(32'hFFFFFFFC),
    // GPIO2 Parameters:
    .C_IS_DUAL(1),
    .C_ALL_INPUTS_2(0),
    .C_ALL_OUTPUTS_2(0),
    .C_GPIO2_WIDTH(4),
    .C_DOUT_DEFAULT_2(32'h00000000),
    .C_TRI_DEFAULT_2(32'hFFFFFFFC),
    // Interrupts:
    .C_INTERRUPT_PRESENT(0)
	) Pmod_DHB1_S_AXI_GPIO_inst (
		.s_axi_aclk(s_axi_gpio_aclk),
		.s_axi_aresetn(s_axi_gpio_aresetn),
		.s_axi_awaddr(s_axi_gpio_awaddr),
		.s_axi_awvalid(s_axi_gpio_awvalid),
		.s_axi_awready(s_axi_gpio_awready),
		.s_axi_wdata(s_axi_gpio_wdata),
		.s_axi_wstrb(s_axi_gpio_wstrb),
		.s_axi_wvalid(s_axi_gpio_wvalid),
		.s_axi_wready(s_axi_gpio_wready),
		.s_axi_bresp(s_axi_gpio_bresp),
		.s_axi_bvalid(s_axi_gpio_bvalid),
		.s_axi_bready(s_axi_gpio_bready),
		.s_axi_araddr(s_axi_gpio_araddr),
		.s_axi_arvalid(s_axi_gpio_arvalid),
		.s_axi_arready(s_axi_gpio_arready),
		.s_axi_rdata(s_axi_gpio_rdata),
		.s_axi_rresp(s_axi_gpio_rresp),
		.s_axi_rvalid(s_axi_gpio_rvalid),
		.s_axi_rready(s_axi_gpio_rready),
    // GPIO Ports:
    .gpio_io_i(gpio_tri_i),
    .gpio_io_o(ilslice_m1_direction),
    .gpio_io_t(gpio_tri_t),
    // GPIO2 Ports:
    .gpio2_io_i(gpio2_tri_i),
    .gpio2_io_o(ilslice_m2_direction),
    .gpio2_io_t(gpio2_tri_t)
	);

  // Instantiation of Axi Bus Interface S_AXI_PWM: PWM 2.0
	PWM_v2_0 # ( 
		.C_PWM_AXI_DATA_WIDTH(C_S_AXI_PWM_DATA_WIDTH),
		.C_PWM_AXI_ADDR_WIDTH(C_S_AXI_PWM_ADDR_WIDTH),
    .NUM_PWM(2),
    .POLARITY(1)
	) Pmod_DHB1_S_AXI_PWM_inst (
		.pwm_axi_aclk(s_axi_pwm_aclk),
		.pwm_axi_aresetn(s_axi_pwm_aresetn),
		.pwm_axi_awaddr(s_axi_pwm_awaddr),
		.pwm_axi_awprot(s_axi_pwm_awprot),
		.pwm_axi_awvalid(s_axi_pwm_awvalid),
		.pwm_axi_awready(s_axi_pwm_awready),
		.pwm_axi_wdata(s_axi_pwm_wdata),
		.pwm_axi_wstrb(s_axi_pwm_wstrb),
		.pwm_axi_wvalid(s_axi_pwm_wvalid),
		.pwm_axi_wready(s_axi_pwm_wready),
		.pwm_axi_bresp(s_axi_pwm_bresp),
		.pwm_axi_bvalid(s_axi_pwm_bvalid),
		.pwm_axi_bready(s_axi_pwm_bready),
		.pwm_axi_araddr(s_axi_pwm_araddr),
		.pwm_axi_arprot(s_axi_pwm_arprot),
		.pwm_axi_arvalid(s_axi_pwm_arvalid),
		.pwm_axi_arready(s_axi_pwm_arready),
		.pwm_axi_rdata(s_axi_pwm_rdata),
		.pwm_axi_rresp(s_axi_pwm_rresp),
		.pwm_axi_rvalid(s_axi_pwm_rvalid),
		.pwm_axi_rready(s_axi_pwm_rready),
    // PWM Ports:
    .pwm(ilslice_pwm)
	);

  // Instantiation of Axi Bus Interface S_AXI_MOTOR_FB: Motor Feedback 1.0
	MotorFeedback_v1_0 # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_MOTOR_FB_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_MOTOR_FB_ADDR_WIDTH)
	) Pmod_DHB1_S_AXI_MOTOR_FB_inst (
		.s_axi_aclk(s_axi_motor_fb_aclk),
		.s_axi_aresetn(s_axi_motor_fb_aresetn),
		.s_axi_awaddr(s_axi_motor_fb_awaddr),
		.s_axi_awprot(s_axi_motor_fb_awprot),
		.s_axi_awvalid(s_axi_motor_fb_awvalid),
		.s_axi_awready(s_axi_motor_fb_awready),
		.s_axi_wdata(s_axi_motor_fb_wdata),
		.s_axi_wstrb(s_axi_motor_fb_wstrb),
		.s_axi_wvalid(s_axi_motor_fb_wvalid),
		.s_axi_wready(s_axi_motor_fb_wready),
		.s_axi_bresp(s_axi_motor_fb_bresp),
		.s_axi_bvalid(s_axi_motor_fb_bvalid),
		.s_axi_bready(s_axi_motor_fb_bready),
		.s_axi_araddr(s_axi_motor_fb_araddr),
		.s_axi_arprot(s_axi_motor_fb_arprot),
		.s_axi_arvalid(s_axi_motor_fb_arvalid),
		.s_axi_arready(s_axi_motor_fb_arready),
		.s_axi_rdata(s_axi_motor_fb_rdata),
		.s_axi_rresp(s_axi_motor_fb_rresp),
		.s_axi_rvalid(s_axi_motor_fb_rvalid),
		.s_axi_rready(s_axi_motor_fb_rready),
    // Motor Feedback Ports:
    .m1_feedback(ilslice_m1_feedback),
    .m2_feedback(ilslice_m2_feedback)
	);

	// Add user logic here

  assign ilslice_m1_enable = ilslice_pwm[0];
  assign ilslice_m2_enable = ilslice_pwm[1];

  assign gpio_tri_o  = { 2'b0, ilslice_m1_direction[0], ilslice_m1_enable };
  assign gpio2_tri_o = { 2'b0, ilslice_m2_direction[0], ilslice_m2_enable };

  assign ilslice_m1_feedback = gpio_tri_i[3];
  assign ilslice_m2_feedback = gpio2_tri_i[3];

	// User logic ends

	endmodule
