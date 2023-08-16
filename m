Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A216FC01
	for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692193274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jN9TOD4A/0Qw8dNB02SZeeOMSlTj43nwfdVrkfW3Nrw=;
	b=EdefF9cxNksDJhAU7fQ3Z6KgTlgmZlMp4oM5+qxaTYQ87z19/Ky6Z5XmrTH0TVxI8yb1ua
	nEPKYBLQs30Hpsua2GeD9fJ/0cSTTharjxnJS98rnkmA8eDNgx3z8DHpS2V8pkPs90+Zk/
	v01mf2IqlihuxjvgTPUw7G4dwRAcac4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-wWA8jXHVNeGPe9Y1IAYH-w-1; Wed, 16 Aug 2023 09:41:13 -0400
X-MC-Unique: wWA8jXHVNeGPe9Y1IAYH-w-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-64742e2d873so13568706d6.0
        for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 06:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193272; x=1692798072;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jN9TOD4A/0Qw8dNB02SZeeOMSlTj43nwfdVrkfW3Nrw=;
        b=Jf9OiFdDAqUr0plRnxp8FfNYcML/hdGFWms4m9BIGH05565vX9N0BdE0y3wc5Kb9vR
         3KrJF7zV3Dm/N4vdb+rglwP+STnJdckbcb8oTp4qehBlkfb1WyiRSIsCdFBhYnykuI1W
         Nk0HurD+Ssm1MZtnMlTOROqTJatfyvoWnw1AKiv+r3wrwZ2NT1oGi37WAYQ+CC2C+ir1
         S4VmrwqxDYTD/qATOxpdY633yN9/f5P7T7uqNaJbEycspUXrAWnNLVPr4mzxXUPgxNri
         ZqryEaiY3tSb5lCPdjhdhyd+5wWjElXBljZQ1xZNi0ncHUfK6vgjjZpUWNLZ6bZA3ukl
         seaA==
X-Gm-Message-State: AOJu0YxBzMHEDuMc8QCXsEuIr9TMmWKG+LK5JfAyf9PO+wGSukWy/Grr
	D4vW3RPRePBoMlk1nUO/JJr0GCkIaYy5XVVa6QXr50JTDfbcuuCwJxu0pqVwM2cE1sNTJiN6P1c
	rFTqqVollhEiZZpstqE9Gb54=
X-Received: by 2002:a0c:f5c8:0:b0:635:fb19:2ebd with SMTP id q8-20020a0cf5c8000000b00635fb192ebdmr2093297qvm.13.1692193272092;
        Wed, 16 Aug 2023 06:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaHYffXAFhTd9CZKBPQvUZnBh/Jw60Onr4ZL78JsygR0WcnheSxJMVeodMGwp8PDoLFTRlaw==
X-Received: by 2002:a0c:f5c8:0:b0:635:fb19:2ebd with SMTP id q8-20020a0cf5c8000000b00635fb192ebdmr2093286qvm.13.1692193271857;
        Wed, 16 Aug 2023 06:41:11 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id y3-20020a0cd983000000b0062ffbf23c22sm4844318qvj.131.2023.08.16.06.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:41:11 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Roman
 Mamedov <rm+bko@romanrm.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux
 Regressions <regressions@lists.linux.dev>, Linux KVM
 <kvm@vger.kernel.org>, Borislav Petkov <bp@alien8.de>
Subject: Re: Fwd: kvm: Windows Server 2003 VM fails to work on 6.1.44 (works
 fine on 6.1.43)
In-Reply-To: <87il9f5eg1.fsf@redhat.com>
References: <8cc000d5-9445-d6f1-f02e-4629a4a59e0e@gmail.com>
 <87o7j75g0g.fsf@redhat.com> <87il9f5eg1.fsf@redhat.com>
Date: Wed, 16 Aug 2023 15:41:08 +0200
Message-ID: <87cyzn5cln.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
>
>> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>>
>>> Hi,
>>>
>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>
>>>> Hello,
>>>> 
>>>> I have a virtual machine running the old Windows Server 2003. On kernels 6.1.44 and 6.1.45, the QEMU VNC window stays dark, not switching to any of the guest's video modes and the VM process uses only ~64 MB of RAM of the assigned 2 GB, indefinitely. It's like the VM is paused/halted/stuck before even starting. The process can be killed successfully and then restarted again (with the same result), so it is not deadlocked in kernel or the like.
>>>> 
>>>> Kernel 6.1.43 works fine.
>>>> 
>>>> I have also tried downgrading CPU microcode from 20230808 to 20230719, but that did not help.
>>>> 
>>>> The CPU is AMD Ryzen 5900. I suspect some of the newly added mitigations may be the culprit?
>>>
>>> See Bugzilla for the full thread.
>>>
>>> Anyway, I'm adding it to regzbot as stable-specific regression:
>>>
>>> #regzbot introduced: v6.1.43..v6.1.44 https://bugzilla.kernel.org/show_bug.cgi?id=217799
>>> #regzbot title: Windows Server 2003 VM boot hang (only 64MB RAM allocated)
>>>
>>> Thanks.
>>>
>>> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217799
>>
>> From KVM's PoV, I don't see any KVM/x86 patches v6.1.44..v6.1.45 
>
> Oh, sorry, my bad, in the description of the BZ it is said that 6.1.44
> is already broken, so it's most likely srso stuff then:
>
> dd5f2ef16e3c x86: fix backwards merge of GDS/SRSO bit
> 4f25355540ad x86/srso: Tie SBPB bit setting to microcode patch detection
> 77cf32d0dbfb x86/srso: Add a forgotten NOENDBR annotation
> c7f2cd045542 x86/srso: Fix return thunks in generated code
> c9ae63d773ca x86/srso: Add IBPB on VMEXIT
> 79c8091888ef x86/srso: Add IBPB
> 98f62883e751 x86/srso: Add SRSO_NO support
> 9139f4b6dd4f x86/srso: Add IBPB_BRTYPE support
> ac41e90d8daa x86/srso: Add a Speculative RAS Overflow mitigation

Sean's https://lore.kernel.org/all/20230811155255.250835-1-seanjc@google.com/
(alteady in 'tip') can actually be related and I see it was already
tagged for stable@. Can anyone check if it really helps?

> dec3b91f2c4b x86/cpu, kvm: Add support for CPUID_80000021_EAX
>
> it would still be great to try to bisect to the particular patch causing
> the issue.

-- 
Vitaly

