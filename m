Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0F2367A4
	for <regressions@lists.linux.dev>; Fri, 11 Apr 2025 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375832; cv=none; b=c5lt+ALIarADXT5Z5VqXu+taHc0kh25peBFDbbbtKcOC2qrTn/iks/26HqAPy5DIriL8k+0txS+auClMn1P8fdgjSEwv3arpk+5g3f1HaQKrn/g3WxdmdzfEZTEz1pxmf1pMJ5wlGa7Fy8oQeZ8eghsv4Xpax8XoAyIbVFxa8Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375832; c=relaxed/simple;
	bh=krUFr3VNZumQLFuazMnfIo6rVrd52OPbijqeDOl/TLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqMawMugXsoaWjZRdK9DnlnTprGiCHRLlOs/TXEXwG/WlIv6R8ClD257MdPhRnWOeg/1U7dgRSaeAmpO1soyaeV7tUUCBDKwX7hlGX4YhyPgnq96WMfkgI2OAa+5UfmWXUdmLESEQoatNk35eVTTuXNOSlJ07Tc9KgS121p3lRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=limSZ3GK; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="limSZ3GK"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73712952e1cso1829140b3a.1
        for <regressions@lists.linux.dev>; Fri, 11 Apr 2025 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744375830; x=1744980630; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXx2FL46B7WkOgjg7fh0W46JD/pfi8vbcwWhjWRwOFo=;
        b=limSZ3GKNPOcONrIpdgdaIppmJaWNN/BYceDydma0GWZ7gTTH6e7XB4SmL5uH8Rg1d
         dKnDN6iqfHxK+5AWqFnviMXsd+ShQHsJfkrYeC19zChz4iRUFqzLj0x+D0hMhkmwVXZi
         pdbHD5vVhuT58qfTs1HOYZoBQqRy1Ojx6MwvAU6xMoagQd7+0+UjyHRdula7fvy39T4m
         EXlLXXz8RcLRfbFlV2LZRDYF+BfFhMNdO9mIB/Tl8t9czZxz9lAlf/fa4oFaCNvshGmW
         JfZzOlCTsTof9PGOyOF459NTO4/M0ut+p1CVO7hsJMHy0QLuSotMclSwKwcxgcaWCS+8
         2zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375830; x=1744980630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXx2FL46B7WkOgjg7fh0W46JD/pfi8vbcwWhjWRwOFo=;
        b=BnbKoGWJEvHXj7R3KPUd281y9iYV9mNP2erZYRSTbP0zU+gDwYH4BCdQBv2vImamKd
         zZG2MTQ4sJkjrB96UvMtkXxdO9VdFGruVFK231uNSB40ODjQmYblNZQ7kNv/Inl3wjz+
         13x512s9sbWgvzsRVzm1BddUSRjH6dq9vCEG0xeFfeuQhP2GTbhXFqbQ2kE5rtvB0LfX
         OhT2krOUzxIcwtFuxpXJfJQh6r49lMNd2+MxE/W+m2WWFeQojRh2gKl+soiXeDuoZxtG
         LHX/FptJhfwapzJxvdiMAXEwHovdQVHxN30XqVFE52yaFmYsulZee1cn/P4Wu33SU09O
         r9dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYeZeZmsCjwA/IQo6crYBTuPwihOT9u31e6q62bHfyE67yMs7PjqLGZZqf/5yuEE+LYD356oeBtOgXmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMhViUNPksCNg1kdWvvnq36esLOJh5/4Gl9Qurla0Y/RGEDRwL
	nGrFvb84Q4A5t2f5qUC+p/jMON5ewCRFAc1QwQ2Iznohky7xUs9u
X-Gm-Gg: ASbGncutYBRwqZgRqxPd6s/vPC4SXvXW1A+rCjwy5PxgSgXpYTbLrfR0MRFZfRIr956
	Ua+tRsLFSFVRaVmxOboymHagAEgrDjkeqmBtmHPTIv0se2asbbgO/FQKRWMOc0RxFyi5gQqi+86
	wxepgiyrOe5RqpkIO0tv23ixIjVtDQbV/tqW5yrSGK0lUZaSBAkXIRjm/jSjbS5Y087vF+I4669
	2FsZtYwQCYvRHwLu+FgOE+//4VKhlnzMlQGVqn9tGvQZ3GsSOzEV4aGxUeXtT1C3ZH3fWhr0Va1
	5cm3bl3G6Cy1x2E+gsDX00xsjGRyl5jCcBDffLA=
X-Google-Smtp-Source: AGHT+IHDBvV0qQ07NHfk55qvtex+sgwOy6tRhqXVO4CM20TuwI5QvWlbhrJx+JWvNB7ZbVYZ7Pqf4Q==
X-Received: by 2002:a05:6a00:4644:b0:736:5753:12fd with SMTP id d2e1a72fcca58-73bd1194273mr3931962b3a.4.1744375830033;
        Fri, 11 Apr 2025 05:50:30 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:a964:9277:4e8:b712:66e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230dd71sm1374107b3a.128.2025.04.11.05.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:50:29 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:50:24 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X when
 Cortex-M4 is running and it was started by U-Boot bootaux
Message-ID: <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
References: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>

On Fri, Apr 04, 2025 at 11:17:13AM -0300, Hiago De Franco wrote:
> #regzbot introduced: 4f6c983261
> 
> Hi Peng and all,
> 
> Commit 4f6c9832613b ("genpd: imx: scu-pd: initialize is_off according to
> HW state") introduced a regression where the Kernel reboots unexpectedly
> (without any warnings, crashes or errors) when the Cortex-M4 was loaded
> and running by U-Boot, using the bootaux command:
> 
> # load mmc 0:2 ${loadaddr} /home/root/hello_world.bin
> # bootaux ${loadaddr} 0
> # boot
> 
> This is a simple hello world binary that prints a message into the
> M40.UART0 pin (demo from NXP MCUXpresso).
> 
> Before this commit, everything worked as expected, Linux boots fine and
> the HMP core keeps running and printing messages to the UART. After the
> commit, the kernel reboots at the beggining of the boot process. The
> only relevant message is printed by U-Boot after reset:
> 
> "Reset cause: SCFW fault reset"
> 
> This commit was bisectabled, the same device tree, u-boot version, and
> SCFW versions were used. Reverting this commit fixes the issues.
> 
> For testing purposes, I created the following patch which also fixes the
> issue:
> 
> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> index 38f3cdd21042..0477b3fb4991 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
> @@ -539,6 +539,9 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
>                 return NULL;
>         }
> 
> +       if (strstr("cm40", sc_pd->name) != NULL)
> +               is_off = true;
> +
>         ret = pm_genpd_init(&sc_pd->pd, NULL, is_off);
>         if (ret) {
>                 dev_warn(dev, "failed to init pd %s rsrc id %d",
> 
> 
> Test Environment:
> - Hardware: Colibri iMX8DX 1GB with Colbiri Evaluation Board.
> - U-Boot Version: 2024.04
> - U-Boot Build info:
> 	SCFW 83624b99, SECO-FW c9de51c0, IMX-MKIMAGE 4622115c, ATF 7c64d4e
> 
> The issue is not present on: v6.5
> 
> The real root cause is still unclear to me. Anybody has any ideas? I am
> happy to share more details if needed.

Hello everyone, as this introduced a regression, should I send a revert
for 4f6c983261? Or any ideas that might help fix this issue?

> 
> Cheers,
> Hiago.

Cheers,
Hiago.
