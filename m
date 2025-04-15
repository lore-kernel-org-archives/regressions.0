Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850061F542E
	for <regressions@lists.linux.dev>; Tue, 15 Apr 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742416; cv=none; b=QH68BmGXCJezvCdCt2TDLIsFea56izKHB3g07VURwx1hT85Wj4ROiKJoS/feav3bBRI2LDcpfaLK1MaIZmfyCejsevkJHHbVmLWm23ThHeHVbsfbT5PBPK6PLbYjh8fcMk6vGypAUYQ1PNrVF+YllsNx1/CuMsAaeWKcPPUw1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742416; c=relaxed/simple;
	bh=uJJWlYxC2n/XPAh2wuaGtIwzaSCPDPze4SI0d2I+hlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2ZWD6lp+LxLsLVHnCO83SdeXd6buLTsddOhAG97kUZuUNKUv958eMBXWpvZk8On98xxdbA6fsmEzFOUX8e6ulMZ6K/9lEEQjRKQ7Ht/5TZbgfusJK7+OQrcLL0XQp0Q+Dpld1bqMroze/V3Va+ylYn3q/iO47+Ht23k6QVY51M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqCQzS8F; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqCQzS8F"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ae727e87c26so4055664a12.0
        for <regressions@lists.linux.dev>; Tue, 15 Apr 2025 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742415; x=1745347215; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r7LdJfX/NiQcyQWhxd6h6QFvrDjuTzax4bkOLSIcqCY=;
        b=lqCQzS8FxoYIlxGy1c+bKTjVTon0WWP2BtYlpbsd1SzPLayT9iGnEAP+jk5qNMlzoQ
         8VkPFsMgqjhtaqddc6DCGBbbF2bW36oSueaig1VPixuWzNFY/5G2uHbLXcAn5EcQuTRt
         5wxQmD534xH8oFzMjRt8FkvC/F33fEJyPnloqbA21YsQJxaWicVeyF5aKtA+4pMz+yf9
         4i2JSJi90EbJvI3TMBat/jJUHAyefUnAIvSWEfJZGyFMIdyZCRUjn/GkNOhzGfPw4ZW0
         uXwDX3v8T+eIRfrKgp8JujXf/6G9eCl29w7BLsfGnooQ8K1Nmhr7w08I/SGCqBHRr/ry
         skPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742415; x=1745347215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7LdJfX/NiQcyQWhxd6h6QFvrDjuTzax4bkOLSIcqCY=;
        b=mesxZA37SXAdYfBaMnW4tvZH6MvusNJJAddTOQx85SSqxvziHUvA6iJZ4D6/8ljTUM
         hPyEzuu9NMxFB6vS1L3o+hTr82FHyaA8A2HEKyTbVC5cPDvXD5c6dnnmNfANUgHhlvAy
         f9T3vHBH7zufCn18oZn9cAZjTyWGFgS73QlroTBxalnLTb67ikwuibj+eU1BIsAV26Hs
         9ZS3+BkE6tlf+M00SAl2IV22wod2WVN8QbtP8G4gPjqYeDgKmkka6jkLCAvEaiNbs/uj
         vBQArEfcDAlH6Xj0KEQpzmwxJahfmwMePonNByavtanh3AKf1sKTk75A3YaaBg0F5TCw
         fkbw==
X-Forwarded-Encrypted: i=1; AJvYcCXO7xS/GQFYWZ51tZSE2vNeVfpJVhYj7VKWIqgMRv7HgWePmOfuL4XrYsoknjC56xIf/sk1FVW+mPByxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyB545ofs8Nvy3Mq1f5BLEGqImOpfE3rFbLe8ce5SSEX06WQF2J
	KEPh5APWOpHrvPSqZRYTmMPBLfysznOxGyJf5rpsbHN4Jtu03I00
X-Gm-Gg: ASbGncsYHxMd+bLwCi4AwwVF9JQYd8KI1xOx1iwpZ5LfkDxOnIPFBVdQ/i6E+gsfNkq
	sZpaWa7tqFq2q613n2ZeS3bsPI3ky2xHTx6h/ZSyPNYCPzUY4zoBOdeHhaIPtlPAZ62CItdJvKU
	VbSf/URMvz/O02JB+phDtKouyKdt/LfDv0xSqGg9exbo7fs4h0B4YEUeBPocLrE6oalDFewOAdf
	MerPEQMWTKFiJLv1mrRJ5hmFbK0QlGd+CZ9wiz5INRxTzog92Ugz7ivqx+f/qSFnrCJq33V+5ag
	4eRWUTjP+Zchvuf8peFyhc9/QA5SRE5DwJDpu28=
X-Google-Smtp-Source: AGHT+IH0/rViGbAh62y8CYGqkS4uAeLP96QgGfU8Xo0+eLty4NFaaNFFothcrivWo5vjv19P3qVGDw==
X-Received: by 2002:a05:6a20:2d13:b0:1fe:9537:84a0 with SMTP id adf61e73a8af0-203adfc5f55mr67704637.15.1744742414609;
        Tue, 15 Apr 2025 11:40:14 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a321f921sm11325860a12.72.2025.04.15.11.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:40:14 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:40:09 -0300
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
Message-ID: <20250415184009.2fvtn7tbe6uzwiyg@hiago-nb>
References: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
 <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
 <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250411162328.y2kchvdb4v4xi2lj@hiago-nb>
 <PAXPR04MB8459ED33238AA790252E730988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414224452.gk4ccniqtumfbjth@hiago-nb>
 <PAXPR04MB84591C4D560C0D3D64F927FC88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84591C4D560C0D3D64F927FC88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Tue, Apr 15, 2025 at 12:11:33AM +0000, Peng Fan wrote:
> > Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X
> > when Cortex-M4 is running and it was started by U-Boot bootaux
> > 
> > Hi Peng,
> > 
> > On Mon, Apr 14, 2025 at 06:09:49AM +0000, Peng Fan wrote:
> > >
> > > In your case, m4 is in same scu partition as a53, so m4 power domain
> > > is manageable(owned) by Linux.
> > >
> > > However to m4 earlyboot(kicked by bootloader), if you not wanna
> > linux
> > > to handle m4, use scu_rm to create a separate partition in u-boot.
> > > If you wanna linux to handle m4, but not wanna linux to shutdown
> > the
> > > pd in kernel boot, imx_rproc.c needs to be built in, and need to add a
> > > clock entry or use clock optional api in imx_rproc.c .
> > >
> > > Current imx_rproc.c needs a clock entry to probe pass.
> > >
> > > I think in your case, this driver not probe pass, so the
> > > M4 pd still get powered off.
> > 
> > This was correct, indeed. I was not able to find exactly where the
> > cortex-m4 clock is defined, so I added a clk_dummy to the imx8x-cm4
> > remoteproc node and now it works, the code continues to run and I
> > can control the m4 with Linux. Thanks!
> > 
> > One thing that I noticed is I cannot make the RPMsg work with this
> > devicetree node, even tought I assigned the correct memory-regions
> > (vdev0buffer, vdev0ring0...). Also tested with the rpmsg-lite from the
> > linux-imx. Is this supposed to work with RPMsg as well?
> 
> To make rpmsg work, you need a m4 demo that could publish
> resource table, such as i.MX tty echo or pingpong demo.
> 
> There is downstream rpmsg driver under drivers/rpmsg/imx_*.c
> that could be used to talk with m4.
> 
> helloworld demo does not have any virtio devices, so no rpmsg.

Got it, I was able to make it work with the downstream pingpong driver
and the MCUXpresso demo. I can launch the firmware using the remoteproc
and exchange data between the two cores.

There is something I noticed, when I start the pingpong demo with
U-Boot, it does not work. I run the pingpong modprobe on Linux but the
name service is never annouced. It only works if I start with the
remoteproc on Linux, not U-Boot. Is this because of Linux not being able
to control the M4?

If I start the binary using U-Boot, the "state" always report as
"offline" by the remoteproc driver.

> 
> Regards,
> Peng.
> 
> > 
> > >
> > >
> > > Regards,
> > > Peng.
> > >
> > 
> > Hiago

Thanks,
Hiago.
