Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24F2398FB7
	for <regressions@lists.linux.dev>; Thu,  4 Dec 2025 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836581; cv=none; b=F8PU3mhTu24ektL9YMc2VpB9dRQOdhTRacbEdOka1GIK0fnoexQ+vwulmo0f9FUk85HWQMrUpvQSu7nHQHGlamBzyO0zr/+n0184s6aAQ46Z0zUhi7M/Q72d+50vwFKf+s/9krfu23qSluOWJa9rt2El8YJC+sv5bmCob1vvoMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836581; c=relaxed/simple;
	bh=kL3SQEfq6BJxShhFeHrcmbElw0/hAk4/Uf9gpJ3VKW8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTTRUt0NRepjh7B5lt2wNulTv41v9UF+Y1anVFZLOfFB9cJS+n/5rxULQxNqL3nYQEgx3n/4Wubj0wduMBobTNKVaEmBZykA4RD0SUy2G8AsI/ohQYvDP+WXfBeNxsp9cinJFuYfRqJgagwH9w445IDW1a2BpEqCHd6lOinc/Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCwgwSEu; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCwgwSEu"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7697e8b01aso117308066b.2
        for <regressions@lists.linux.dev>; Thu, 04 Dec 2025 00:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764836578; x=1765441378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF6zYEayclXc5CmIu5UDVJiU0M1nOODSxzsfbEcpTTk=;
        b=mCwgwSEu0thEJIBIFBDS2BKxEtPjftDACJ3btVAGVdQtXm8+janZbmpLvse9t3p5mm
         C+Ggoly1cS+YWqXFYLrkEnJg+DL9mCNnKt9OSS8KauHB9wePxeGsduFeRko422PRRTVF
         eDm8HejhUMQnh252P4fzcoooBT1uQGzCGPSOuxQkU0Z0htAR6vknz2jX2Yv80wLJUFeT
         nH3t9SbrmVnSNvuzSDP5slUDC6YAOLL/4wLhfECb5K7p8kym2I7cvIUXA9SCyVnLXlsn
         cmd2eyuecHrTvuFNDsqrT17kx8E4mF8QM8l3hFtCvDR4GZYKnfXql5KTDqGoTA+aBz0P
         z0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764836578; x=1765441378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xF6zYEayclXc5CmIu5UDVJiU0M1nOODSxzsfbEcpTTk=;
        b=R0OgK6saVdDP/qL0wTpw5uw5TKpIq2Vq/8WsTHtCnimh2P1Q7LJI/jua5qsaUvNIA7
         XaFxyLHnvNAehcNT1ztYPn4rLd0n6JF9zqZRZNFozQmL1opq055gpqge45sV3e569Hc+
         LxaO7PfH0DhQU/fA5w8Npghi7bg5td0PouEByUurY+38ErK67bolqcwwJxT6toRqwfu/
         JzV7KWU1NqtkYgZK1jfNiSyJ4R+QEM5x0YOKACQdS4/N8yxXH261YvxF+9iZBscEVtTJ
         PEAXPySjJrOzVpVm047VuaP8SkwpeiyGy05uJm7mp1ykdtMsd+SGILGtQw2fxa3CW2p1
         HQXA==
X-Forwarded-Encrypted: i=1; AJvYcCVglVguzU/RTZH41RqCKXyzlXNNgRuAwNKhV5zuwV1Om4I2jcjS7j3kc4DIYU/HAJvLpsXWL5G6UjXfOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHhm+ef1CsbDf7HBt1psDhlhf5WOmHtpJ1PpwEiRHTVAEfwrM0
	Ok3BnK2blaRnF1vzC5zF1iNsuo16Rc+47g4XgyxYPENLRj0FcyjPqCqy
X-Gm-Gg: ASbGncsVXgS7AdVOGpoxdS4olBJXO9IqqqDdIo5+PUQnhmo3r62qUNs4s1PCN54M0Lx
	qHdAPbPe4F44o1Zlms3QztKF+vH44x7o5P0krOCfQ/wL5pPci2GoZxPvyzspxqSn/C71oldENa7
	bcAiVgs6mcqWYOnx9PV25EORm7Y1mcc9xrWUH86MEbPJc6o9xyh1E9uokoIB5dN+a3kQumc/gv4
	ctKv+tRqB/hIEVI5RVvPLaVX8KaXfrMkCn4l+ufC5iNQ9fqdZvmnMjjAb7iGYu3dv6ReC2mwn4I
	jm25fgfdMdWXI3iqJ9yOW/BalWiIceFPLQBVAIoqs+mkGNLvH1M75N+0d0H+h/4uAgsmk1OX73s
	Q8DP5DoN7tSDYjTVukmQ6ICpmKMJYB9ctDrzA08WXZ+eImak1RkQ1xXRbRG3PteM7D0hNzwv4Ym
	K4lSRBIjqySJYzYKgkVGGt/Yo=
X-Google-Smtp-Source: AGHT+IE1o0xamSzizAJQO0MaXvNYOKirCtvorFJ68sjRV1qQI31jkst7apkZlAgVDuUInIgVfGdNSw==
X-Received: by 2002:a17:907:7f92:b0:b71:9c99:7b8a with SMTP id a640c23a62f3a-b79dc77dfcbmr501982666b.49.1764836577695;
        Thu, 04 Dec 2025 00:22:57 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975b94sm67464566b.40.2025.12.04.00.22.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 04 Dec 2025 00:22:57 -0800 (PST)
Date: Thu, 4 Dec 2025 09:23:59 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Forest <forestix@gaga.casa>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Stefan Eichenberger
 <stefan.eichenberger@toradex.com>, Pawel Laszczak <pawell@cadence.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
Message-ID: <20251204092359.134635bd.michal.pecio@gmail.com>
In-Reply-To: <3e4vhklrg4692n7hbh0pnrlhjkva68mk5v@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
	<20251118105929.330f0042.michal.pecio@gmail.com>
	<3e4vhklrg4692n7hbh0pnrlhjkva68mk5v@sonic.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Nov 2025 14:18:00 -0800, Forest wrote:
> On Tue, 18 Nov 2025 10:59:29 +0100, Michal Pecio wrote:
> >How can you know nothing is logged if the machine becomes
> >unresponsive?  
> 
> By watching the output of `stdbuf -o0 dmesg --follow` when it happens.
> 
> Same results in a GUI terminal, a text console, and output redirected
> to a `mount -o sync` non-journaled filesystem. I guess it's possible
> that something *tried* to log a message, but if so, it didn't get
> logged. 

This involves userspace, which stops working in cases like panic or
full lockup of all CPUs. So you may be missing some final messages.

If you have a PS/2 port, connect some keyboard and see if LEDs will
start blinking - this means kernel panic.

More reliable solution for getting logs from a broken system is
serial console. Maybe netconsole would work too, I have never tried.
And it seems it may also be possible to use xHCI debug capability
(but it needs a special cable: A-to-A without Vbus).

You could try CONFIG_DRM_PANIC, but it doesn't work on all GPUs yet
and it will only help if it's a panic.

Regards,
Michal
