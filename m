Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F51F3FEC
	for <regressions@lists.linux.dev>; Mon, 14 Apr 2025 22:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744670700; cv=none; b=PMEgrA7NwbJYvKGF9Nwa96FHGdmZWCbc61Nm0e9FUUOTL/MZq/7pP0KxzgtOvQiOBjhK7E4fO6ZUbW23bv46OC/N7jQmhoVH/HuTAT+eeCQdoSVBwFzhm785S7ydzpp2ZR3t29xqvRu1EkCnG10puyZ6wzQ2Q1c1NAgbnGqwDDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744670700; c=relaxed/simple;
	bh=1DPzF0IfyF98MjDzAq64CNgLAK8YEM3pXDiD8yr5QrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnDvGylFKFnPRfSWtKqWEG1oM9dmjZyXCFupKTdTaBOuXO9Q+B76PlvJrzDN+wC2oKB8HvheJapUjI422gtMSFPKoWdE61REqV2v7KcUbZ4UFU7J1Ur/JImF5953Y20rot86x7i6EoSxPFXJR8PqsPn7tjNLmbOFnm1HjWPfz3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y39mhXln; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y39mhXln"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224100e9a5cso54543495ad.2
        for <regressions@lists.linux.dev>; Mon, 14 Apr 2025 15:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744670698; x=1745275498; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCbufsqovhRdxKI/Wo+sxDQep3MCh6y6M1Tif6pvFv0=;
        b=Y39mhXln0QiNhbx6Vrtm1rDUkOrY1TziWQjvjIj1JBNkAD41TbcyBy2B2p+CP2svQ9
         1ubA4Wvi5Dex4TGmoJByzCv1vNiyzw3/EQw/XEKlOL0inYv0H8/KOlYRfsh9Dw9+x3dd
         QWKJGWXqi5yzeDtcpMq01FelYhooTB2d92PlT54H+YPf/RhTEKJH9t1esOR7sKCZpOe5
         zLluz6zP945zqqoQ6D0TOte5ZUC99S+hEi+b+UPkxz3NZoiD6H8VQv4gF/nWDXaB9c9G
         K1E/i2Rs+CKVkonIOH5REfMNPTooZmzlQBDWC5VtQ4cSwWlPp5dDJ2tHABMkxptPyC5/
         u8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744670698; x=1745275498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCbufsqovhRdxKI/Wo+sxDQep3MCh6y6M1Tif6pvFv0=;
        b=EzaB/PtFEg3BtYsE985CHUstVPEHF5SuOC6TDQMHxiSDTmt6CITH1bycHCxF99nhD/
         X3PDtjWGoZ2oiaJ9rUpN95/TDh2cLA7DsTOa0wQC/U0C942XFaKFadLBt1upu0WKUDbf
         NmIt3TVo9Lfu/ZpPuq086sxqOZwU/Iwmn76eOi+KypMIxz5M7vkAW+XQDvuWxZpiKizS
         BH/TkJSXaJCGStk/aXe9ypjQhcgv06jCdJXdqFvJO3WbrTe6ut40uejAT+PCm2ZpMmxk
         XJh6JjyCuCOG2Zu8i7AUGIypquP6rZO/PZSSMDCt65Kia8NI7t/EAI/pRWl1sz9W9GGG
         mPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfAe2jnmjkWQ5HawfKPJQBh3TkIbR+7xw+YWCJSyyelQTbE4xzFm42p6DE2Msj/2YOPGw5LmmWPVMkeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7xdRYDN/zTP8B+pEEcORTFDCm2tulMHEtdP0KaPGyd9pmCNil
	qiE+BdkWdo/Ns1jDtdoeP9X3JRIugwXnr2iV62udKTFZmqCKx6zS
X-Gm-Gg: ASbGncuNlDy8XfnY3o9Tw1igcGFK7hbW6CYFhFPjEtSrtehmSsiqnSJYL+MPMRui5zw
	USEaCzn5VYtHr5+u+3J4yOoE486qTNuhN8dfa2t/IhRv7wUl7aWX4t8U6n+Pf4/ZYqf1CAMuYVC
	vZXhPXjgIbm7YmVMsyD7A57G/MQke0VxoMYdLrSY4f9l0djvR1ch+L/m+o2OIxmlAKZWle5kKsB
	Z2rHx/J+tRV2bFyB0E/XvCOphM3I0Kf3tV3vCPy83IiZ55UWuK6g+kLrzttfDPl+1p/ZzGBWxk1
	7AcFBaEJNkwR4RPNo6MnHI1u2GMRq/LbgI/2f9KcCxNdLgJ+9l8=
X-Google-Smtp-Source: AGHT+IGWOQk/MY4RrJwds2DUYwvDvZppCoo869G7JJk+fcUnDOZsIWUfuBx0HTAue14NQURwioU/rA==
X-Received: by 2002:a17:902:ebc2:b0:220:e63c:5b13 with SMTP id d9443c01a7336-22bea4fd043mr193492195ad.46.1744670698007;
        Mon, 14 Apr 2025 15:44:58 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:a964:131b:ff00:5ee5:94c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c62c3sm7400010b3a.52.2025.04.14.15.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 15:44:57 -0700 (PDT)
Date: Mon, 14 Apr 2025 19:44:52 -0300
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
Message-ID: <20250414224452.gk4ccniqtumfbjth@hiago-nb>
References: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
 <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
 <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250411162328.y2kchvdb4v4xi2lj@hiago-nb>
 <PAXPR04MB8459ED33238AA790252E730988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459ED33238AA790252E730988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>

Hi Peng,

On Mon, Apr 14, 2025 at 06:09:49AM +0000, Peng Fan wrote:
> 
> In your case, m4 is in same scu partition as a53, so m4
> power domain is manageable(owned) by Linux.
> 
> However to m4 earlyboot(kicked by bootloader),
> if you not wanna linux to handle m4, use scu_rm
> to create a separate partition in u-boot.
> If you wanna linux to handle m4, but not wanna linux
> to shutdown the pd in kernel boot, imx_rproc.c
> needs to be built in, and need to add a clock entry
> or use clock optional api in imx_rproc.c .
> 
> Current imx_rproc.c needs a clock entry to probe pass.
> 
> I think in your case, this driver not probe pass, so the
> M4 pd still get powered off.

This was correct, indeed. I was not able to find exactly where the
cortex-m4 clock is defined, so I added a clk_dummy to the imx8x-cm4
remoteproc node and now it works, the code continues to run and I can
control the m4 with Linux. Thanks!

One thing that I noticed is I cannot make the RPMsg work with this
devicetree node, even tought I assigned the correct memory-regions
(vdev0buffer, vdev0ring0...). Also tested with the rpmsg-lite from the
linux-imx. Is this supposed to work with RPMsg as well?

> 
> 
> Regards,
> Peng.
>

Hiago
