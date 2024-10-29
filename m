Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED32179A3
	for <regressions@lists.linux.dev>; Tue, 29 Oct 2024 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730163501; cv=none; b=X7dcwSve9QbJGtUx3wM77WfzbSTAY5WXRM8GgfXDjgxiZue0MM1KsimfyI53k3AmVVPU0lJoMIpabRDGXGYJR1OB9T9ev29YvyNi7/RZ+wsfDqBoMDeW59a8u7e2FOaFDqjpZxdOinGgOWwiEZIQo16On0clfWsvzt59nWg8DFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730163501; c=relaxed/simple;
	bh=1kyf7Fk9chzenw5yQ1YXLu23G0X0466vF2K0pmQaCrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYkxiiT/zGW/pWoi3KOJ31uhIRjsAsLu8JpJmejsiNtCJBwNOLAG822QnMpRNnfEiyip4a7SJhqJQLqgwgN7u1zs6O+fVeZzmO2vDfA3AER+/jm+i1VdToqD6xhBrxg5wsqVnNDLnSrIzP4LQlZmWi52AHmR78yOdDvpD2EwVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lqi3g8bp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lqi3g8bp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20ce65c8e13so43042855ad.1
        for <regressions@lists.linux.dev>; Mon, 28 Oct 2024 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163499; x=1730768299; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eQH5NybP0JM5m01znf6CZiXSil2XuOMHch3kZGTw3pY=;
        b=Lqi3g8bpZa1aV1drsuI50U0WhAMEOjeUIWB2xCKl0NwhYlzLYWDohG8FDGgwtMvq9X
         qVKx7K3JptAM+octtiWhEC773Pns0KJGNB4T4EKCf5Ix/nxps5pw9eAPaPX80R5jUyFM
         /gGELaFroeZBDPy8ZONmYaF718Hf2pmlnrAuEW5+UibzlsVbAv+DMymldWtzDAeCsBPS
         DRsKPas7PZV70oulBmUs9O9dMseXRh3KwfiC6NgitJAjC8C/QUQ9zEzljhVjc9ZyS7tl
         zqmB280YhxIHesdyUvTs5Bt3MPoqjG9VXy9RfBxx2PW+WnCyUzueCzkxCTTtjeiXO61v
         vAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163499; x=1730768299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQH5NybP0JM5m01znf6CZiXSil2XuOMHch3kZGTw3pY=;
        b=BI2Z+2DjEnCYaL0IPPpxwHklyacYzXWEe30+WIjIL9Tr7qvNqzyYKiDvU0nN3dVflc
         YLzII3zzGLJLWFjeKJwU9msuVdSIPA42nYzXZnJnkkxGNtKaZgVIjJrTlvhFFJKgfZP6
         Y2zFW7ozGShA1XmYpzGCokq5eoUPWw7UIBzVMOkI7t5WmxwcEAZtLVA4Z1OcOZKPIEfr
         ritcqaS0s11EeN/xBwYEQocUWr+pdrjDCHI7z5IactK3RObJ+gUGNf2xtNbpV6OROdOC
         P2Kwv2eL4Zadnws+Bhp5QfNiyeJti+EcJeuQR1jcFD87p+L+m5MHRKMDs26OZmNCXkcH
         hKbw==
X-Forwarded-Encrypted: i=1; AJvYcCW2jXDe9bJILlHW7YeF9L4g7ymPL4tDb3yUCQd+J+iUMuZ6Tw94Z5OLwSPQMiXBlpciCBuj2lwvA8GjJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEKZrWfpWqm66a7jIbTNJUru+4BFb00m1yKMQjqkZjBXRhQ8xK
	a6GklNdKQ6cHGzpGKusmSppsO7vn4Rh5s34H/ENSyAfsNqzIOcEj
X-Google-Smtp-Source: AGHT+IHgPKhnUY9L1D/NAirFt2IqxS/2mDkQcu5b2mshk4XeMetiUFxhxCuBjseSiazIxfP2rMpxAA==
X-Received: by 2002:a17:902:f546:b0:20b:9547:9b36 with SMTP id d9443c01a7336-210c6ceaca9mr129309245ad.46.1730163498881;
        Mon, 28 Oct 2024 17:58:18 -0700 (PDT)
Received: from xavtug (2603-9008-1600-2265-a236-bcff-feba-a919.inf6.spectrum.com. [2603:9008:1600:2265:a236:bcff:feba:a919])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf84597sm55907715ad.111.2024.10.28.17.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 17:58:18 -0700 (PDT)
Date: Mon, 28 Oct 2024 17:58:09 -0700
From: "Ned T. Crigler" <crigler@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peter Seiderer <ps.report@gmx.net>,
	Christian Heusel <christian@heusel.eu>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Jeff LaBundy <jeff@labundy.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <ZyAzIddVgmyBa2ub@xavtug>
References: <Zx2iQp6csn42PJA7@xavtug>
 <69b6119c-3c3a-406f-9375-3e55fba9b732@heusel.eu>
 <20241027163744.2d396c61@gmx.net>
 <Zx5yIEZwT5SxzCTx@xavtug>
 <Zx8hfE2_3zXSTi05@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zx8hfE2_3zXSTi05@google.com>

Hi Dmitry,

On Sun, Oct 27, 2024 at 10:30:36PM -0700, Dmitry Torokhov wrote:
> Hi everyone,
> 
> On Sun, Oct 27, 2024 at 10:02:24AM -0700, Ned T. Crigler wrote:
> > Hi Peter, Christian,
> > 
> > On Sun, Oct 27, 2024 at 04:37:44PM +0100, Peter Seiderer wrote:
> > > Hello Ned, Christian, *,
> > > 
> > > On Sun, 27 Oct 2024 15:06:09 +0100, Christian Heusel <christian@heusel.eu> wrote:
> > > 
> > > > On 24/10/26 07:15PM, Ned T. Crigler wrote:
> > > > > Hi,
> > > >
> > > > Hey Ned,
> > > >
> > > > > It looks like starting with kernel 6.11, disabling and re-enabling
> > > > > magic
> > > > > sysrq fails with these errors in dmesg:
> > > > >
> > > > > kernel: input: input_handler_check_methods: only one event processing
> > > > > method can be defined (sysrq)
> > > > > kernel: sysrq: Failed to register input handler, error -22
> > > > >
> > > > > after doing:
> > > > >
> > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > > # echo 438 > /proc/sys/kernel/sysrq
> > > >
> > > > I have found that this issue is also present in the latest mainline
> > > > release and bisected it to the following commit:
> > > >
> > > >     d469647bafd9 ("Input: simplify event handling logic")
> > > >
> > > 
> > > After the mentioned commit a call sysrq_register_handler() -->
> > > input_register_handler(&sysrq_handler) with sysrq_handler.filter set
> > > will result in sysrq_handler.events set to input_handler_events_filter,
> > > see drivers/input/input.c (line 2607 to 2608):
> > > 
> > > 2596 int input_register_handler(struct input_handler *handler)
> > > 2597 {
> > > 2598         struct input_dev *dev;
> > > 2599         int error;
> > > 2600
> > > 2601         error = input_handler_check_methods(handler);
> > > 2602         if (error)
> > > 2603                 return error;
> > > 2604
> > > 2605         INIT_LIST_HEAD(&handler->h_list);
> > > 2606
> > > 2607         if (handler->filter)
> > > 2608                 handler->events = input_handler_events_filter;
> > > 2609         else if (handler->event)
> > > 2610                 handler->events = input_handler_events_default;
> > > 2611         else if (!handler->events)
> > > 2612                 handler->events = input_handler_events_null;
> > > 
> > > So the second call will fail at the check 'input_handler_check_methods(handler)'
> > > which only allows one method to be set, see drivers/input/input.c:
> > > 
> > > 2517 static int input_handler_check_methods(const struct input_handler *handler)
> > > 2518 {
> > > 2519         int count = 0;
> > > 2520
> > > 2521         if (handler->filter)
> > > 2522                 count++;
> > > 2523         if (handler->events)
> > > 2524                 count++;
> > > 2525         if (handler->event)
> > > 2526                 count++;
> > > 2527
> > > 2528         if (count > 1) {
> > > 2529                 pr_err("%s: only one event processing method can be defined      (%s)\n",
> > > 2530                        __func__, handler->name);
> > > 2531                 return -EINVAL;
> > > 2532         }
> > > 2533
> > > 2534         return 0;
> > > 2535 }
> 
> Yes, I did not consider that we might want to re-register the same input
> handler, thank you for alerting me about the regression.
> 
> > > 
> > > 
> > > A quick fix/hack for the sysrq case:
> > > 
> > > --- a/drivers/tty/sysrq.c
> > > +++ b/drivers/tty/sysrq.c
> > > @@ -1045,7 +1045,7 @@ static inline void sysrq_register_handler(void)
> > >         int error;
> > > 
> > >         sysrq_of_get_keyreset_config();
> > > -
> > > +       sysrq_handler.events = NULL;
> > >         error = input_register_handler(&sysrq_handler);
> > >         if (error)
> > >                 pr_err("Failed to register input handler, error %d", error);
> > > lines 1-13/13 (END)
> > > 
> > > Regards,
> > > Peter
> > > 
> > 
> > Thanks for tracking this down. It seems messy that the mentioned commit
> > changes input_register_handler to overwrite ->events for an internal purpose,
> > and callers may expect it to be unchanged, as sysrq does here by reusing
> > sysrq_handler.
> 
> Yes, indeed. I wonder if we can solve this by moving the derived event
> handler method into input_handle structure, like the patch below. 

Your patch fixes the sysrq regression, thanks for the fix!

Tested-by: Ned T. Crigler <crigler@gmail.com>

-- 
Ned T. Crigler
