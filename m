Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8A339375
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787498282; cv=none; b=fyctr/hcuJHbU0q04H+vaqHFMQzDp8mWlKM1bsacXxvOeznLCE+neTrDxZq3PLyuURqIR1wtUPUo7e3hgnSwPCXZby1hvUx5CGAQN0o5zaGbNF5J1m19gkxUq91FrWUBCGACaKps7o87f0qH36QBfdjFSZw+P/ulAW5CLFMfatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787498282; c=relaxed/simple;
	bh=6lN12AIgQiPJz2Kow1rLb4w6YVrECt7pOuPq56ji09c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRqS1ZDa6wEJM9grCSSjaRW1G9+AZrraaj0Ao8XRHQlmAbMqALZ0nVukFSR6YAkdHblBqtRKxlW2vD0k5ncJJbdE9kRVDe81TZ/RQI66scY/0nV7oplcRTDmydKU248wnphBIs+LwR9VJ/Cyv9kXYNlHOpQvCptfi4O4UFPLzwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7quYc1W; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7quYc1W"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3043519a91.2
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787498280; x=1788103080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+kkSUH6z+rcpiejvViicwcB0HlF0dRs5GEUbWGBoZ0=;
        b=H7quYc1Wtcnfye5qi04Yi4dmA1RV/CNOfZL8McTSl/HCKeKXBtOgIcDd3bVlLZCpRV
         xDlAUU8luQX6GCs6ZQzLmu1X0hVfm9xW/JZnBm6EftEfW3bG9eeVx0IC7vJ7SHjY7FF+
         dkOmiEcvkL5h29tu9HogFBk9ajgACQkxjfe+OcGyUigIGlKgnrCr/I94XjVWetc+FSlt
         Glr90RO4u0MuRyJLcXpO04UUkmjdru4S9yLC2P558SDE7Vt6sor7LNLHnSjt9KcS9bFY
         tm5/57UqXoDRK6oYrboiBIN5tW7B13yexA09RexG0QSACc8L2OxubTQZssbRZB2eLfrG
         Ah7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787498280; x=1788103080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+kkSUH6z+rcpiejvViicwcB0HlF0dRs5GEUbWGBoZ0=;
        b=ZsoawkWXxyN6p8IoiILM/HxEtUI9eAZ+nEP6BRG5bn/0aEI7JUWwm5hjP6t7pxYxIw
         NhwjIelL52saY+1S8S1JWnaXj1AHhsS8kaeIXa3joZvs4Wtfkv0p4acn9Opncn3EO7Ss
         UvihkfIoNXY3C4IiLqmXw03W4ZOoTHjSeNQiqd88kA+Dy0xq/fxOuf20ldq7PI4f6YJg
         AxQ9IoCxwhbi04VeGBU24+KnU8kWB76nqnm1Z5sKutzIzAQseuc7wkCg78NlEQQCXJLc
         Bk3q0egS6FWINg0wdEv4vB20d4WWjeZUZlYlqeIAUGE+C+U0y++cOfjQ4NO0V77ZZnpY
         Le+w==
X-Forwarded-Encrypted: i=1; AHgh+RqYUTIysBI+EjMRgD5DMiOH25tE/7+WbAJCZHMYeVCIWQHESmNnyRjboPFAIxIa6Jg9cYwyeREQcHgBUw==@lists.linux.dev
X-Gm-Message-State: AFuF++kOWQBLV75Joo7oGpeg75e1ZAuwri0l2QDIriEMA6cH2WJRwSwY
	npaHQKl1riHcPdeAjtdabcpbGqHQxk1sBn/4YclP+mRqLZkKCl6nLpWm
X-Gm-Gg: AR+sD12m9iIjI2VvT7+rkf8OZ/LCp2HVd/kXEj1YtEGwhZ2K/6yTYoV8fFLE9FYojHy
	7bZV/CQ4tbeJMklvIV+X8e8n8cqCWBAHACDks7mvul/SpB6A4aVKxXBLSrApSjMexyVzP/xqbpR
	gS+/ny4wVz9VK+wiV6V52Lx8i1ogZSPjevQovjpw3FVkcJ1akEwG5KVs0r3up3mH61kkTTPMkQf
	98hA8QUamvVS8AeXyxi20EWbAd6wa03z4js0raXnzB04wWECD+TUsXeV3DrnAXQIHxxi0dh8aV9
	aKLmqdG9+FVR5ki8GreiPoEAJq/OxwnTzHbL9nzqjcpD63WnI/90xVnEnKgDffabMdAnFfAObXy
	O/7iONwAfW/EL/STvxu/t0OZiYGcNbi5DRlw8f5n/p6Nkce83VtxMzCLp10l0oiPG9gpkylQGxb
	5IuUx9lrPxYCgV4ScYdRcRjZB+IDF0L7GCYFs+BS+oG13WpvPSuPs4B6Tt/yiMCC5a+OiWCWX1i
	RzfVc4Ra6OAqZh+iLrI5gcpJYmgL+c=
X-Received: by 2002:a17:90b:3883:b0:380:540:d499 with SMTP id 98e67ed59e1d1-395def03e79mr20461038a91.6.1787498279919;
        Sun, 23 Aug 2026 08:17:59 -0700 (PDT)
Received: from localhost ([2409:40c4:10ff:376f:bea1:1f87:a96a:c2c3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm17786260c88.6.2026.08.23.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 08:17:59 -0700 (PDT)
Date: Sun, 23 Aug 2026 20:47:55 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <aosGtkE_diwVJJtB@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>

On Sun, Aug 23, 2026 at 12:36:55PM +0200, Thorsten Leemhuis wrote:
> that ticket apparently didn't help. And no other fix is in sight, or am
> I missing something?
> 
> Mathias reverting the culprit in mainline a option to resolve this (I
> assume it is not, but I'm asking just to be sure)?
I don't think a revert is needed here, we're just trading one regression
for another.
Commit 8f5b7e2bec1c introduced the 200ms hold for all superspeed hubs,
but it's only useful for external ones. Root hubs are superspeed hubs
too so they go through the same code, but there's nothing useful for
the hold to do there:
A root hub has no upstream suspended hub whose wake propagation we need
to wait for and xhci already handles late USB3 link training itself.

Also hubs have a 0 second autosuspend delay (596d789a211d), so this hold
is the only thing stretching the awake window.

and anything opening or closing /dev/bus/usb nodes auto resumes and auto
suspends the whole host controller, adb's periodic enumeration does that
so on the reported affected systems every SS roothub cycle grows from
~30 to ~235ms (from the dynamic debug traces in
https://lore.kernel.org/all/qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net/)
which makes suspend move from close() call into delayed work and results
in the ~1Hz stress loop described upthread.

I think skipping the hold for hubs without a parent device, i.e. keep TB
dock behaviour everywhere it matters, should fix this.

Patch below could any of the reporters test it?

Thanks,
DrEggCake

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index d92bf887739d..f642ea0c31dc 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1346,7 +1346,8 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 		device_unlock(&hdev->dev);
 	}
 
-	if (type == HUB_RESUME && hub_is_superspeed(hub->hdev)) {
+	if (type == HUB_RESUME && hub->hdev->parent &&
+	    hub_is_superspeed(hub->hdev)) {
 		/* give usb3 downstream links training time after hub resume */
 		usb_autopm_get_interface_no_resume(
 			to_usb_interface(hub->intfdev));
