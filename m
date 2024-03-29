Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEA26A025
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 13:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711719045; cv=none; b=d3xX9GV7GD62b2v5rSc5stPaAqzIXZtwppWl2EIc2Jnb5Kphzrh4umDLJo7Ycx3moOdpZ9YZEXlgGUU6Moqu6EVqo0ATiTy+lqu3CMwvC0AU0SVkcLdWLJlN9j8WYHc8CLSeOZZ3Y8tFhZzIXtjlSXC8VcxwxGZ+QvjxhcTkscc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711719045; c=relaxed/simple;
	bh=WF2XgEs+0XF6N1klNHoSW4WcT2PR7Ikg5TSu/HBszLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxmwsUsJHKiqszhnHyyK8d+ed8WLpEBtRM7URrlEGPC1QaOXYAn4dp0QBYWhhOkrSPbb3bSIm1U+AT+W/whEjQ7H/81nGdsR8vnIWTXoohbNmBzxisUfUo2lY2dcQRTDCbwZ9Geu0gJYf5jpGPT0IoakHTk4kMOo+HMrNeT+m5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCvS8z54; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCvS8z54"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a467d8efe78so248075466b.3
        for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711719042; x=1712323842; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgauylSkuW/80aSrNllgj0l2yuKPPrlurUzNgnxWSgc=;
        b=bCvS8z54jcWAVL4v3uI0waQi4BMmIhUm2PysUeiwxPPI6xCCjahzk/Xy90Oy4HBfaO
         UML+Wkvj6tEXClM7ChuIFuAK1sy2rQh79if1JcfRrc+QW7QRoc8ot2FNdDYyHYruFV3G
         hhYkH8x/F1DIZs9IhspjcSIsWH+uNhNzgYgNld1UwgneOuQa36AuTK9Ffu5tC+C3JgXT
         WnmWjw2K1lyhCUmdZrmk+F4ULmkmPEWkzc7WP7gQGY44Xkci8gQakIEMTSzzTPvaix6b
         UUZKG8jQNvH0uh2t8IZTPKfIOQZevnQ0VJHaQmHv8Z6bBkGmLBA3j7gkiozpEb3mX5WI
         wYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711719042; x=1712323842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgauylSkuW/80aSrNllgj0l2yuKPPrlurUzNgnxWSgc=;
        b=fTqX+5uwOByGIUdW+5Q49eGNJe2Xn4kXXL8b6EsqCaTld0AeseB1kWRaJc6Nvy6FA6
         d36I5okoZPaMaJpofOy5HyE6Z4bOEIZjWKTatvlygvMviPlkP6/zIlkhRtQpNdTZ8JbC
         6heZYsZmoNRaIWcvyeJku0YW3d2QgfD9X0Y7f5X9zhEldMeTPsXoy30h8IiUFhL1cabk
         Edrv1IWKKvUb23nNc8CwXWWHvcGALmjpijILrH7xkdu916QQrHbnESKCCruDlKEkY6vN
         g/XTSAfXuKtTq3kWG2F2c1nNYjBSy4ofjPNJaZB6MG7PDE969j3qh+Cj6EzvURceKTsX
         I4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVWVavflLHNxaWh9BTlqwouleW+84TtCy3d1JcwczhSIeOhIRIarLvCIcBKqDVET8FvY6MaR6TNBSPouFVOndHNxpNOB3Ga+Kf3xvc=
X-Gm-Message-State: AOJu0YzUvIqKKe8nh5GNlBboy6D+OVqZyIGihIvB1acIx2OOUcCmURkY
	xO7r8n1+jY0A6I++Xs/DEEx0phIfiX33pxxNQ0O/EaTzzj3Le77v
X-Google-Smtp-Source: AGHT+IF5JrqI2j7OCOT9HREOTWey9jC+t3rdB4i9jzwW1DefulQFZI1SUrPVovQHYjjUzCAFC1PtMw==
X-Received: by 2002:a17:906:228e:b0:a47:38ba:d24a with SMTP id p14-20020a170906228e00b00a4738bad24amr1719224eja.18.1711719041396;
        Fri, 29 Mar 2024 06:30:41 -0700 (PDT)
Received: from gmail.com (84-236-113-97.pool.digikabel.hu. [84.236.113.97])
        by smtp.gmail.com with ESMTPSA id ae12-20020a17090725cc00b00a4e238e46edsm1781467ejc.223.2024.03.29.06.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 06:30:40 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Fri, 29 Mar 2024 14:30:37 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Pavin Joseph <me@pavinjoseph.com>
Cc: Steve Wahl <steve.wahl@hpe.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	stable@vger.kernel.org, Eric Hagberg <ehagberg@gmail.com>,
	Simon Horman <horms@verge.net.au>,
	Eric Biederman <ebiederm@xmission.com>,
	Dave Young <dyoung@redhat.com>, Sarah Brofeldt <srhb@dbc.dk>,
	Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Yuntao Wang <ytcoode@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v4] x86/mm/ident_map: On UV systems, use gbpages only
 where full GB page should be mapped.
Message-ID: <ZgbCfVPvWroCnGE4@gmail.com>
References: <20240328160614.1838496-1-steve.wahl@hpe.com>
 <ZgZqhWoRZoq5tJoU@gmail.com>
 <47302624-6466-41a7-85db-f6872d58a4d2@pavinjoseph.com>
 <ZgZ4qlbncvxhboQ0@gmail.com>
 <be5982f8-3928-455e-969c-1e4c419d80a2@pavinjoseph.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be5982f8-3928-455e-969c-1e4c419d80a2@pavinjoseph.com>


* Pavin Joseph <me@pavinjoseph.com> wrote:

> On 3/29/24 13:45, Ingo Molnar wrote:
> > Just to clarify, we have the following 3 upstream (and soon to be upstream) versions:
> > 
> >   v1: pre-d794734c9bbf kernels
> >   v2: d794734c9bbf x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
> >   v3: c567f2948f57 Revert "x86/mm/ident_map: Use gbpages only where full GB page should be mapped."
> > 
> > Where v1 and v3 ought to be the same in behavior.
> > 
> > So how does the failure matrix look like on your systems? Is my
> > understanding accurate:

> Slight correction:
> 
>    regular boot  | regular kexec | nogbpages boot | nogbpages kexec boot
> -----------------|---------------|----------------|------------------
> v1:       OK     | OK            | OK             | FAIL
> v2:       OK     | FAIL          | OK             | FAIL

Thanks!

So the question is now: does anyone have a theory about in what fashion 
the kexec nogbpages bootup differs from the regular nogbpages bootup to 
break on your system?

I'd have expected the described root cause of the firmware not properly 
enumerating all memory areas that need to be mapped to cause trouble on 
regular, non-kexec nogbpages bootups too. What makes the kexec bootup 
special to trigger this crash?

	Ingo
