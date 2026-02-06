Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907BE2F5311
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770419330; cv=none; b=WzTGheduGQCvJ4fp8KEx+oMQLeLAlxemtMHJocmPfiOkRd0bwfsPiZ5IGkfTlEEeaSSTcIgt1EPq0p7yS+lOEUS3tSX7MzIpPOsxlM2xbvi1PhKtg7sB8W7ZQHRa0PG6hFrkxBFk1n5JULzTF12rqKdE3QTFW9MoRe05EauYtKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770419330; c=relaxed/simple;
	bh=wAJF1MKQ1DXlq9sxo9S2orkHRVMS8LF++n2Ny8ivFpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mcsedy9e3367vyZILDyWAhLMymfhAolgo1SzECnawUEHeCqWCQr4xFhtkURog7+/O0BxwnHp1gNx85yQiSF15ia2VVUcJtnSw9qrPpDpB4OTm1S6voIGVrXLjOxd0Pf337sz8ERkgW6tB6gLCKPgwz3AAd/pesVV2l2xNMOb78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Z3ikHR97; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Z3ikHR97"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so3527319a12.1
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 15:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1770419327; x=1771024127; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OtXE8RZmfmxPjNGLcpW/2Zow2Q656Zz/80oTM2pYNlU=;
        b=Z3ikHR974Yp9nzKq5Vkyojpx7VgJHwwWho3olMiDuGeVNTit32rUP5avAOe7cBJjMU
         1E9XLdz3RyRjXtQTZIz6+rtKdt0nUC6KtiTgU/mvcwI3xY8AQHT1j8Q101RkuVASxRJD
         21Nui1WqS/YuC17zRReSO4/B9+FacZgOf6IJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770419327; x=1771024127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtXE8RZmfmxPjNGLcpW/2Zow2Q656Zz/80oTM2pYNlU=;
        b=fgeQc2GmvAF8m3v66rhayuN+B655cBpPW6rgvrHDxDI0r4A8+48PPoS732X6gtMC8C
         2bDeYe9KvBJhAa9io6zJne7M/SybMgH4UncKBMqCLUsLvdt7iYbCfnAWL0utOWaJLDnC
         jlR6FTmUjQZ6kmo/G9Y3L43siVquwmBNjJTo+K0qxwVn7uRxOuBhl+nFkUAA+OTrAb7G
         m4ttHkNlgq+ngr8ZCTWd4X6ekw/wbOh4nq/f6rkKa8ASliyCZrg0XOcPfVZU20XH5YST
         Z32xwPLscgT/ufqrQGw/l8GB5/NpXsbf0Gc5Kyt68fvBvEpF1HGZFTcZfquaHvs6lq0x
         7FOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmgJtgoKq1P6F/XLwHqp+qZ1HqKYR30pMC/uX0wVgQG4nzyP7HhvSjcmMvyon3mJyk5dhRWd8wO5rKYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaI+NA3CS0daGvSPO1/Bii0lUrCVqHa21SfN/+QpF/1a+IDpf5
	BuyRkzwlfY6k2rZpvjuJ57dxr1p7PZh/BoAOwtha8EgYbyLZzR1tx6X9k9KVOCoXm3TOytHhN4/
	ubS6tIYA=
X-Gm-Gg: AZuq6aLhcPiNAFZ5Qq/1VCi63GP1byfeAzkLSRZH84lK8eKyP5hP8qWCH2He8HUIHSB
	9wFGLYLra51tPOpRpPsEP5KX5zQoepaHjxTGB4zHjFkU9fQEghY2ygkaOtx0SWOP4v90zxg8E08
	AQeMKD94gavTNkmowEfXB5/4eZ4q7LtRY9UTDcLXVQnoaI9nefj88u/1JN+yoVH0ZhmLfM0oSd9
	mmA4e2R5a/CCzTMz0RO6299wOrtp9NZymaT/mr5p/txRsae/HcvCvT0YNlqbTbnO6SWGfbyMmYl
	V0UF3rLjW5RxNKUBF5Iz3yTCcpY9NpMfWZ8a0kWgqhMqZt4WvCpkMue3fskISY20dwsg0cXwRDn
	KDNMTgFgcGpzKHk8KhL3Sw1e4YHCXCweKx79/vjR3Llo4YlUSzUXpScOdLa8fB1OHiAFff3PlIk
	hrRvuYZrdTzxjlv7cHpFyxKYxZ6O4Pzwn6QFZNcsfL5cuU1zfbqOeJyaFvTwk0
X-Received: by 2002:a17:907:3cc7:b0:b87:1839:2600 with SMTP id a640c23a62f3a-b8edf344224mr242043366b.33.1770419327325;
        Fri, 06 Feb 2026 15:08:47 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae6fa84sm116436666b.67.2026.02.06.15.08.46
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 15:08:46 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so3527293a12.1
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 15:08:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcFR+bBY1D7pPk9XgoQ2nZpBcy9jcl6o9bGY98nphgHysDubgUbKNGJL/EKh/RAMaNkl5dvkGM489ZbA==@lists.linux.dev
X-Received: by 2002:a17:907:6d0f:b0:b74:984c:a3de with SMTP id
 a640c23a62f3a-b8edf25a954mr244436166b.28.1770419325164; Fri, 06 Feb 2026
 15:08:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info> <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info> <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx> <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
 <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
 <2aoadlgueumiq6hf74baskvk5eomsil7jfsxg4vf4ofaggbecl@7seilp4ou5nl>
 <CAHk-=wgeoGrqgd4n7CntnF8hCPr3qvVVgzF7evhacyqstByYmg@mail.gmail.com>
 <nchtwtwjqwm444au4rsojawomqslolr3hb4ao4rwsi3t7hqawe@ktggphxq2rhd> <CAHk-=wjzFZMAoJkrOg7LWsQcVOuZhOgMFWGC-sBHOACE8B4+Mw@mail.gmail.com>
In-Reply-To: <CAHk-=wjzFZMAoJkrOg7LWsQcVOuZhOgMFWGC-sBHOACE8B4+Mw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Feb 2026 15:08:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjEwfcj6DWWh8mKr+O4ospkfNSC1GAvAcwfWAUAyTRq5A@mail.gmail.com>
X-Gm-Features: AZwV_QiBOdpYkjMXXL7sSkIyl88VhzgGbYM2au8EUcp6sUXEJMG2nEyuTyAUHac
Message-ID: <CAHk-=wjEwfcj6DWWh8mKr+O4ospkfNSC1GAvAcwfWAUAyTRq5A@mail.gmail.com>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@glx-um.de>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ajay Kaher <ajay.kaher@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Peter Zijlstra <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 at 14:38, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'm going to change that commit message to make it clear that it's a
> QEMU bug, plain and simple. There's no point in claiming this fixes a
> kernel bug when it's a pure workaround for a bug elsewhere.

I have created an issue at gitlab:

   https://gitlab.com/qemu-project/qemu/-/issues/3293

and hopefully this will get fixed in QEMU at some point.

Adding Paolo to the participants, since he presumably knows what to do
with qemu, since he touched that qemu file a couple of months ago.

(The fix looks trivial, as suggested by Alexey: just change the
"uint32_t data[6];" to use target_ulong instead of uint32_t, but
somebody needs to test it and maybe qemu has other rules for register
types)

              Linus
