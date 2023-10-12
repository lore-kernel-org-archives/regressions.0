Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DD63D01C
	for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 22:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzvQbEVg"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso1129931b3a.0
        for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 15:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697151188; x=1697755988; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=78dLfHiKtRMa9+mkxUCYKM56t0Kv23O6vbCoyWzPuyY=;
        b=DzvQbEVgJtITgFuglDWRC/z551X3vOyizEvdEQm35QTH57bzWwQcOiOwvuNn6NWanC
         vVs6FQYtjhydxUsb9mWeHyjpbD/4WV+JuV/8MVHQs25T59hAcflTyvDbRcnH4fKa/zWn
         l96cyE8quud7qsSw4Bhono7w1ZVZWQl2bgVTBezMzYB8DCFvs36VBJmlQdsAqVSt2Ko+
         xPTIiH80LgscqFbb8Y//ZhXpxO8hA3IHJVQJqB4/7+1r5IP7V80kqbm3Z0piZvXc6TtH
         oI7/p5WZFYAusgJMy2u3CXFwH2KKELMqGoc5wU2Yevk3t0IRdfLXYbJ2UeP54/FOLqSG
         QlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697151188; x=1697755988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78dLfHiKtRMa9+mkxUCYKM56t0Kv23O6vbCoyWzPuyY=;
        b=CM6Cknka5yX2mqp0uy2ViYbvlZhvDN7VVOY3QSjtq+QmpJHdtpXDExI3dVwZOs3u1K
         UysJaQfd7Dak/teZQGFzoR9myPDUT5H7oS6UnAqAjXG6xXZzAph3DBRUgxpym2LH/GdO
         mjDycW04nXGS/1zaQCTinu3MLIrAwZrnY0AiW76sTQScSXLq1tV61ct8EigVoU1Mqv57
         q1EH+8O33vBUaZ95XupmGAipbuxeOQW1vNK/iGCv9g73rV647S/hmvf2Jqrl4MHrvJ3a
         iIZBEtM1mdxncsPhGpXURNjHMRFyefTtbyvdZ8ldrXVLs3+LCVmyp6YaH+lu2gkNYUKN
         +WKg==
X-Gm-Message-State: AOJu0YzDAPYdO5PhTmKJqi+c59VfW9WC5yIDLdNflozDHISsrwk3LCZy
	H4luDEd/wY2HGv/5DUifry4=
X-Google-Smtp-Source: AGHT+IG5S/ip7RUwzEiiwV3FfRhxwAfJzPoA0AHgoWOeXhvM1SNfgqC3HnPqI744GDUGdf3PgLP/VQ==
X-Received: by 2002:a05:6a00:21cc:b0:68e:351b:15b9 with SMTP id t12-20020a056a0021cc00b0068e351b15b9mr35521708pfj.4.1697151187538;
        Thu, 12 Oct 2023 15:53:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a118:bd3a:f198:d7ed])
        by smtp.gmail.com with ESMTPSA id a19-20020a637f13000000b00578bb0066b6sm2220692pgd.71.2023.10.12.15.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 15:53:06 -0700 (PDT)
Date: Thu, 12 Oct 2023 15:53:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jeffery Miller <jefferymiller@google.com>, regressions@lists.linux.dev,
	benjamin.tissoires@redhat.com,
	Andrew Duggan <aduggan@synaptics.com>,
	Andrew Duggan <andrew@duggan.us>, loic.poulain@linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: elantech - fix fast_reconnect callback in ps2 mode
Message-ID: <ZSh40JethapBAjq1@google.com>
References: <20231004005729.3943515-1-jefferymiller@google.com>
 <ZR1yUFJ8a9Zt606N@penguin>
 <CAAzPG9Pp6mHfEziJiUuhDRmkKMfiiPD6axtfAMaCJcEAcuQPiA@mail.gmail.com>
 <25ac6b17-e3fa-4e98-95a6-eac12bdbcdd2@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25ac6b17-e3fa-4e98-95a6-eac12bdbcdd2@leemhuis.info>

Hi Thorsten,

On Tue, Oct 10, 2023 at 09:08:23AM +0200, Thorsten Leemhuis wrote:
> On 05.10.23 02:13, Jeffery Miller wrote:
> > 
> > On Wed, Oct 4, 2023 at 9:11 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >>
> >> In fact, now that I think about it more, we should rework the original
> >> patch that added the delay, so that we do not wait these 30 msec in the
> >> "fast" reconnect handler. It turns out your original approach was
> >> better, but we should not be using retries, but rather the existing
> >> reset_delay_ms already defined in rmi platform data. I would appreciate
> >> if you try the draft patch at the end of this email (to be applied after
> >> reverting your original one adding the delay in psmouse-smbus.c).
> > I tested the draft patch and it works. I did revert the previous delay
> > patch while testing it.
> > 
> >> I think we need a similar change in synaptics.c as that one also can
> >> fall back to PS/2 mode.
> >>
> > Ah, good point, yes it does appear this needs to be done as well.
> > I have tested and will post an new version of the patch to include
> > the fix in synaptics.c as well.
> 
> As I'm affected by this problem (and somebody else reported to me in
> private to be affected as well) and nothing afaics happened in the past
> few days a quick question:
> 
> What's the way forward here now that -rc6 slowly comes into sight? Apply
> Jeff's patch to fix my problem? Revert the culprit and fix this properly
> up with Dmitry's and Jeff's patches in the next cycle? Something else?

I will revert the original patch introducing the delay now that we argee
there is a better way. In the mean time I will merge Jeff's patch to
reset fast_reconnect handlers, as it is right thing to do anyway, and
will get into shape the patch setting reset-delay in RMI code.

Thanks.

-- 
Dmitry
