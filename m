Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CF9303A0D
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 22:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770417718; cv=none; b=moJsDXM9zIAIlIJlHAbdDqTKxp6tt2ePqmeeRVqjPYhYmeArQzoegy+iyPi0fxIbuMyy4mAPgyqucxbpQeiQdWnGpViNJcFAFnirhAV3b4zm3WcXkqPI1wCgDkPzXC5aeUsvLRkzH+5xyeDm2fK/POxKMqDXaNdFHnN+3LMEvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770417718; c=relaxed/simple;
	bh=6icuq1HqCjXTHsU3H7PDhItnS001COoVMC0scZGYRoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTqeSmMi2JJ7tne91IOnMQ2Z34C4sW4Oru7IEDtWBP1uw+SNE8BGwKovawVM3CtK2USWw9bjgHJFNImiTCuAh6LbGySq8+rRQimNN9SpqLWsZ6y06KGzi/HjY6MOgpxstbX1InXihdgiWaMSjOpfw+S38rbF8+RU1qsvohtmPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=EESSgc12; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="EESSgc12"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso18327985ad.1
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 14:41:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770417717; x=1771022517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbTioyKnkYFn3YmIZ+Irbz8xYrMm1V4XqCu/uXGzVWU=;
        b=I/SDLw6xdpXdar7d22XawrZ3Kd3YUKHFxaSyDrf55r7nlUvleroOgCLUtSHSTQMqHx
         ag/8TpgcBSUPpv70zmUvet2sYBmtYyxK3ZNiI272ew6Qs7lZrW8FrqxHbdW6uCG2wyP9
         2VqNUdW7iwj+/rS9GzPjwibU6vwkzuiiLeafd0XBiKXeeA9C4qMHM1D7CS/Ny6wqW3KD
         M/nDUZBbQ6qQYfPOttTzeOLhJRabhUepkVG1ptMxumTFS3Sv9YpXAJZdDwAs/BfCpEhg
         dzphzkcQ71AcmzUZKhOo6iUFZ88TSSmAv6x8naXflHhCBy6nVbu6zjdNdM46vyzGORSJ
         EZOw==
X-Forwarded-Encrypted: i=1; AJvYcCWLyBEs0C8793AnFG9XIlLdGIwU8lhzMyfB/I29kOfu+KYVtQf8HStP2eR6DZVNJSBv9Mys83qcJGJ//Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yylk2Sg2h2rp/sdyS1hvLoxlg18vhLVYw5UkE1RnHW34JDu6ATQ
	nhTqWbXqp/QeYQT9TIECBE1jzcffJ0j+1OXF+8akSF+x2jfFRp3Si6+acuGKwJOVkNDfXQLzpIN
	2Eo0OPjEYDLXZHabCd217yWfSMXr2IIruXLNvBC8TpNnD6ALK1mPFYZ+QhxyGFT0V3pqwYaCFwy
	ymZSr0nDJU5MXXqA8FA57I1CP3F9rJdB/d1omFXO3bIE1jKKlM1VqI1WSlECtHDSu3BtLr7Kgwd
	Vy6gDvj5F666/6XyFDMHw==
X-Gm-Gg: AZuq6aIL9+CVgV9HI6G8pm+tQlcUp/WDggreO3yWD4xkPE8bBNjDxW+Do04piXIRzRO
	lvxyUb3vlbcfSAmoDVEubM3Zx8Gx+x5gUVG/nBe4OUbkynZP6/lqQlufQ6BN0rHjg332vV2kxyn
	PNYo6h8Qp+NIXu7lKZl1fjlglXOhWxOqaZebikhtnpaDR2eVAKr/kTP93jV4TQ9ZdZPWiIFzwLI
	WFNZfLX7/zfjoBFmFSgLGARjuur5KuASWRkXxoXjkSf4vcb9TO7N3MCz7Q99G5AGfpbRRCIc/V3
	J1j75ieXSDXxi1+fiCWl7TWIjtWEKOhE2NKj2KBpK8aqIf1TTHyJPF4bV61dhpfKHWgMkqdKrzr
	WKgLuQYowh3kKsDITKABib4QTeLa5DgBmdMiqCpZYeP1HGEF0mDA3xrr5hkDMmjItNiaQimi2oV
	oTUQZIeH+/L8tzNlIQbWeob4W4EbIc91Cg45Pk1ZLWU/cAoShj8Ys=
X-Received: by 2002:a17:903:19c8:b0:2a0:f47c:cfc with SMTP id d9443c01a7336-2a9516d530fmr39112715ad.34.1770417717167;
        Fri, 06 Feb 2026 14:41:57 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a951a606fesm5116175ad.10.2026.02.06.14.41.56
        for <regressions@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Feb 2026 14:41:57 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b867a3988bso116947eec.0
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 14:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770417716; x=1771022516; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MbTioyKnkYFn3YmIZ+Irbz8xYrMm1V4XqCu/uXGzVWU=;
        b=EESSgc122Y80kFjjHe+Henb8JaTLvxhrho0XWr/4DHzTQqkkhYgUCtRNsm6lEC364h
         rE8sVSYQ1dS9I18HWa1t6uy5U9QTRd1zH8v0wfpgNMDN58AdNb9lJtvuJXA0Gbfrb1RL
         +Vf5LeYcIbUji1R4bIGyT68SS31dE3DV0MxpM=
X-Forwarded-Encrypted: i=1; AJvYcCU52GAawKnL75bBYSRLDOrNqxkKiUhXB4W92LA/42uq6jjPUOjfWc6DMuhdLbPMPeUtBa2YF1CxLmbSHA==@lists.linux.dev
X-Received: by 2002:a05:7300:d51a:b0:2b8:31e5:91b with SMTP id 5a478bee46e88-2b856830c4bmr2168977eec.32.1770417715561;
        Fri, 06 Feb 2026 14:41:55 -0800 (PST)
X-Received: by 2002:a05:7300:d51a:b0:2b8:31e5:91b with SMTP id 5a478bee46e88-2b856830c4bmr2168958eec.32.1770417714963;
        Fri, 06 Feb 2026 14:41:54 -0800 (PST)
Received: from [10.66.193.70] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3c7cbsm2649807eec.17.2026.02.06.14.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 14:41:54 -0800 (PST)
Message-ID: <a78c4922-e355-4b85-a1aa-9aa3cc3dfca0@broadcom.com>
Date: Fri, 6 Feb 2026 14:41:51 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@glx-um.de>,
 Thorsten Leemhuis <regressions@leemhuis.info>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra
 <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
 <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx>
 <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
 <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 2/6/26 9:19 AM, Linus Torvalds wrote:
> 
> Longer term, we should probably clean this garbage up. The whole "use
> inline functions with inline asm" for the vmware case makes zero sense
> to begin with. Absolutely nobody cares. This is not
> performance-critical code. We should get rid of those inlines in
> <asm/vmware.h> *entirely*, and just make vmware_hypercall_slow() be
> less of a shit-show.
> 
> Make that stupid switch statement in vmware_hypercall_slow() use a
> static call, and get rid of the idiotic calling conventions that pass
> in ten arguments, of which five are pointers that can be NULL. So
> *OF*COURSE* the end result is a steaming pile of sh*t because the
> calling convention is just a pile of dung that cannot be dealt with
> well.
> 
> So make it do something like this instead:
> 
>          // Called 'in1,3-5' traditionally for bad reasons.
>          // 'in2' was presumably apparently 'cmd' in cx
>          // and ax is VMWARE_HYPERVISOR_MAGIC
>          struct vmware_hypercall_args {
>                  unsigned long bx, dx, si, di;
>          };
> 
>          // Called 'out1-5' traditionally for bad reasons.
>          // 'in0' is returned in ax.
>          struct vmware_hypercall_results {
>                  unsigned long bx, cx, dx, si, di;
>          };
> 
>          unsigned long vmware_hypercall(unsigned long cmd,
>                  const struct vmware_hypercall_args *in,
>                  struct vmware_hypercall_results *out)
>          {
>                  ... do sane code here ...
> 
> and I can almost guarantee it's going to be as fast or faster than the
> existing crazy inline asm, because it won't have any stupid bad
> calling conventions.
> 
> Then you can have trivial wrapper functions like
> 
>          static inline unsigned long vmware_hypercall1(unsigned long
> cmd, unsigned long arg)
>          {
>                  const struct vmware_hypercall_args in = { .bx = arg };
>                  struct vmware_hypercall_results out;
>                  return vmware_hypercall(cmd, &in, &out);
>          }
> 
> and you're damn well done. Wouldn't that be a hell of a lot nicer -
> and avoid the existing bug just by virtue of not having that stupid
> and pointless "optimziation" where it thinks that si/di might be
> useful around the vmware call.
> 
Thanks, Linus, for the suggestion.

vmware_hypercallX family of functions follows the idea of kvm_hypercallX 
from <asm/kvm_para.h>. But legacy and variations of possible 
combinations made it hairy.

Having just one wide hypercall implementation and multiple wrappers will 
definitely be more readable and maintainable. Questionable about 
performance though.

I'll work on it.
We will also analyze the possibility of the backdoor deprecation from 
the Linux kernel side.

--Alexey
