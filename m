Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9713B213E65
	for <regressions@lists.linux.dev>; Fri, 11 Apr 2025 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388616; cv=none; b=EcVGnh80FaguA6u0GJ1CdS/jxBrbgbdFnDsBts4BYvN2GEkfd6fFnPRD8C5Rbanlf9tsahwyytgUb0OMzfTOlVnnwRs9OGqSR3Z6ERTlhBJcTJaMiyRvKmAjAIRiFpErZJBKQcxvUEHP5E8QPKBXJuG2V9DnkZzzzTqjY5g9ORU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388616; c=relaxed/simple;
	bh=vCMcEgHUigUOX4/6itupqbvmSxHNfPGr6uYveuFsH9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aS1TUXNlDgWwpCDB1d5erliXGkbaLBWL7L1HGlvw0PVzYgTMAgvogDPqe3Cy7cDnz77jJ8/ftF2/dGGXb7BqB9uV8dfjubHt7gcPo3PUOnKn1qc62hyYMemcEazXQtiETcm8FGdx4d5qSznSuwofq2X440s1ew2NIlYFzHBJTWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7GdMZ1/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7GdMZ1/"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225477548e1so22985865ad.0
        for <regressions@lists.linux.dev>; Fri, 11 Apr 2025 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744388614; x=1744993414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T5FckoYafwVaXPWK2PUB+GpDyPBlHFtc4ZPOsKk2Ipg=;
        b=j7GdMZ1/SnSqujdjvV3oBJaGgFEQrYwF3RrYkvFlKz1Db1M8J0rvZIR6B/tLas4vwB
         K6ejHmhraRR/BeX/9lKvCBJ2X9XmrgJjMzMGHjA6XQ2+msqcF27MY4Ht9Wi94SL/UoZy
         edZo62zh7GWYp2DEbbaDgomsEZo0n0F6w0tKnSdsnhIUtQGqa/JmiC2BH6aQ40ILRZ8J
         DnIz8dvVHJ+rQfTcBQ8MAO6qX7tZCbYpkreAxeJ9SOlX44ZeOxspkZFbR2OxML2CCBI2
         FP99EhKOprv4p51QXZa7zI0tW6g6WQ7vy5+f9+MUD8VgI5FAGSyHVPyvXrxFZHnr0kuu
         3xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388614; x=1744993414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5FckoYafwVaXPWK2PUB+GpDyPBlHFtc4ZPOsKk2Ipg=;
        b=FYK4FYGcgLxeTlIS8MUW88SIYoJYBpsfYnp0sMGU2BhVbRWgjBGp8UrTVhb5ck9evY
         T9VN6M4w0JtPcY9GeCW7WyZkt5LrFl+hAwMwpbwvVr9PROTf4yFqjiAByyMiHB4OJXoU
         bg3kM46JdBb8Mci/CnIoNlGPp/0hFaD7DJ3OP5Vfoy6C5hxSbMX64gyLFMJ/27WTu7FQ
         CkJXP8anb7XbUli6ajX7Z9AHTNthgDftb0V2DAkqqVxvk2aOm627s+nfb2zbQUZYaIbv
         dcw7absvL1vACElZ9LV+N85+J3vPZ182wZ73GKu5fjq+hrY9NQS0k3qDOlxVWeO1gvF2
         yi+A==
X-Forwarded-Encrypted: i=1; AJvYcCXCUrq2lzrbZxRqHcJtI2I87y6iUAaRzuA1vSb2oLvmXFLt6rI2np+tId4Xy33rW+5VQgggLmz7kHlPMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzirDY3NBu1uAdtul4QvVnOq9HvqOHwwnTnd2+rTEo5pP09wNt2
	tEJ7GgWE7To3Sk78K4zC/UoVsfMm6iNeGlRCxq2xr4WWaG1ErjX5
X-Gm-Gg: ASbGnct/6MIL8OlkPvC9oxDZLmcXaH2gpklaw1kasOygNxPQOmKzldDdAzX8r6TEim8
	rs6YFz1IKV4Q2HgWhmRiK9x2k6pTNpqeANNi8016UPOZWvmKpD15RfHhzdT9//K2aDURTzAOGco
	xZGRKWO7O96GZEOdN//DerT5mtNB0hW4lMBpQTbTL0fnEI2vJUHmunsInfZSliruVDIYGW0+fKv
	+7l73Cuate61s79u9oE6jcCGX65uemoGkPG1ifybPeohz4H/gU6feyMkm6Mqf4+aJXEkSqkLaTK
	Oa2kadohFY93Bj56pT2k2w95fAzUq50FyYRLRHfNK1z6vitOwQ==
X-Google-Smtp-Source: AGHT+IFCfUV6384bNBCr+vSp/DTf6SVjkwz2rSVIWqsuCTiK8sT2R3/nhh6FK0ZbTjida+uNgTjQKg==
X-Received: by 2002:a17:90b:2647:b0:2ff:5ec1:6c6a with SMTP id 98e67ed59e1d1-30823646ae2mr5751053a91.18.1744388613682;
        Fri, 11 Apr 2025 09:23:33 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:a964:9277:4e8:b712:66e2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df06a14bsm5814830a91.1.2025.04.11.09.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:23:33 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:23:28 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X when
 Cortex-M4 is running and it was started by U-Boot bootaux
Message-ID: <20250411162328.y2kchvdb4v4xi2lj@hiago-nb>
References: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
 <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
 <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>

Hi Peng,

On Fri, Apr 11, 2025 at 01:23:32PM +0000, Peng Fan wrote:
> Hi,
> 
> Sorry for late.
> > Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X
> > when Cortex-M4 is running and it was started by U-Boot bootaux
> > 
> > On Fri, Apr 04, 2025 at 11:17:13AM -0300, Hiago De Franco wrote:
> > > #regzbot introduced: 4f6c983261
> > >
> > > Hi Peng and all,
> > >
> > > Commit 4f6c9832613b ("genpd: imx: scu-pd: initialize is_off
> > according
> > > to HW state") introduced a regression where the Kernel reboots
> > > unexpectedly (without any warnings, crashes or errors) when the
> > > Cortex-M4 was loaded and running by U-Boot, using the bootaux
> > command:
> > >
> > > # load mmc 0:2 ${loadaddr} /home/root/hello_world.bin # bootaux
> > > ${loadaddr} 0 # boot
> > >
> > > This is a simple hello world binary that prints a message into the
> > > M40.UART0 pin (demo from NXP MCUXpresso).
> 
> Which release is this image from?

This is MCUXpresso SDK 2.9.0.

> 
> > >
> > > Before this commit, everything worked as expected, Linux boots fine
> > > and the HMP core keeps running and printing messages to the UART.
> > > After the commit, the kernel reboots at the beggining of the boot
> > > process. The only relevant message is printed by U-Boot after reset:
> > >
> > > "Reset cause: SCFW fault reset"
> > >
> > > This commit was bisectabled, the same device tree, u-boot version,
> > and
> > > SCFW versions were used. Reverting this commit fixes the issues.
> > >
> > > For testing purposes, I created the following patch which also fixes
> > > the
> > > issue:
> > >
> > > diff --git a/drivers/pmdomain/imx/scu-pd.c
> > > b/drivers/pmdomain/imx/scu-pd.c index
> > 38f3cdd21042..0477b3fb4991
> > > 100644
> > > --- a/drivers/pmdomain/imx/scu-pd.c
> > > +++ b/drivers/pmdomain/imx/scu-pd.c
> > > @@ -539,6 +539,9 @@ imx_scu_add_pm_domain(struct device
> > *dev, int idx,
> > >                 return NULL;
> > >         }
> > >
> > > +       if (strstr("cm40", sc_pd->name) != NULL)
> > > +               is_off = true;
> > > +
> > >         ret = pm_genpd_init(&sc_pd->pd, NULL, is_off);
> > >         if (ret) {
> > >                 dev_warn(dev, "failed to init pd %s rsrc id %d",
> > >
> > >
> > > Test Environment:
> > > - Hardware: Colibri iMX8DX 1GB with Colbiri Evaluation Board.
> > > - U-Boot Version: 2024.04
> > > - U-Boot Build info:
> > > 	SCFW 83624b99, SECO-FW c9de51c0, IMX-MKIMAGE
> > 4622115c, ATF 7c64d4e
> > >
> > > The issue is not present on: v6.5
> > >
> > > The real root cause is still unclear to me. Anybody has any ideas? I
> > > am happy to share more details if needed.
> 
> Have you tried pd_ignore_unused? 
> 
> I think it is linux power down M4 which M4 is running, then SCFW
> reports error. So please give a try pd_ignore_unused.

For debugging purposes, I tried it and it works, kernel boots fine with
M4 running and pd_ignore_unused parameter.

> 
> If this is the case, may I know do you have m4 nodes in dts and
> with power domain included?

This is the device tree overlay I am testing:

/dts-v1/;
/plugin/;

#include <dt-bindings/clock/imx8mm-clock.h>
#include <dt-bindings/firmware/imx/rsrc.h>

/ {
	compatible = "toradex,colibri-imx8x";
};

&{/} {
	imx8x-cm4 {
		compatible = "fsl,imx8qxp-cm4";
		mbox-names = "tx", "rx", "rxdb";
		mboxes = <&lsio_mu5 0 1
			  &lsio_mu5 1 1
			  &lsio_mu5 3 1>;
		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
				<&pd IMX_SC_R_M4_0_MU_1A>;
		fsl,entry-address = <0x34fe0000>;
		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
	};

	reserved-memory {
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;

		vdev0vring0: memory@90000000 {
			reg = <0 0x90000000 0 0x8000>;
			no-map;
		};

		vdev0vring1: memory@90008000 {
			reg = <0 0x90008000 0 0x8000>;
			no-map;
		};

		vdev1vring0: memory@90010000 {
			reg = <0 0x90010000 0 0x8000>;
			no-map;
		};

		vdev1vring1: memory@90018000 {
			reg = <0 0x90018000 0 0x8000>;
			no-map;
		};

		rsc_table: memory@900ff000 {
			reg = <0 0x900ff000 0 0x1000>;
			no-map;
		};

		vdevbuffer: memory@90400000 {
			compatible = "shared-dma-pool";
			reg = <0 0x90400000 0 0x100000>;
			no-map;
		};
	};
};

&lsio_mu5 {
	status = "okay";
};

This was basically copied from
arch/arm64/boot/dts/freescale/imx8qxp-mek.dts. Do you see anything
wrong? Should I also add the "clocks" property to imx8x-cm4 node?

> 
> Anyway, I will give a try on i.MX8QM EVK.

Great, thanks.

> 
> > 
> > Hello everyone, as this introduced a regression, should I send a revert
> > for 4f6c983261? 
> 
> Please wait a while, I think we need find root cause.
> 
> Thanks,
> Peng.
> 
> Or any ideas that might help fix this issue?
> > 
> > >
> > > Cheers,
> > > Hiago.
> > 
> > Cheers,
> > Hiago.

Cheers,
Hiago.
