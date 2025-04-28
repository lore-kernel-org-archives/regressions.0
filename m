Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C89A1FDE02
	for <regressions@lists.linux.dev>; Mon, 28 Apr 2025 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874143; cv=none; b=f02RfVRIc7kaoB+RmcaEKCzIPXzsqbwop1KGQDBX+4miIOeDzES+vwb6cqMqNVn48VFkm50NxnsKGpLHV9NiV8P5GDslGifxq64N1RmGdq0mv/65wzLORg8CfgT1x14ZvZMyEMYKor93aaJ3OnKXTPyI1ytqgMHVM+opsvy0tMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874143; c=relaxed/simple;
	bh=Itbp7clee2hvnWfOWGWjGxRJxSbIg8VzQq6yzzThnsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+s70NYOzVLWUYkt6EcjAJaVVjptP3ZnWYCR5wrVKbuxFrpQ0EGmtYK7tr4OsJksB9NzbpRIRFvSsrlWdnHQ92KBXR191lnONGBLyE1/GX1Jl39O9HgeSVXl3BGQIpovthVmncVhLQ6BttvWy6Cxgbn+z0VM5nCzM8RhgILWEZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsoGbl5e; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsoGbl5e"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74019695377so1240791b3a.3
        for <regressions@lists.linux.dev>; Mon, 28 Apr 2025 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745874142; x=1746478942; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXXB00A+dPp6J1rZLZ3Xtsxe/hEjJz2VYrs1MOq8CDM=;
        b=IsoGbl5eaVipWgnCcT0qerhz+qv8tDsZ/NtN7ecOkugSNYiBOqGouaLaNH8afYUvba
         qKEaQYGtmvFQH/ebLCKuzupor+5NVgMowXllXHuss4towDvnZdkH7M1tFdNzoELidupI
         +TqX9UmsmnBr6RyL/KUQOEq5s+q8QfdRehQOCCR95+A5v/2LMKxWriYRFOy4Rg3Iir+l
         RJLudQIUmpmAVurMtnzctnHAVm52ovGM42fsRkpbZDzqQBCJ7U8IGkq7ryOMGhN4oV2Y
         fnc8gboMc9Qv0ReJ1aKaKM7CUiuwKgJx9IE/7jso+0icLROHvG0+xI0ztgqVRvZovycf
         yqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874142; x=1746478942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXXB00A+dPp6J1rZLZ3Xtsxe/hEjJz2VYrs1MOq8CDM=;
        b=ldDj30xK2ynR2CgwpdbXdX1xnbuFe8diGB5X1Xm7e/wXrYGj624pIGSxsz+DuE1QD8
         KVI/18gAX25H/OOwda/dCIhadZrXyJulOg6v0PnrIXXGn0YLIPPo5ZDIm+pQtFOhtTMh
         BPAyYArmZtKnoR0Tf4t51Zt53w6Lim7kfcjgMPelYMNG9fEwaYDv2Rewz3FSyihFTGGJ
         Zc0B3OfIHf6iVVF+E1LS/2oXwEDfOeu/2JDtOphzSs941eavsHeZ3zUbHfSSmcJ8Xb6E
         Pb0MOZnfYF0EwXYW7Hw1ceIOKvVG9CAP4UHMshNg1Xuz+qSw2Ce0Jv7sIXiC3baLfzdT
         +0+A==
X-Forwarded-Encrypted: i=1; AJvYcCWFZwTsapXNGYqW9e3v0sNz2OA/gNmvgSKaiw4UndnitWkWwG8H0wckjFe58ZYye1GaMZQVsduFXJ9zmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq+wMyBfv9hyI4xQyJJd65G0P9XgBKdiARfU/mVhVt5pxtF6JZ
	FIiYmMsqkEZm0wIPl/pYYLH2eKmoqwRGs+oxoZ1qXjZ9lDeObisY
X-Gm-Gg: ASbGncvUhQjyD5AOQQC93Uj0BqUdMPpHhTOXCFPhrsgu24ieApiqIju0utTFf5zbPha
	x645o8oEoVq5cVBql7DZyPYOWQJpXipDlPLlQuWjG3kKHTmxfyC/WUM1WNk/RywJRA8k9PY/tbU
	YeGYsxyPc1v5FonpeyPWafKl1arKfE7WRsTq7gfe5MGhMHQIfoY32pKa37NE/UXDE52We9C8qG3
	DzFrMqL8rdL2j3PMDDzCmgIbFu20GtBA4xfn4wcUP5PZAt7P2m8HPCDlv33kitpldUt3+0Z8ks/
	9glW3l+KmJAEvXVZadUodbtxREJhr0ZeoEdQrXTNB0Y3
X-Google-Smtp-Source: AGHT+IGQzTQOkq544Fxw04oa9VgEQc7AcWpngUxeHCjtqSAJ/vTs9P8Z2id3ozh+5cNJhu5851lR7w==
X-Received: by 2002:a05:6a20:7f87:b0:1f5:8072:d7f3 with SMTP id adf61e73a8af0-2093e724297mr1426828637.30.1745874141571;
        Mon, 28 Apr 2025 14:02:21 -0700 (PDT)
Received: from localhost ([129.210.115.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm8484928b3a.167.2025.04.28.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:02:21 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:02:20 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: "Alan J. Wylie" <alan@wylie.me.uk>
Cc: Holger =?iso-8859-1?Q?Hoffst=E4tte?= <holger@applied-asynchrony.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>, regressions@lists.linux.dev,
	Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Octavian Purdila <tavip@google.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	stable@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] 6.14.3 panic - kernel NULL pointer dereference in
 htb_dequeue
Message-ID: <aA/s3GBuDc5t1nY5@pop-os.localdomain>
References: <4e2a6522-d455-f0ce-c77d-b430c3047d7c@applied-asynchrony.com>
 <aAf/K7F9TmCJIT+N@pop-os.localdomain>
 <20250422214716.5e181523@frodo.int.wylie.me.uk>
 <aAgO59L0ccXl6kUs@pop-os.localdomain>
 <20250423105131.7ab46a47@frodo.int.wylie.me.uk>
 <aAlAakEUu4XSEdXF@pop-os.localdomain>
 <20250424135331.02511131@frodo.int.wylie.me.uk>
 <aA6BcLENWhE4pQCa@pop-os.localdomain>
 <20250427204254.6ae5cd4a@frodo.int.wylie.me.uk>
 <20250427213548.73efc7b9@frodo.int.wylie.me.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427213548.73efc7b9@frodo.int.wylie.me.uk>

On Sun, Apr 27, 2025 at 09:35:48PM +0100, Alan J. Wylie wrote:
> On Sun, 27 Apr 2025 20:42:54 +0100
> "Alan J. Wylie" <alan@wylie.me.uk> wrote:
> 
> > That would be https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/ ?
> > 
> > I've just cloned that. I'll do a build and a test.
> 
> $ uname -r
> 6.15.0-rc3-00109-gf73f05c6f711
> 
> It's crashed. Same place as usual. I tried again, same thing.
> 
>  htb_dequeue+0x42e/0x610 [sch_htb]
> 
> Rather than a ping flood, I was running a Speedtest. Both times it
> crashed during the upload test, not the download.
> 
> https://www.speedtest.net/
> 
> Could running an iptables firewall perhaps have anything to do with it?

I doubt it is related to iptables. I will try some TCP traffic on my
side later, but I suspect this is related to the type of packets.

Meanwhile, since I still can't reproduce it here, do you mind applying
both of my patches on top of -net and test again?

For your convenience, below is the combined patch of the previous two
patches, which can be applied on -net.

Thanks!

----->

diff --git a/net/sched/sch_htb.c b/net/sched/sch_htb.c
index 4b9a639b642e..9d88fff120bc 100644
--- a/net/sched/sch_htb.c
+++ b/net/sched/sch_htb.c
@@ -348,7 +348,8 @@ static void htb_add_to_wait_tree(struct htb_sched *q,
  */
 static inline void htb_next_rb_node(struct rb_node **n)
 {
-	*n = rb_next(*n);
+	if (*n)
+		*n = rb_next(*n);
 }
 
 /**
@@ -1487,7 +1488,8 @@ static void htb_qlen_notify(struct Qdisc *sch, unsigned long arg)
 
 	if (!cl->prio_activity)
 		return;
-	htb_deactivate(qdisc_priv(sch), cl);
+	if (!cl->leaf.q->q.qlen)
+		htb_deactivate(qdisc_priv(sch), cl);
 }
 
 static inline int htb_parent_last_child(struct htb_class *cl)
