Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140B262BB
	for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 16:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6EZAzDN"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so2174409a12.1
        for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697129689; x=1697734489; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bBUBWcfqd6h2FYCx6HxLCGICG3O8Ap6wf3BtHDsyNkw=;
        b=F6EZAzDNp1O97/LpMjHgwv3qposIzqUIInl037OcoRfxT4rdzsDFsfDxYB+KiC9cXv
         scGbuKc7rlYUDRZ6UvTWwbC8YQm4XWIPascuEhp7W/qIn2+0uTAWYS61+IAqDXOXoP3U
         uvt+/0ge82Iy3Wt42qhn2DHAYdcqSPBtX4RnbJJC+kuvwJGBcuZ1BnzJ+i8XNTlYUU0p
         lMJwtHtj6W6mFoiefPN8jyjE3d3sIGY60xp3zSYvRURZFVUw7aLYogiYk7OMK90qdsA2
         7RwcONWjz1WZUl56wQ3yMMSPwHlZymbufsygipMKYPhvsrJgC4M4yFu7sUTb8BBDtgtU
         H/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697129689; x=1697734489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBUBWcfqd6h2FYCx6HxLCGICG3O8Ap6wf3BtHDsyNkw=;
        b=nnNk46Q54qdnEuq4WoOysUM7tUdEUk+nVEg8V+f73Wd2IWlpc2suwdAdLQWlIGWEcF
         HwjThQzolvEOX4+aMrdMXGgc/rC19s3KZFzGjj2xTMlUlHABzl/YbkynPqkw9CNj6KjY
         q0L4arn1eMyt8K3TdGZFtpTk3ezMvuPiKLK94asVLfrujnF04qCgl1CQhDwEONS8b96P
         No8ls1lb72k8qpS0wtrJg6rePD6za80fUAoYW+3LsZ0z2YFIXM1lCzV8oVshlh9EemUM
         x6BomBtCHoP9vpDpTCmkMSBSZGHAA6fkgLcI4IdKR1hGrd8sOMEzYVggOX71LJcEomc1
         Af7g==
X-Gm-Message-State: AOJu0Yz10cb8asUO1+YojyfIrHKz6PUulngrRnCWnmVUM1kwpprQr0yW
	4dOSu9KiMEQwlVJfWZiPIxmNFZEkx79oidV/2WYmSg==
X-Google-Smtp-Source: AGHT+IERlaWWwiML/RFT3cp2GcW0IWarhx9gkibx1TlIHF9bhAGNQd9/QPTUhc2WeHSsLpPbF34UNy9rAMlj9u2bDOA=
X-Received: by 2002:aa7:d88e:0:b0:532:e24d:34f4 with SMTP id
 u14-20020aa7d88e000000b00532e24d34f4mr21115676edq.39.1697129689228; Thu, 12
 Oct 2023 09:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <267abf02-4b60-4a2e-92cd-709e3da6f7d3@gmail.com>
In-Reply-To: <267abf02-4b60-4a2e-92cd-709e3da6f7d3@gmail.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 12 Oct 2023 18:54:11 +0200
Message-ID: <CAMZdPi9RDSAsA8bCwN1f-4v3Ahqh8+eFLTArdyE5qZeocAMhtQ@mail.gmail.com>
Subject: Re: Intel 7560 LTE Modem stops working after resuming from standby
To: Bagas Sanjaya <bagasdotme@gmail.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux Networking <netdev@vger.kernel.org>, 
	Linux Intel Wireless WAN <linuxwwan@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"

Hi Chetan,

On Thu, 12 Oct 2023 at 11:52, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> I notice a regression report on Bugzilla [1]. Quoting from it:
>
> > I noticed a few days ago, after Fedora moved to Kernel 6.5, that my Intel LTE Modem was not working anymore after resuming from standby.
> >
> > The journal listed this error message multiple times:
> > kernel: iosm 0000:01:00.0: msg timeout
> >
> > It took me a while to determine the root cause of the problem, since the modem did not work either in the following warm reboots.
> > Only a shutdown revived the modem.
> >
> > I did a bisection of the error and I was able to find the culprit:
> >
> > [e4f5073d53be6cec0c654fac98372047efb66947] net: wwan: iosm: enable runtime pm support for 7560

Any quick fix for this issue? alternatively we will probably revert e4f5073d53.

Regards,
Loic
