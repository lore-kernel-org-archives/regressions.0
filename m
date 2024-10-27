Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD58A1CD2C
	for <regressions@lists.linux.dev>; Sun, 27 Oct 2024 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730048555; cv=none; b=az7fH7PpU2D1IqLC9ErmXKLr0kmSg/0CHnV1hJjIh5TqnlY0Fr0kxWLXTovfyIRBHImABdO9MK3yG4tmKEmN4wxqk8uNm1rdqFG3jO+46nMyAFEr2+pn5NyXLCXrg1HOWLBAOwA9fsoe79sObULal3FIaxiZsVZ4Gd3eGV/L1PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730048555; c=relaxed/simple;
	bh=ezaYr65rJZJ51k+pNPhphDmxWAXK/bpIsOIydLxH4zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFCvluJErOxz3w9Z/EwQVlyj1zpiO0MqzcZnL5U7eDEAIL80Yw5YSP3kZXstWu80KQ42urMkCADHg/LG2DsMPk6pjEHD5kTDoyVbcOQZxvxi2Wmz6e2cWiY0nxPKNoyulzVAz3N1AhOumOgwinmtY5HppGTvtcW1BV4P8KvZZQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHTRfk/s; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHTRfk/s"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b5affde14so24622325ad.3
        for <regressions@lists.linux.dev>; Sun, 27 Oct 2024 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730048553; x=1730653353; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HKnhGmzZl2AIuxdBwoQ/4eMB1r9ZfA4SkjcpsUkyFQg=;
        b=KHTRfk/sdRNjtk1Ud0OAuxXBP1eRElYpsRVTD95kpqa/Hk4fom6fXoyqf3O+FiZfXE
         9ayjvapDhUXCYzM+u7nM+Q4w2yEEsz9GjRLXpAY1HWivwOBFPWPaEUkzC0dxBdwntO50
         EscQztF17pPt71AJ1uoer9QHhu+klayiJl45cwTi5W6XtOSZrfXyw5qSNBniKoCEHEwM
         tWl8wbMmxfju9K9eVdKD0Hcpnymtozorc5VzsNAXWDhxNBVWEzjTYJ97ewoRwiP6zYwI
         FCQ8Ou7YWAxfShL/uZTDIUGUPU4UC2zgnXdZeq8U56h4No2Sr9Xi0r2q/uxcbRSNN20z
         9Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730048553; x=1730653353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKnhGmzZl2AIuxdBwoQ/4eMB1r9ZfA4SkjcpsUkyFQg=;
        b=U361y9aiF39vAPxyn189ocUrT28EKR5UDhjFhpcLpXqYUDT6Y9JuhQ+c6kiof2+KOa
         7a/BezC2Vat7e9jp9VZrKSZ7lmq0AqCppSJ/gLDGYlYHp1xQh3knaTRQnG3U1M/KdUsj
         c/frLMSLU7fDHOf3AzQjSKIh+VFmeM1blw2rE5mXdO2bm1DDjWNAVu5uhJeioYPQxWGB
         PRKEHrD5CXQ2hfJWWW/TJiuIIShIahhX+jqHbuNxOWZyTqQBoV2eIMELT4nsjFcMXsi8
         6D8DuEiWq6ypvzA8utiZ2iTihY/92vFxyz65R1rA08LlFCHc+dqGl7BpDDxXcAe5iD55
         QMgg==
X-Forwarded-Encrypted: i=1; AJvYcCUaa3odacgRS/Ja+O/qD/a2CdOhCfIzCcppiW7F/Ooc4VkHBfCQtO3n31quINojDAUIQwWvEavSdnZV+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT/ezQ6Fb6Kf6j2HhieBf0itVT3uYiOpL497aJPRs1qtaer5dG
	EnUNOgy0uKCcf1QUSjBft3Ct6I07+xvofxnwx5UKe0JsJEF8VnAY
X-Google-Smtp-Source: AGHT+IGK1mBEd5LH4WnjEs7ICQ//qew36B2aQOB433vS46GN0DgBj2PBePzkM5DJu/RdkyREmU6/8w==
X-Received: by 2002:a17:903:2a90:b0:20c:e8df:2516 with SMTP id d9443c01a7336-210c6c344admr74242425ad.42.1730048552998;
        Sun, 27 Oct 2024 10:02:32 -0700 (PDT)
Received: from xavtug (2603-9008-1600-2265-a236-bcff-feba-a919.inf6.spectrum.com. [2603:9008:1600:2265:a236:bcff:feba:a919])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc0179e6sm37235595ad.168.2024.10.27.10.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 10:02:32 -0700 (PDT)
Date: Sun, 27 Oct 2024 10:02:24 -0700
From: "Ned T. Crigler" <crigler@gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Cc: Christian Heusel <christian@heusel.eu>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, Jeff LaBundy <jeff@labundy.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <Zx5yIEZwT5SxzCTx@xavtug>
References: <Zx2iQp6csn42PJA7@xavtug>
 <69b6119c-3c3a-406f-9375-3e55fba9b732@heusel.eu>
 <20241027163744.2d396c61@gmx.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027163744.2d396c61@gmx.net>

Hi Peter, Christian,

On Sun, Oct 27, 2024 at 04:37:44PM +0100, Peter Seiderer wrote:
> Hello Ned, Christian, *,
> 
> On Sun, 27 Oct 2024 15:06:09 +0100, Christian Heusel <christian@heusel.eu> wrote:
> 
> > On 24/10/26 07:15PM, Ned T. Crigler wrote:
> > > Hi,
> >
> > Hey Ned,
> >
> > > It looks like starting with kernel 6.11, disabling and re-enabling
> > > magic
> > > sysrq fails with these errors in dmesg:
> > >
> > > kernel: input: input_handler_check_methods: only one event processing
> > > method can be defined (sysrq)
> > > kernel: sysrq: Failed to register input handler, error -22
> > >
> > > after doing:
> > >
> > > # echo 0 > /proc/sys/kernel/sysrq
> > > # echo 438 > /proc/sys/kernel/sysrq
> > > # echo 0 > /proc/sys/kernel/sysrq
> > > # echo 438 > /proc/sys/kernel/sysrq
> > > # echo 0 > /proc/sys/kernel/sysrq
> > > # echo 438 > /proc/sys/kernel/sysrq
> >
> > I have found that this issue is also present in the latest mainline
> > release and bisected it to the following commit:
> >
> >     d469647bafd9 ("Input: simplify event handling logic")
> >
> 
> After the mentioned commit a call sysrq_register_handler() -->
> input_register_handler(&sysrq_handler) with sysrq_handler.filter set
> will result in sysrq_handler.events set to input_handler_events_filter,
> see drivers/input/input.c (line 2607 to 2608):
> 
> 2596 int input_register_handler(struct input_handler *handler)
> 2597 {
> 2598         struct input_dev *dev;
> 2599         int error;
> 2600
> 2601         error = input_handler_check_methods(handler);
> 2602         if (error)
> 2603                 return error;
> 2604
> 2605         INIT_LIST_HEAD(&handler->h_list);
> 2606
> 2607         if (handler->filter)
> 2608                 handler->events = input_handler_events_filter;
> 2609         else if (handler->event)
> 2610                 handler->events = input_handler_events_default;
> 2611         else if (!handler->events)
> 2612                 handler->events = input_handler_events_null;
> 
> So the second call will fail at the check 'input_handler_check_methods(handler)'
> which only allows one method to be set, see drivers/input/input.c:
> 
> 2517 static int input_handler_check_methods(const struct input_handler *handler)
> 2518 {
> 2519         int count = 0;
> 2520
> 2521         if (handler->filter)
> 2522                 count++;
> 2523         if (handler->events)
> 2524                 count++;
> 2525         if (handler->event)
> 2526                 count++;
> 2527
> 2528         if (count > 1) {
> 2529                 pr_err("%s: only one event processing method can be defined      (%s)\n",
> 2530                        __func__, handler->name);
> 2531                 return -EINVAL;
> 2532         }
> 2533
> 2534         return 0;
> 2535 }
> 
> 
> A quick fix/hack for the sysrq case:
> 
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -1045,7 +1045,7 @@ static inline void sysrq_register_handler(void)
>         int error;
> 
>         sysrq_of_get_keyreset_config();
> -
> +       sysrq_handler.events = NULL;
>         error = input_register_handler(&sysrq_handler);
>         if (error)
>                 pr_err("Failed to register input handler, error %d", error);
> lines 1-13/13 (END)
> 
> Regards,
> Peter
> 

Thanks for tracking this down. It seems messy that the mentioned commit
changes input_register_handler to overwrite ->events for an internal purpose,
and callers may expect it to be unchanged, as sysrq does here by reusing
sysrq_handler.

-- 
Ned T. Crigler

> 
> > The additional authors / maintainers have been added to the recipients
> > lists.
> >
> > I hope I didn't overlook any pending fixes.
> >
> > > --
> > > Ned T. Crigler
> >
> > Cheers,
> > Chris
> 
