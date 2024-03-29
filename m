Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1793C39AF2
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711700144; cv=none; b=avHqLsWn3yR3MsAI7NtUUGLz6bSlc/92/aaUzep09ajC3uotws4tFzJCilRc90rG6gXwB5HtfwRAQOVsw18iKWpx/w4XUIeIIWly2G70uAG9j3BKPL4Sh5+MRAg8lDLT6askzZe/ytMYj750SL0fewMsNT7N7wRDyE+ExlK9CdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711700144; c=relaxed/simple;
	bh=6n/QVOvkQ4BcV96xx2uONvGMr6jJ/2/o9PowaWsduw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gc5tMJOslEAJlpHg+XTZBdB4e6ldcBm+FTiXwUczEFqmC1GOKLlmkg62gbDDdNeL//HabS3lAiC4t07M4GgE2pmZSkzhFJY0nVXpZWF6WJPhVr0VbSVo3+N0iBi0itnf/NpZSQruiYFlqu8Ht1xSIXa17EgAoV6IXXKy8VN8H/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmMGBIcU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmMGBIcU"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a45f257b81fso193281366b.0
        for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 01:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711700141; x=1712304941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aSYngHOh0xu8jyBiYodXCsYFEDRn/f5k50FDMhmEvE=;
        b=kmMGBIcUZeZ/kCJWph/DfqZmewacbyJBB6wBI33aBiWySETG5hiZwVLHdLvTJe8FjS
         mzq0HcfhiQsB3nxMdX3mDZmwoNmox2nYLmpb9QeCkZPUQOUmbXfL60Xo7+B96IEOtVU0
         FRXJdyPy/Kw3qlXBbsmy83FK4FmSEJFrtGQtEdv8gh+6gHvP9RctNvEP0R8WesR9DffS
         36U+1+2NXptfpOqUQ9/yaPmEacOnVZzTnSqyJXAjbg5d43PusQJZVbjiO3k2gByHJ3cX
         yFlAOWk86dBtPpA1ZKtD7jab0uoLCJ/uhpkHT+ctOkHWgWZFywaRNBhGfMidIdlQ6Sdt
         EsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711700141; x=1712304941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aSYngHOh0xu8jyBiYodXCsYFEDRn/f5k50FDMhmEvE=;
        b=lEnVKE3l9PUCRq0R2jv7BTwvaKn59heHQ/kI/8kW66xPFmLfPKNDDEYxIdc1ymvHKh
         2oZCAoK6c/K1lKNySGlDdmLqYOdbhGYgSZNzPoJA8vAs9EfM/SdspDxZyeJbbnV6Veh3
         zco99160jANSM6bGPZLC2gpA2fpedDc3/B+F/w+1G5DxlqZtNec9V0fHTdWN7AuadBrt
         wAe+MldrfT4+t4OoRrOqkTIIi2kogeijuPRA0WvUxRvfURPpPTosx93YiITpPRhnWuwi
         zxEZz7fRtcsdvrHMqYJET8aEtfA/4AJCCOnPTcHgEtRkjHwnQ/bYtnN1Bcza4mEHAsxa
         rSCg==
X-Forwarded-Encrypted: i=1; AJvYcCU9nmOShROSf4oFNGGESmwZSzVfyD4YRfzmiSUL5Kd8qG6pJY+cFpd8k3V0+si6aqnGOSFLpSKl9Ku43pCcAwF7LzNJbjiYadcoHEc=
X-Gm-Message-State: AOJu0YzHOfDE0si1UPm7pF872k0XM8F2/lefP2wOkvLKK97sGJgPX1ii
	scSI6O9F9khP3P+6Xz6/c1zmYYoWJ9TZcYZnBv/iPp3m8huG6mTU
X-Google-Smtp-Source: AGHT+IEELZMCPR3A1dINqt8iO9RCrhHrkwiQEaavtjQTwB8Qqz2UuU9+b2g9bBKGsznMcY8kdwE8BQ==
X-Received: by 2002:a17:906:39d1:b0:a46:e0ab:40ff with SMTP id i17-20020a17090639d100b00a46e0ab40ffmr1193488eje.35.1711700140971;
        Fri, 29 Mar 2024 01:15:40 -0700 (PDT)
Received: from gmail.com (195-38-112-2.pool.digikabel.hu. [195.38.112.2])
        by smtp.gmail.com with ESMTPSA id s18-20020a170906501200b00a474d2d87efsm1646696ejj.139.2024.03.29.01.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 01:15:40 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Fri, 29 Mar 2024 09:15:38 +0100
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
Message-ID: <ZgZ4qlbncvxhboQ0@gmail.com>
References: <20240328160614.1838496-1-steve.wahl@hpe.com>
 <ZgZqhWoRZoq5tJoU@gmail.com>
 <47302624-6466-41a7-85db-f6872d58a4d2@pavinjoseph.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47302624-6466-41a7-85db-f6872d58a4d2@pavinjoseph.com>


* Pavin Joseph <me@pavinjoseph.com> wrote:

> On 3/29/24 12:45, Ingo Molnar wrote:
> > Does the 'nogbpages' kernel command line option fail on these systems
> > even outside of kexec (ie. regular boot), or only in combination with
> > kexec?
> 
> Original reporter here, using nogbpages allows for normal bootup, but 
> kexec fails with it on my two similar systems.

Just to clarify, we have the following 3 upstream (and soon to be upstream) versions:

 v1: pre-d794734c9bbf kernels
 v2: d794734c9bbf x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
 v3: c567f2948f57 Revert "x86/mm/ident_map: Use gbpages only where full GB page should be mapped."

Where v1 and v3 ought to be the same in behavior.

So how does the failure matrix look like on your systems? Is my 
understanding accurate:


           regular boot  | regular kexec | nogbpages boot | nogbpages kexec boot
 ------------------------|---------------------------------------------------
 v1:       OK            | OK            | OK             | FAIL
 v2:       OK            | FAIL          | FAIL           | FAIL

?

Thanks,

	Ingo
