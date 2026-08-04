Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13844371860
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877405; cv=none; b=jVufBcDCRs5yKwhJFKP+P1pfToOibT2DAylKgnkInRf2x8Psg8VnrIFRIwR62PL+qc6sSaLTP4k53Gj1e/h3+8q25MreuJz5ID4ASSe1SsyHRtGFWgNaA+/Yru9aAjHuANlZcPd2bJkxJdhSbnsakFbcFj1wq2PZ3n9QCxZz5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877405; c=relaxed/simple;
	bh=Nq480V9rbVIvPogmTMvxGbvQhA45ynkBc7pX8U92kIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biXxVAuHnePM/F10ARN70dMmjfkp2g+ZfnxbJ6RIvBMBMTQlbEmEvK3lMerqrgg1xC4rcu7y9g2byFkYLMCwNbOkoiSYWgJYmVzukBHz8HuhbGVhRfkNZxKexqE072oqN2akULoM118P0g4Uy3XkH6SRnuNwHSAZa/qEM1MtW44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRbvRRfS; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRbvRRfS"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so94705f8f.2
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 14:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785877401; x=1786482201; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfqi+sPLHjcIbbi7QX6xu9XbeZElNtuKW90eUTRnvgQ=;
        b=DRbvRRfSrm+A8iUH0tETFc+3+tN341UTy5TFd6uyJDrdRjWXP7KtZfMqqtGF1BtkJB
         tDnxycXh6FtQzcMwvubHgKWxmgohpeBHYundQUeDeV6H7xH5W0KPaba65ogTC9KC76EO
         VPuA4uwCIScRjHdlol3Wz7qn+wB+WtIG7Y7t6DbZLzKZLYdR2XTJ4nUd6rJdX2G3tugT
         sgum1S1sBFVsSCZNFQGdhdGfeLKtXdrXw5K/6hFNkmoLrmIhvsvxjHz15F2mkvMlEmbV
         IgSNdLIIAk71AF9bpqtlqA7UP8/r6i5bj51s2qbDR2ZQQVqS0L1dwdxgJ/KuChy3gWlJ
         44SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877401; x=1786482201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfqi+sPLHjcIbbi7QX6xu9XbeZElNtuKW90eUTRnvgQ=;
        b=Nrl9N91Ht0GyRyq14qZSD7q8xwomW4hFu5ivQLGKbNRXdDDzj2Q7bztNutslryVYC6
         EPcu+5PjgQeVsERgJ8twV8cdUYL5WTP26S+sPfddb3VyFE+r1K05TI7ugFrSz9cwUSok
         WOKiEKVFuBU8BPc5gAKKFvuqpWUaljBIilnQZUAgQ4DGOtUuuAjTuFgRWYFKjr6iWCqh
         0JCvANjFPz/KAtskBfEq831qkAQYaa/uk+B8bizYgzrifGm5oGfpYNUkQHw/bWWC41n2
         p7/dwvxgrlTKVUKKceb/5c7emebs90zzAhMNsIbE9Upp6tIw4vcKUOAIKab0Cwn3eYYL
         zdiA==
X-Forwarded-Encrypted: i=1; AHgh+RpRz/n/xn6P5TdmGyQnWTDt5fvSO50p8yfP7Ws1Y3XhGK3op72fENXUyoz2JA62+lKnVKdcgOtaYwRlsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZHcP78BmYYTEBJ7fK6asra6h/zzMpXSeVQ2ahdE/IDOuyvV7C
	7tAICTOBsNtrfJuBmM57/qlFELZpTcCSZs+9U/hnIOSpJZptV4T3aroR
X-Gm-Gg: AR+sD13uCzrOKOWE3kWBXMEduf4uYRygV2zN4mTWM+5HrfDaKtbW54wC/TODUm/OHVi
	ZOvaTkw8xMNR7Z/ypOuttewPJLdNVZkUeP6pr0U3DsODXmFg2Zf0swtEIK4cklqsSgC6NA5fGAS
	nsE/EK8XLuqBxxJHzRkwY1NCye/TWIDoeuCa0m9nZjwrkzJQ1fqH/gdxn0aY4aPjXoe093whZoc
	EuQ/B9ra7AKXCEBKirOhn3nozgdyM0sysT8ksoFTwSfVeRmkDvLERaGeQ2HS57PNZkaj7JTTDYE
	8CufED6rZ5388XCRIu50AyO6eDB3fXuaVaJiMdbKR7c9K1uEPD8PccsYAkVMprhluJby8jwGQma
	rYQ6UaNlrZH5FZgUCjni3jGhDM8Gdbb6kFU9WSMKBxgyuW4e5eDGpC3KIe7+Mk2lRdjQ7WhGxPL
	N8pAvWrZ7NT3wODfLBxoKGvaVz5kTJrN7BDy1djOeF6zWSDPF+5XSA3jAIwmiXPCqtghXdjX5B
X-Received: by 2002:a05:6000:2486:b0:47f:80df:3ba4 with SMTP id ffacd0b85a97d-47fec62aec8mr3010273f8f.28.1785877401253;
        Tue, 04 Aug 2026 14:03:21 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:e13:1601:335c:b8a1:fe26:15c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda11csm2897658f8f.1.2026.08.04.14.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:03:20 -0700 (PDT)
Date: Tue, 4 Aug 2026 22:03:19 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>,
	"Berg, Johannes" <johannes.berg@intel.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] iwlwifi IO_PAGE_FAULT and Master Disable Timed Out
Message-ID: <anJTlyrKsASh9gZg@debian.local>
References: <amzVtgQb2p-_nShU@debian.local>
 <DS0PR11MB78800B96A0FE637DC5390E4AA3D62@DS0PR11MB7880.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB78800B96A0FE637DC5390E4AA3D62@DS0PR11MB7880.namprd11.prod.outlook.com>

On Sun, Aug 02, 2026 at 07:24:04AM +0000, Korenblit, Miriam Rachel wrote:
> 
> 
> > -----Original Message-----
> > From: Chris Bainbridge <chris.bainbridge@gmail.com>
> > Sent: Friday, July 31, 2026 8:05 PM
> > To: Grumbach, Emmanuel <emmanuel.grumbach@intel.com>
> > Cc: Berg, Johannes <johannes.berg@intel.com>; Korenblit, Miriam Rachel
> > <miriam.rachel.korenblit@intel.com>; linux-wireless@vger.kernel.org;
> > regressions@lists.linux.dev
> > Subject: [REGRESSION] iwlwifi IO_PAGE_FAULT and Master Disable Timed Out
> > 
> > Hi,
> > 
> > 0eaa1f245ac0 ("wifi: iwlwifi: mvm: don't support the reset handshake for old
> > firmwares") introduced an intermittent boot regression on my laptop:
> > 
> > [   15.974991] iwlwifi 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
> > domain=0x000a address=0xbe9f5000 flags=0x0000]
> > [   15.976184] iwlwifi 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
> > domain=0x000a address=0xbe9f5400 flags=0x0000]
> > [   15.978501] iwlwifi 0000:01:00.0: Master Disable Timed Out, 100 usec
> > 
> > The commit only contains:
> > 
> > +       /* Those firmware versions claim to support the fw_reset_handshake
> > +        * but they are buggy.
> > +        */
> > +       if (IWL_UCODE_MAJOR(mvm->fw->ucode_ver) <= 77)
> > +               trans->conf.fw_reset_handshake = false;
> > 
> > The if condition is evaluating true on my laptop despite using firmware ty-a0-gf-
> > a0-89.ucode. So I suspect this is not the correct way to check the firmware
> > version?
> 
> Yes, seems like you are right.
> Thanks for the report!
> 
> I am attaching a fix candidate, I'd appreciate if you could test it.

Thanks, the fix is working fine.

Reported-and-tested-by: Chris Bainbridge <chris.bainbridge@gmail.com>
