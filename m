Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C904509EFA
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780031; cv=none; b=cKsHcet11x9YIXpfI0enr/C+xGIdxJBZMKtXYu84BMdZw+SL9r1O4mkB5UyF+Ax8NnXWtXPrbxqhLT5wxQAI6RakVoZ4S8pL3sombH981gfA4XZKhgxGOq5NWGzGoSt1VBhIt08EBMS+5bx9j7CKszPJhnP11KutpeAvbiZNmSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780031; c=relaxed/simple;
	bh=JZyE0TSsY8yTDDRDYQK5DaOgzrr/7j8+8yrGGTSByWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfvbzqFIDfjetD3JUJ87n8534u9c4jjjsm+sYFYWDICWi17GfeX2+POdR5qakAFpqSUBbuncTFVNWYwGmZ0Y1PjTpnCiKAOn4p6accajUSnQ2Cyl0LlVoxefFCM16SiW2tXBfBkhXABJBUebyFwhBs20sRsWOesZ291Gm+YGI0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyRuf0VF; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyRuf0VF"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0503e39fso206458f8f.0
        for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780006; x=1791384806; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zdfU6kH9W4A1u2b61CrKgFGeF1s5pIwREN6zM1W5nY=;
        b=HyRuf0VFD/FGqAle4GCLdc2Jxc4MFEf6CupIDFXt6LeppCKt+6xPnVlDabAXZnbz5p
         6UHqPS2pTQhB/KtOOtrMRHSLecSdLu2FvKQKppS2wwkWqe0mTSxxNxAZFlL0Gnt0sLf2
         Y5Ludyf8SFr6pE4LntTjicZd3DxC+TXCyqpeu/uZhRKQ42Rv3m5E2LOBoiBLgLlepcDo
         fhFyOX5GMKJb8ZSH+jRK0K8XZSIpGRNsOb2drX3gN93883ZQiopfWHYUZCvcqRohZ63G
         b96TTIpC4olZdI/C7ZmC7i9V/KW2zZas8hXIIdkzOzzaWQjDoEPdORUdAb1V1JuMo6bf
         qa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780006; x=1791384806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zdfU6kH9W4A1u2b61CrKgFGeF1s5pIwREN6zM1W5nY=;
        b=e3rbEZCkNVhdb7XLDJaQXFx2fINOP2HWx3MPx+YMKmjrP/1AWbWprTLJ14NZBcAX3a
         RKGTr1Tlbs92e0yIsRb3OS26gc0UOWTmSm4tG/wLiUGZdvXQiIzeHj5W4dO6/fEda1hv
         YSO6aXeCgs8KdQ9eAxmvTDaoz4Bp15763jcg0V2S0rvUGzWS8djcaiUA0aCg4FojlxtJ
         Wa3az0mRCHahQNQBSKC3KJ293LaHA+BZk/4YyefffB/VvVxvrSqA4qAqeK3otkOp3Ux2
         RxArGFFruxGJm8z1BiO0DJtMhbe54eFKQFecmv7CwVvn3NtkAJMSfyj6MZw6yE4ayaP+
         mBDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSBB3aknl6hB8JVgfhbJPwmHf/4OeOZ6aaf+vqoB9+Ig0CPerkDi0oN4UJSJzIQM0Frvs3WwV3j9yeaw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIQ7P5Mr5pTTqCQlzJBqO/0ODGm5JYQm0LKBvUWCDurK6nJr6/f
	NxYMqVR/pKgrT7X+GMTcHw+nhTluUe8fThJFxIMNP+kl2ylvUXIlt9e9
X-Gm-Gg: AYBFou2vWijuKcZLSipQCpZJrAkcVZuJTrP+u4sSUtwvh1rKnyfEu2vJ7NIxph+pP77
	2wwTSkG/Gg+JqzBL2yYUFZErTInXjdq7BwQqEvZKuvO5AslZXuhAlI2KwjNkzYY66lsJNBxFNp4
	S9DRbBveCWZCCbBu1k6IWaW2iGed/MCY9JLPsTTO+jkz9wYe8ExybQPttk+rxlAgNzeTTaYDBdE
	6aHSQgNlmtcutOtLojtOkcom9abL2gBZ8XsikfBTmnB9e28nC4Cmt+1TjBq5qRzqRL4WhXTAJP5
	cuYT+v1fardWdkI6pd01z3SvBE5v3k4ENoLoQJXs4iJvl9ynrXA9a43c95b6rP+CeJGYTS0s8RC
	3qL/CA+YEB5zayEBvwSLbYRccDH0mJ4vyJoRWeFRvJr4TuFbMrrZszRikDcuCAJW2i4C9Dr1sMB
	NRjJjek1mBDe7tsRmmxVhsUEyPtV2EvtVtS2FtTHNWUtgigX5cKVI2SrR2aeut1Ha5ENRs79K7X
	0ll0fM6XJiJh8oeOVRsp8akWT1BHdFA9g==
X-Received: by 2002:a05:6000:491a:b0:48a:f509:c22a with SMTP id ffacd0b85a97d-48b02380f7fmr3587230f8f.0.1790780006195;
        Wed, 30 Sep 2026 07:53:26 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b0dsm3897832f8f.25.2026.09.30.07.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:53:25 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 8B690DC07B3; Wed, 30 Sep 2026 16:53:24 +0200 (CEST)
Date: Wed, 30 Sep 2026 16:53:24 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Pinheiro <andre@pepdata.pt>,
	stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-input@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] 6.18.y: HID: asus: ROG keyboard 0b05:19b6 stops
 working after 56d1b33e644c backport; missing buffer size fix e82ae34af29e
Message-ID: <ar0iZO7lkEl888x_@eldamar.lan>
References: <14ed23dd-b171-4ffb-b368-5c717f56188c@pepdata.pt>
 <2026093029-elevating-pungent-b8ad@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026093029-elevating-pungent-b8ad@gregkh>

Hi,

On Wed, Sep 30, 2026 at 02:13:03PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 30, 2026 at 05:24:59AM +0100, André Pinheiro wrote:
> > Hi,
> > 
> > Since 6.18.49, the internal keyboard of ASUS ROG Zephyrus G16 GU605MV
> > (USB 0b05:19b6, ITE Device(8910), bcdDevice 0.03) can stop sending input
> > events. 6.18.42 works. 6.18.51 is broken. I did not test 6.18.49/6.18.50.
> > 
> > Cause: the backport of 56d1b33e644c ("HID: asus: simplify RGB init
> > sequence") made asus_kbd_get_functions() run for QUIRK_ROG_NKEY_KEYBOARD
> > devices too. That function reads feature report 0x5A into a buffer of
> > FEATURE_KBD_REPORT_SIZE = 16 bytes. This device answers with 63 bytes, so
> > the transfer fails with EOVERFLOW. The buffer size fix is in mainline as
> > e82ae34af29e ("HID: asus: fortify keyboard handshake",
> > FEATURE_KBD_REPORT_SIZE
> > 16 -> 64; its message says "Since the response is more than 16 bytes,
> > increase the buffer size to 64 as well to avoid overflow errors"). It is in
> > the same series as 56d1b33e644c but was not backported. v7.0 has the value
> > 64 (checked in the source, not booted on this machine).
> > 
> > Symptom (6.18.51):
> >   asus 0003:0B05:19B6.0001: Asus failed to request functions: -75
> >   asus 0003:0B05:19B6.0001: Failed to initialize backlight.
> > usbmon:
> >   S Ci:1:002:0 s a1 01 035a 0000 0010 16 <
> >   C Ci:1:002:0 -75 0
> > 
> > The HID report descriptor (1102 bytes, from sysfs) declares Feature report
> > 0x5A as 62 data bytes plus the report ID (63). The device matches its own
> > descriptor; the driver buffer is too small.
> > 
> > Evidence. Same physical device and USB host controller (xhci on 6.18.42) in
> > both runs, only the guest kernel driving the HID device changes; bytes read
> > from the evdev node while typing:
> >   guest 6.18.42: 16776 bytes in 12 s
> >   guest 6.18.51: -75 as above, 0 bytes in 12 s
> > 
> > Requests sent by hand on 6.18.42 through hidraw (HIDIOCGFEATURE on report
> > 0x5A), device re-enumerated before each case, bytes in 5 s windows:
> >   GET 16, no SET before:  7488 -> EOVERFLOW -> 0
> >   GET 32, no SET before:  7776 -> EOVERFLOW -> 0
> >   GET 64, no SET before:  8208 -> ok, 63 bytes returned -> 8568
> >   SET 5a 05 20 31 00 08, then GET 64: 8496 -> ok, 63 bytes -> 7920
> >   SET, then GET 16:       7848 -> EOVERFLOW -> 7056 (did not silence this
> > run)
> >   (an earlier run of SET, GET 16: 2736 -> 6984 after SET -> 0 after GET)
> > With a 64-byte buffer byte 6 of the reply is 0x83, i.e.
> > SUPPORT_KBD_BACKLIGHT
> > is set. So with the fix the driver would register the backlight instead of
> > failing. One or two runs per case, only this device tested.
> > 
> > Request: please backport e82ae34af29e (or at least the
> > FEATURE_KBD_REPORT_SIZE
> > 16 -> 64 change) to 6.18.y, and to any other stable branch that received
> > 56d1b33e644c. Alternatively drop 56d1b33e644c there.
> 
> That commit is already in the 6.18.54 kernel release, can you test the
> latest one to verify it is now working?  6.18.51 is a few weeks old now.

FWIW, the commit is missing in the 6.12.y series yet (but I see it has
been already queued for the next review round, thanks!).

We got in Debian a related report at:
https://bugs.debian.org/1149499

Regards,
Salvatore
