Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1813439910
	for <regressions@lists.linux.dev>; Thu, 16 Jul 2026 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221760; cv=none; b=DSDmlPjO6z/zQJB5BmnFypBusTecZjZnfi0mmyEOKquW94M5jWCaBAEnde6VKMpAIOWztg4V9TTz6ek7+waQzENmqwGRiGczNC9e0jYdA2hdOPHn+PhTeqN3Sxg7YzilN9AyaWloBg0k/gJNnP8j1o0OIBvUw23UUZLUAXTV0BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221760; c=relaxed/simple;
	bh=tEPuH0w8ovN1LWEjJQMK9Q1Z1vEJ7za/094ayvYh7Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o86MAncaKNflpoekq6a7YyM9blmKL4iHhpduk0A1oqbhtowNapt/IBxx3EHKBqX+P6OFHbzBYqZzOUq2qxw+hYozXxg39tmEKw2SjTMvnVveNqE/0/A4JPx93LnlcC7xOFyUsQxGzb6MlPYtu10H0yOe/0MQ1sgB1vFiIUPjFgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1jdM+Gb; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1jdM+Gb"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81062fdeaf5so7472017b3.0
        for <regressions@lists.linux.dev>; Thu, 16 Jul 2026 10:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784221756; x=1784826556; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=519dNdxGkZChACNROtarKLrXjiSKkCZfa7q39zzxKTI=;
        b=Z1jdM+Gbk2apQajaWDsMhqHlSRkwWANhUyMdvf3bu6m5ud0shFzp6epm96T5jLbFBn
         RqIw+Cf7Me8mDFs8ajzUIvNyHtwdPeveYTluQL3yn4fiIc9WAUNKVCupOm0GQOELli6S
         2cIgtfCg6ZrwVq+2CD0iIHI+1CGDxAesH+lLdGmBL9ydEdQmFBa9UZ7FPlabzo62/vCi
         4uqo09GXEY9jzzQEEemPXTNPcZ0+E8mkiy1iLro4TDw19m02S4q3zAd5jIzpZui22W6y
         hj9hEkQYmXMlVinZVmnN5fq1SpKG0VSRWiFxAlC7mrAP1haEF/X745OnRDsBAW4VCnsv
         TmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221756; x=1784826556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=519dNdxGkZChACNROtarKLrXjiSKkCZfa7q39zzxKTI=;
        b=F5aL2EL1kdmsZIdzwAMmyFnNmp5D4tN/pG1kL1A3yi1ZCMtrJV3OTAE8QWnSRAY5bx
         TBcROHeY06C620bTq7rr86E4DX/yJclRu2lciJBsdbF1Wp4Is8FhKvYINjS8ZsABIpp8
         FMhhlqS3CiZHqYFpQy6mlL3f9agtsBz+/CAoKvGndSd35+qlGZwrcgWrVQ3mF+7OqAzu
         X8u5JbTMTh5JLb6C50nn+IKkSAAi2jUcJyrnh5OFLAznb3kYVwTounEY2Wn26oX8tV9I
         7wIn2O9UjOHL0lEtzyI8tOb78Iujv1HWvUoWAAuwKIFRwddvnzyLuH7Cten10GE1lX+z
         ncsA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0p2buM9Wi6DbYpuotdi319Pf/gbMFbKbjDBj0lbVNoMb3QoErpvJm26SxpTFchJUzcF1+nfIHKT2KBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqThAi0qRePcwaBvhVXew/a8cXoHMZgJsH/s6i29V2lc5qT5jn
	4aSu5JS/1PPorRaKdlLuu6m3Qqsee4em1gX4hitEEowEJUa+jYEZ/CKn
X-Gm-Gg: AfdE7cnrxLGhqSj57zB1P+gTSQmN0H8x5ZH4KIWLe43kECk9I71VRghFuQeWT+ZTlph
	3m/JdlDA2K3YhEe3w0QNnnlxPHTPPtI/a1cpDQzyIUblICpcqY6JGLl+fnIO3e9y3I+kUfnefXI
	kacNalrBK0Fym8BuENFbHySheBZIHCL5jzTidO9TnGpkYdBd2otEx+8xF7o6hYrzl3psgT2E2Rp
	+MnMtKw3AiLXNtXIJITp+FWRi4wDcXKNQdqnFXRodKgR4aWU3J9la/BM770hRE77rMoLdvojAA2
	NgFPjSnSUGdwHeYHO3H+/r55Ez08CjZFuZNqQXhB6RL9dFK80WSjenXI0n/brV5Sc+jd/hwM/zx
	3NqKICv/WJo9AglrCC/2KtfzCr2y10w2NmIFgwoUIuQvlJYYHA3Q/+mm+LpyPqD1qHV2dKY5BjT
	p1B/b2wyWsY/kfBbeFxEMiLHymXFiZ/e8tcZ81PdlSc32Jvcxsp9wHVZ2g4ML7keHnfJapzA==
X-Received: by 2002:a05:690c:6983:b0:81e:429f:24ba with SMTP id 00721157ae682-81ee298087bmr22881717b3.36.1784221756342;
        Thu, 16 Jul 2026 10:09:16 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm199484877b3.49.2026.07.16.10.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:09:15 -0700 (PDT)
Date: Thu, 16 Jul 2026 14:09:08 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "leonardo.costa@toradex.com" <leonardo.costa@toradex.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Sherry Sun <sherry.sun@nxp.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>
References: <20260629143439.361560-1-leoreis.costa@gmail.com>
 <20260715234736.GA288957@bhelgaas>
 <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>

On Thu, Jul 16, 2026 at 02:15:42AM +0000, Hongxing Zhu (OSS) wrote:
> Hi Leonardo,
> 
> Would you be able to test this patch on your affected boards? Your testing
> would help expedite the merge process and ensure the fix resolves the boot
> issue you're experiencing.
> 
> Best Regards
> Richard Zhu

Hi Richard,

Sorry for taking long to respond, I was caught up with something. I
tested the patch and it solved the issue. I sent a Tested-by tag there.
Thanks for looking into this!

Best Regards
Leonardo
