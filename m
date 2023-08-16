Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0AADF60
	for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692190883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNKndmkR86opFvoKrce1WVAZhxenGOmX/f8JaJm8XLw=;
	b=JOgFLHDf3n9H38DTClv9Ukn+adPS8AoNQYZZ5WoJJBQn/dCXKJD4dr9XeQbnooFYWl3rd3
	RP2snyxK0PJNxSpazy4sOAVdK7kWDH9nYkACNV07ea4aEoiySzYcGwiFPzrIp6y508cumj
	h9lPqMVfnLK9edbEeBmaOacO2g8GLRQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-rlDvivdFP9Oq4bfSzSKTlg-1; Wed, 16 Aug 2023 09:01:22 -0400
X-MC-Unique: rlDvivdFP9Oq4bfSzSKTlg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fe4cca36b7so42559565e9.3
        for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 06:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692190881; x=1692795681;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNKndmkR86opFvoKrce1WVAZhxenGOmX/f8JaJm8XLw=;
        b=bX4EZIsPsvoU4dYax2rA9Fb1ENvZNGl6BvFPuRV+q2btf6CsKPWDVEIXZeRgrpy5/b
         eiSjdrmtCxdwEI8ildg4rVOH9yNs1sU18i0CifZN/+Q1iu5xMhGawRyVGy6IIkbG1A81
         MSN5gkmm0/nQThKhPOfFpg5I7uT/UKuAd+JNMKw+zeSiJYs/CnpGEzqpYUG8dK4Xbd8K
         U9uh1xknx8dE4c/u8Ecdkzg3dmlr2wZOyTRaYuteDb6FwfOjr0S1B3CAvzYUJJQVqT3w
         hw95PS5+sRfM9wjUMCUJmjejwMitColntwM25psTJ2YMm1hPOc4xLaqNNx9ZZiXiwg5z
         QjDA==
X-Gm-Message-State: AOJu0Yxuvu8QnPd1FuGNfHmUX7oN7JAGnTDXj03j2y8Ni6aorehtfM8S
	f8dOXre5um3RXfYipnsPt3XdUIudvpuq8/fVcn0hW1yihvHG5EQIYVOj2gHx29eyXxVSE8R+5hV
	0/ERVQ3VvT3b+7CzS1Od9mmk=
X-Received: by 2002:a05:600c:218f:b0:3fe:1232:93fa with SMTP id e15-20020a05600c218f00b003fe123293famr1326957wme.22.1692190880887;
        Wed, 16 Aug 2023 06:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHro2DsR4SQTI6IvZjre+pOGodr4/FGLL/K8zQv9Q7hglPXttjWlCLsrsKKVYGjweqICWNDwg==
X-Received: by 2002:a05:600c:218f:b0:3fe:1232:93fa with SMTP id e15-20020a05600c218f00b003fe123293famr1326936wme.22.1692190880541;
        Wed, 16 Aug 2023 06:01:20 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id v14-20020a1cf70e000000b003fe24441e23sm21118140wmh.24.2023.08.16.06.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:01:19 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Roman
 Mamedov <rm+bko@romanrm.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux
 Regressions <regressions@lists.linux.dev>, Linux KVM
 <kvm@vger.kernel.org>, Borislav Petkov <bp@alien8.de>
Subject: Re: Fwd: kvm: Windows Server 2003 VM fails to work on 6.1.44 (works
 fine on 6.1.43)
In-Reply-To: <87o7j75g0g.fsf@redhat.com>
References: <8cc000d5-9445-d6f1-f02e-4629a4a59e0e@gmail.com>
 <87o7j75g0g.fsf@redhat.com>
Date: Wed, 16 Aug 2023 15:01:18 +0200
Message-ID: <87il9f5eg1.fsf@redhat.com>
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

> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>
>> Hi,
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>>> Hello,
>>> 
>>> I have a virtual machine running the old Windows Server 2003. On kernels 6.1.44 and 6.1.45, the QEMU VNC window stays dark, not switching to any of the guest's video modes and the VM process uses only ~64 MB of RAM of the assigned 2 GB, indefinitely. It's like the VM is paused/halted/stuck before even starting. The process can be killed successfully and then restarted again (with the same result), so it is not deadlocked in kernel or the like.
>>> 
>>> Kernel 6.1.43 works fine.
>>> 
>>> I have also tried downgrading CPU microcode from 20230808 to 20230719, but that did not help.
>>> 
>>> The CPU is AMD Ryzen 5900. I suspect some of the newly added mitigations may be the culprit?
>>
>> See Bugzilla for the full thread.
>>
>> Anyway, I'm adding it to regzbot as stable-specific regression:
>>
>> #regzbot introduced: v6.1.43..v6.1.44 https://bugzilla.kernel.org/show_bug.cgi?id=217799
>> #regzbot title: Windows Server 2003 VM boot hang (only 64MB RAM allocated)
>>
>> Thanks.
>>
>> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217799
>
> From KVM's PoV, I don't see any KVM/x86 patches v6.1.44..v6.1.45 

Oh, sorry, my bad, in the description of the BZ it is said that 6.1.44
is already broken, so it's most likely srso stuff then:

dd5f2ef16e3c x86: fix backwards merge of GDS/SRSO bit
4f25355540ad x86/srso: Tie SBPB bit setting to microcode patch detection
77cf32d0dbfb x86/srso: Add a forgotten NOENDBR annotation
c7f2cd045542 x86/srso: Fix return thunks in generated code
c9ae63d773ca x86/srso: Add IBPB on VMEXIT
79c8091888ef x86/srso: Add IBPB
98f62883e751 x86/srso: Add SRSO_NO support
9139f4b6dd4f x86/srso: Add IBPB_BRTYPE support
ac41e90d8daa x86/srso: Add a Speculative RAS Overflow mitigation
dec3b91f2c4b x86/cpu, kvm: Add support for CPUID_80000021_EAX

it would still be great to try to bisect to the particular patch causing
the issue.

-- 
Vitaly

