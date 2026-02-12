Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7CD25A2BB
	for <regressions@lists.linux.dev>; Thu, 12 Feb 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770908055; cv=none; b=nIO1UvhrmZnOn0bH2Wo3g4Nfz2XmYkOQBGwepJHtVsFnfPpeBtT7GlTowalu9FoxoIgSbDNyOsi3STkgoiVuPTCTlVoc0mhGCBfIaDhfTgIxqmq0ojgDxPQrcNHY5Z6zLNLZOf0v9KMxzH5/OxrXHkNm9dqWJp3xAdOSGNh5DEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770908055; c=relaxed/simple;
	bh=wuAIXWkx2gAHAaX6D9x8Vg8b0hebVdkg36YmqWbiZbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTUMpd72RPHEV4gwVcZ5iJe1ls9vM8DlwwuEO289zxSkkwchlUWfdJ6oSajagFhVRlPZ/116m1WqLW+T6FYJDpiIJb8dlSJcZb+KcmF1RMcvFBLkGlYgIVPew73cv8t/xlgPb10cQXnhyUAzgD3YYQiCE5zAnGjt/u6prGQqbng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PcZNlg//; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PcZNlg//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770908052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9LgWCinJG2SVYHQN/tWZdYBngVOF3Voe4w3DgGJg+s=;
	b=PcZNlg//3+1bUA7ysaG67CG5Zjhm8K7yblM/gye3I4BZmxsERiDfTM5ObT2/oLOGiQiPG9
	j3oPC/aNRUM4E5A6wFLUx1NAxYBXJ81ZUk7DookYnRlYQ+dmEK+XtJWSf/61r7W46j7XPW
	oxghambp13AkBjH1t+YC6TUx6QMMnTo=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-CopWVAxCMpGX4o0mmdrKUA-1; Thu, 12 Feb 2026 09:54:11 -0500
X-MC-Unique: CopWVAxCMpGX4o0mmdrKUA-1
X-Mimecast-MFC-AGG-ID: CopWVAxCMpGX4o0mmdrKUA_1770908051
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948b0f4b44aso4137473241.3
        for <regressions@lists.linux.dev>; Thu, 12 Feb 2026 06:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770908051; x=1771512851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9LgWCinJG2SVYHQN/tWZdYBngVOF3Voe4w3DgGJg+s=;
        b=HaDnmc/RVZtoA27eIQAoD4QEHLyP4TfiLqUvwAHfYYNL2Mzgdagi4IEJTGY1QvOA0C
         44D5E2UxFNpV1nckhTyOBSt8Op/2oE/9vZGtWoV/Fq4kJFzfKRn8AB42N8SIA/LLaHLu
         i0L+KB6vQ0+5rv2Vn22fsXNaD1qF/VQX9dNsoQW4fcTOJiZWQHX0ppix2KU0vL47cjL2
         CsQpuUMBWMjzf26QKhIO1QWkgcWyUCwA2yFDWP94WIDFWztwWYrjv3MNXeWRGscMSuZH
         6w2n/GbwgNnGtbdoR8V6PXIMpyeu/Nyd+xGsL+abn1CEVxA7zI7/8ZdKJmr5sbvNrf8L
         0ytw==
X-Forwarded-Encrypted: i=1; AJvYcCX8C4/HncKuT1ryiEKuXS7Sfn8YIGVtJUErmk7MBSmMfC+77QwHq62KesgXVgmmySBRNUGIyBLVmzTMBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKF6yOiwi+mlelxrKMH6jLZ+RaqVNawg6N4NJCUDP3xEWb8YMc
	fIzIWTQwHAGWMLHtPs0bB22wp3cpAMk81t2fnkjpxxTmuekewI989J86I27Aonr7GUlpO3TSP/K
	xtAgcuYKnr+aTYMrzd8Cdz7X3Q3yD1LBoGzmCm9s3L7vLmBN2AIspWJdlhjiboEx9
X-Gm-Gg: AZuq6aJnCcNzzSgBg1JFRDD5b1XVdFzQoCBXYQwLVDXzmiPe5ZSZiFAY0C1hF8g0dpj
	RpfKghwqpofEEufm7ZWj+kWFUukF8KO12OIIqd761oMz05yT9pVcQT1REVtZvVU74YIL7GNdvLK
	zl0HF1khQQFBi+z3BAxKdVrdTuWxmAmE0P6bQnoeJLk2WCNhucTFfn30NUybnhB8sTMEGB7AfFf
	XlYgPWlUcAWuzeL0q52FVF0zlYrv9De1Uef1MB1ayUnOUZ14NrGN700aik6EkYDIn5OwCm7E7sq
	raPmWEWLOK7e4r3J9VQQJXYZI/CL/AAhF92JkGnInnfNmVZvIriNnf8CV973uabcSEp8ayDw2sY
	octxF2Aq68OITqC0Fn6hgLoLf73PmOZTzz+RJxgF3+BpuxCL/qp+wH4vhstobz9hYXZ8D1P7Q6K
	q1ba1okQBZ32NCbsQuYBub/J0GqNhRoeHEfHTxq9xiX8HpwrJhPs0=
X-Received: by 2002:a05:6122:3109:b0:566:36b9:ef3d with SMTP id 71dfb90a1353d-56759e9ae24mr869375e0c.21.1770908050867;
        Thu, 12 Feb 2026 06:54:10 -0800 (PST)
X-Received: by 2002:a05:6122:3109:b0:566:36b9:ef3d with SMTP id 71dfb90a1353d-56759e9ae24mr869358e0c.21.1770908048948;
        Thu, 12 Feb 2026 06:54:08 -0800 (PST)
Received: from [10.32.181.178] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.googlemail.com with ESMTPSA id 71dfb90a1353d-5674c24aed4sm1714659e0c.19.2026.02.12.06.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 06:54:08 -0800 (PST)
Message-ID: <726849ec-2b54-40a6-8b3a-ed88350c3779@redhat.com>
Date: Thu, 12 Feb 2026 15:54:03 +0100
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
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra
 <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
 <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx>
 <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
 <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
 <2aoadlgueumiq6hf74baskvk5eomsil7jfsxg4vf4ofaggbecl@7seilp4ou5nl>
 <CAHk-=wgeoGrqgd4n7CntnF8hCPr3qvVVgzF7evhacyqstByYmg@mail.gmail.com>
 <nchtwtwjqwm444au4rsojawomqslolr3hb4ao4rwsi3t7hqawe@ktggphxq2rhd>
 <CAHk-=wjzFZMAoJkrOg7LWsQcVOuZhOgMFWGC-sBHOACE8B4+Mw@mail.gmail.com>
 <CAHk-=wjEwfcj6DWWh8mKr+O4ospkfNSC1GAvAcwfWAUAyTRq5A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAHk-=wjEwfcj6DWWh8mKr+O4ospkfNSC1GAvAcwfWAUAyTRq5A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2nVLdlELjUmcUebg5qbontCzf3WSn3Ix9jfJIh_x29w_1770908051
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/26 00:08, Linus Torvalds wrote:
> On Fri, 6 Feb 2026 at 14:38, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> I'm going to change that commit message to make it clear that it's a
>> QEMU bug, plain and simple. There's no point in claiming this fixes a
>> kernel bug when it's a pure workaround for a bug elsewhere.
> 
> I have created an issue at gitlab:
> 
>     https://gitlab.com/qemu-project/qemu/-/issues/3293
> 
> and hopefully this will get fixed in QEMU at some point.
> 
> Adding Paolo to the participants, since he presumably knows what to do
> with qemu, since he touched that qemu file a couple of months ago.

Thanks, I have queued the patch; I will send a pull request next week 
and also submit an update to Fedora earlier than that.

Sorry about the delay, I was a bit busy with something called the "merge 
window"... you might have heard of it. :)

Paolo

> (The fix looks trivial, as suggested by Alexey: just change the
> "uint32_t data[6];" to use target_ulong instead of uint32_t, but
> somebody needs to test it and maybe qemu has other rules for register
> types)
> 
>                Linus
> 

