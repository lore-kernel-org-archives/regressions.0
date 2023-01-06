Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1A7B
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 06:22:05 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id c4so758730plc.5
        for <regressions@lists.linux.dev>; Thu, 05 Jan 2023 22:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3P39B3+R/DWnUo27dj0CuajbLtQj508AlEFbLQeeco=;
        b=gFfwNN2cBsPVNqo5NLC1hz0fbBDjCCVekPUQUzDXQiNrz3vaAbuoC2l2Rcv5KDD1BR
         GGUDQU1BU/ZGDR7W9+LH+2DU1RDh1tJ3gm2EJRk9EzScNFktUgzFV4suePITtV+8chsg
         2hXm3VHigwfCzIzwicjfr2JbSL9rgoJAREUDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3P39B3+R/DWnUo27dj0CuajbLtQj508AlEFbLQeeco=;
        b=kqG6SX0OrMdqnnzIY88Nx7g6huAFU7b7JtagGtPdPH00aPk+16wUBH2PuGtQhsVuEa
         HMJlsvkGNf5GCDoR5PlTwzHMgdAA0G/ScdTHaTKJQxhVFNWHZKm57TkpIibT/DHCP8qp
         +9FyJjpyB0UrKKjD9MnSCC8esDAYWkBrdJ8x9ka1uIPlIM+scSMgk6hzCOAGlck6KZQF
         k9D++MqOb/y+rwjgWZ+cd2ukvxWQrnwg3/e42X/V9agEF0APY0PnRnrFKORUqEl/ZIAz
         Fw/ms4O4TGL+cV9C5tbSY4x4g4g3H9CejLcKcFCah1rezUvj7EGFWYwfXih4TunoAv7F
         azVQ==
X-Gm-Message-State: AFqh2kozAtL3PyiFKGgYYaOH2mtT79T7ekcDu8okF9ek6yoIr1ZCdDIy
	Ijzgweph8G2M0SgKy+w+mUgRcw==
X-Google-Smtp-Source: AMrXdXtM1vP5dcgTHPDfmr3om3PPOARVroyAjqYZI9GdQBO0YB4PrzpyQj622REF2D7RDm2EKP3p1w==
X-Received: by 2002:a17:90a:d78b:b0:219:34cb:477e with SMTP id z11-20020a17090ad78b00b0021934cb477emr57605129pju.44.1672986124780;
        Thu, 05 Jan 2023 22:22:04 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y128-20020a633286000000b004768ce9e4fasm257954pgy.59.2023.01.05.22.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 22:22:04 -0800 (PST)
Date: Thu, 5 Jan 2023 22:22:03 -0800
From: Kees Cook <keescook@chromium.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	linux-bcache@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [regression] =?iso-8859-1?Q?Bug=A02167?=
 =?iso-8859-1?Q?85_-_=22memcpy=3A_detected_field-spannin?= =?iso-8859-1?Q?g?=
 write..." warnings with bcache #forregzbot
Message-ID: <202301052218.042D2BFE@keescook>
References: <19200730-a3ba-6f4f-bb81-71339bdbbf73@leemhuis.info>
 <2e4e65a8-87b4-fac6-ef89-76b118b0cec4@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e4e65a8-87b4-fac6-ef89-76b118b0cec4@leemhuis.info>

On Thu, Dec 15, 2022 at 08:11:06AM +0100, Thorsten Leemhuis wrote:
> [Note: this mail contains only information for Linux kernel regression
> tracking. Mails like these contain '#forregzbot' in the subject to make
> then easy to spot and filter out. The author also tried to remove most
> or all individuals from the list of recipients to spare them the hassle.]
> 
> On 08.12.22 15:53, Thorsten Leemhuis wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=216785 :
> > 
> >>  Alexandre Pereira 2022-12-07 18:51:55 UTC
> >>
> >> Testing linux kernel 6.1-rc8, I have several kernel erros regarding bcache.
> >>
> >> For context, I have a bcache configuration that is working without issues on 6.0.x and previous versions.
> >>
> >> The errors:
> >>
> >> dez 07 18:33:45 stormtrooper kernel: ------------[ cut here ]------------
> >> dez 07 18:33:45 stormtrooper kernel: memcpy: detected field-spanning write (size 264) of single field "&i->j" at drivers/md/bcache/journal.c:152 (size 240)
> 
> #regzbot inconclusive: stop tracking field-spanning write warnings, they
> come from a new security feature
> 
> https://lore.kernel.org/all/20210727205855.411487-1-keescook@chromium.org/
> 
> Tracking them would cost time I better spend on more important things
> for now

FWIW, I'd find it handy to see these. I've been trying to track and fix
them. To that end, I've just sent out the following patches:

https://lore.kernel.org/lkml/20230106045327.never.413-kees@kernel.org/
https://lore.kernel.org/lkml/20230106053153.never.999-kees@kernel.org/
https://lore.kernel.org/lkml/20230106060229.never.047-kees@kernel.org/
https://lore.kernel.org/lkml/20230106061659.never.817-kees@kernel.org/

Thanks!

-Kees

-- 
Kees Cook
