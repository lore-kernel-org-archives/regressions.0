Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B5C208CA
	for <regressions@lists.linux.dev>; Mon, 16 Oct 2023 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W0gIidsV"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53e16f076b3so8177107a12.0
        for <regressions@lists.linux.dev>; Mon, 16 Oct 2023 06:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697462373; x=1698067173; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ofsX2ld2Y35hldDs43R40eV9lYWcpyBA4x3tj2sdNUM=;
        b=W0gIidsVaCBmHk1BIAZhYILZ+Gmpx73KVSB7gTjyBOPuPRwL7UZ8NHGmMtcHhnUgkm
         RuLvfclK9QmrzSdrYBXlCEQtyf14hHXihlEyWYuofrf0bPXfBCtds11tUBEWn80enkq3
         rXgT7rIeoOTsyALGAWGK5oX4uAUpViT4XlS0YCKg/YmoUUg8CaBomKa2gfJn6873qwRw
         JDA6jCRFHopkR2Ixf3fiBaAdaP4+H+i8UXzOwO6T5bR7evh9TFLVNPT7W/oJL/XpbN6x
         tLACRFhrS+BLwiJTm1ys9Q3LB6OuOW77cUbjgTgEKrmzgM1nCf31Q15J3QgO3hgToeK3
         4cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697462373; x=1698067173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofsX2ld2Y35hldDs43R40eV9lYWcpyBA4x3tj2sdNUM=;
        b=fJTWPm30bJEHEM0n81Qdj+Crxu/U+bZW9NoW5WRpacmrCCwSPz/HnQtwF/nVYBdYUV
         mXocXiajgHOZmDN0Q5db4y5sxWBYYT6QeTpZ/23iZ5yVATqqGW0UjBc7InIttq3fbDKw
         r3Fd1DMBsk0NXBqyV4x7RIjBKxRNqnCJgxLb46p0jBIxc+Zg4OEtnbspeJTWSxyb+eSY
         5z6gC+oxNc6Rh0teM5LtEDJa9v4D7JeTPFkwH0ovXbUefOqUaibsEHv45B7ApMpp128I
         e+xAJE9g5N9Hp21kRm5bzwaCNmgWcsjBAbUbRvd4kj/lxT3T4rSw1yGMsIX56JzCgUk7
         1hCw==
X-Gm-Message-State: AOJu0YyN9h17gTpCf13Vap6T4miMcGWNMURVEGjBZqthowyd1E/jvv6E
	uBeaVkj4tJQ6ruNR2E7z9M69OXfjCaq21+dGN1SX7LFo8lEAv+oE9KA=
X-Google-Smtp-Source: AGHT+IFuH/XgysB7Sxky39MfcG4hkkSZ6xm21/9jC7buhA0x7DsWtKnFalffqQ9KEVpl9pkg+JUIfKq8xTStyGVkKkM=
X-Received: by 2002:a17:907:5ca:b0:9ae:6648:9b53 with SMTP id
 wg10-20020a17090705ca00b009ae66489b53mr6876194ejb.23.1697462373491; Mon, 16
 Oct 2023 06:19:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <267abf02-4b60-4a2e-92cd-709e3da6f7d3@gmail.com>
 <CAMZdPi9RDSAsA8bCwN1f-4v3Ahqh8+eFLTArdyE5qZeocAMhtQ@mail.gmail.com> <ZSiJdxjokD0P9wRc@debian.me>
In-Reply-To: <ZSiJdxjokD0P9wRc@debian.me>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 16 Oct 2023 15:18:56 +0200
Message-ID: <CAMZdPi8qmc4aKPsm3J60Fb+wa0ixVCV+KK11TDsvqFJk81Gfrw@mail.gmail.com>
Subject: Re: Intel 7560 LTE Modem stops working after resuming from standby
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: M Chetan Kumar <m.chetan.kumar@linux.intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux Networking <netdev@vger.kernel.org>, 
	Linux Intel Wireless WAN <linuxwwan@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"

Hi Bagas,

On Fri, 13 Oct 2023 at 02:04, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Thu, Oct 12, 2023 at 06:54:11PM +0200, Loic Poulain wrote:
> > Hi Chetan,
> >
> > On Thu, 12 Oct 2023 at 11:52, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > > I notice a regression report on Bugzilla [1]. Quoting from it:
> > >
> > > > I noticed a few days ago, after Fedora moved to Kernel 6.5, that my Intel LTE Modem was not working anymore after resuming from standby.
> > > >
> > > > The journal listed this error message multiple times:
> > > > kernel: iosm 0000:01:00.0: msg timeout
> > > >
> > > > It took me a while to determine the root cause of the problem, since the modem did not work either in the following warm reboots.
> > > > Only a shutdown revived the modem.
> > > >
> > > > I did a bisection of the error and I was able to find the culprit:
> > > >
> > > > [e4f5073d53be6cec0c654fac98372047efb66947] net: wwan: iosm: enable runtime pm support for 7560
> >
> > Any quick fix for this issue? alternatively we will probably revert e4f5073d53.
>
> Chetan can't be contacted as sending to his address bounces (error 550)
> (had he left Intel?). Last message on LKML is this culprit patch [1].
> Hence, revert for now.

Could you please submit the revert fix?

Regards,
Loic
