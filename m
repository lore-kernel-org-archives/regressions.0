Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CA826E07
	for <regressions@lists.linux.dev>; Tue, 26 Sep 2023 11:23:19 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-405524e6769so39115325e9.1
        for <regressions@lists.linux.dev>; Tue, 26 Sep 2023 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695727398; x=1696332198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMeSzzLlxhV04SlweKcnZdB57NwdycsgJqov1wCWtTc=;
        b=Nx/6Gd+P040YoeJ/Am+h7q45O146P1P1/JdPkypUc7639eq7Xu6Hu1O3S06aK5yFBG
         q1Q+SL/ItynzJyKZihv+4cv9kpDW/vYHp4Nc4p6VfMGwajabArF7eEFrbtsI8M18iB2I
         dUo+FhwspHOyANXmZuMxcCslP37ogLqPTgQBUvwl2rIFaIEW/4ITC126JZIK8QtQ/gFt
         0kxPBTiiFtRuLukGRLV7aXPuKfQy3CulgyM1wW+kig2RnCSw8Eg2roC03F9LcMc/GUyR
         ts9OnPApxS4XueUVS1ywbONiJuhRXc9QN6aCyqdQhW1JOZSZG2Gb6txGWIm2S90jR+03
         GaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695727398; x=1696332198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMeSzzLlxhV04SlweKcnZdB57NwdycsgJqov1wCWtTc=;
        b=RQK8KVl0/VrNL4WC5lB5liUhjQH7ebDFnsxcjE9trD5K6qhAlU+zw70AfQyb5G2AH2
         17NoolcrJro3lZ3NFhIx2bqKB0uHYFgYupk5xjv6XcOse0VCBrc+2Fu/YTrfC2nypk+X
         qxfYloaZPQ7r9/HzNL5lYzf/NjqbRlKsQg1uHPZN/KBEXUGKCxux0Fxc89f3KKiCGr4J
         ZmGiW75hAajvB29IjKV5kcfxdrreSsXiiXGxbdDKUeLlss0biGM5KEv5u+je2Kk1nlTY
         FszLMroN+xCm7aFx0XgITZqZkcZjTKzUFeuT1TO5eoMzSkaJwWVT+JFvtebfiyXmHvIr
         8cHQ==
X-Gm-Message-State: AOJu0YwTzQxqOV8FWuhHxIDANmvQ3uhzIoVp5gdb/r7daUUTG0ZJPkEN
	Es77kq8MDUw1mred44BSUbQ=
X-Google-Smtp-Source: AGHT+IEPmizr+2spNBYC/XCrjjUHvrZN8VOt/YC0yj7mg2vIymhmwjKbjw/gtnZ8KLuTWQZk/BGzgg==
X-Received: by 2002:a1c:7907:0:b0:402:f8e3:93 with SMTP id l7-20020a1c7907000000b00402f8e30093mr1848145wme.10.1695727397854;
        Tue, 26 Sep 2023 04:23:17 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id f2-20020a7bc8c2000000b003fefaf299b6sm3330603wml.38.2023.09.26.04.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 04:23:14 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 1F994BE2DE0; Tue, 26 Sep 2023 13:23:14 +0200 (CEST)
Date: Tue, 26 Sep 2023 13:23:14 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Ricky WU <ricky_wu@realtek.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Paul Grandperrin <paul.grandperrin@gmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Wei_wang <wei_wang@realsil.com.cn>,
	Roger Tseng <rogerable@realtek.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from
 drivers/misc/cardreader breaks NVME power state, preventing system boot
Message-ID: <ZRK_Iqj1ZSjx1fZS@eldamar.lan>
References: <5DHV0S.D0F751ZF65JA1@gmail.com>
 <82469f2f-59e4-49d5-823d-344589cbb119@leemhuis.info>
 <2023091333-fiftieth-trustless-d69d@gregkh>
 <7991b5bd7fb5469c971a2984194e815f@realtek.com>
 <2023091921-unscented-renegade-6495@gregkh>
 <995632624f0e4d26b73fb934a8eeaebc@realtek.com>
 <2023092041-shopper-prozac-0640@gregkh>
 <3ddcf5fae0164fbda79081650da79600@realtek.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ddcf5fae0164fbda79081650da79600@realtek.com>

Hi

[apologies if I missed some followup but was not able to find the
answer]

On Wed, Sep 20, 2023 at 08:32:17AM +0000, Ricky WU wrote:
> > On Wed, Sep 20, 2023 at 07:30:00AM +0000, Ricky WU wrote:
> > > Hi Greg k-h,
> > >
> > > This patch is our solution for this issue...
> > > And now how can I push this?
> > 
> > Submit it properly like any other patch, what is preventing that from
> > happening?
> > 
> 
> (commit 8ee39ec) some reader no longer force #CLKREQ to low when system need to enter ASPM.
> But some platform maybe not implement complete ASPM? I don't know..... it causes problems...
> 
> Like in the past Only the platform support L1ss we release the #CLKREQ.
> But new patch we move the judgment (L1ss) to probe, because we met some host will clean the config space from S3 or some power saving mode 
> And also we think just to read config space one time when the driver start is enough  

Is there a potential fix which is queued for this or would be the
safest option to unbreak the regression to revert the commit in the
stable trees temporarily?

I'm asking because in Debian we got the report at 
https://bugs.debian.org/1052063 

(and ideally to unbreak the situation for the user I would like to
include a fix in the next upload we do, but following what you as
upstream will do ideally).

Regards,
Salvatore
