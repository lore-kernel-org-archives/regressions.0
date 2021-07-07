Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E42D70
	for <regressions@lists.linux.dev>; Wed,  7 Jul 2021 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625667354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7TkRYJsDfarqXSn4EBmx0Hd12Melpzh3GqncamrRv0=;
	b=eL78irsKPKOtKpi7eK3/ww4MDKFXjWxdCvd61LfSaS6Bp05l497zI+5SMUVGG5/wkGaThi
	J6CyvTXtdehEfcFb3j9rwkS7TDV2V7h2v2E/bZDSGyDUu2IOojS2kGhaONjp2sI/G729nb
	lTjSPjMJUPjwl4hmMQNpCeNLxDpNvsA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-BQEPt2FqPHiHKcLCPNfwTA-1; Wed, 07 Jul 2021 10:15:53 -0400
X-MC-Unique: BQEPt2FqPHiHKcLCPNfwTA-1
Received: by mail-ed1-f71.google.com with SMTP id d17-20020a05640208d1b0290399de3a0eecso1508027edz.0
        for <regressions@lists.linux.dev>; Wed, 07 Jul 2021 07:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v7TkRYJsDfarqXSn4EBmx0Hd12Melpzh3GqncamrRv0=;
        b=kflWHI8ELKV9gpKUIA+6etMOrYKZPayMXHcsq5tD3qIry+UllEyV6h9GRdZdj2TqSj
         4WS04yHguKA4YPUX//tnFK0h9wbn1ES23H19d5n3VO2OTUvWdCK2GK52iE1HZ2EukhBG
         trhdI2i9hRO/0qtopVFAJoYb8JwJ+rzO8gaW7bMLDJZUNB8/uAj/SmjN0uwOItuRZNIs
         6QVPMBllOwR1MmlgCCiI1fUM5kHljXyGogJNTII4KVL3U2V0ScrpS57XfSPNDqYJBcWV
         dsMeK83HNLUQbPxh/VKiQxo6AtT1/hU9ogYXdVHs/69iBbqTWReOQbl0VCdYTFKMWyyc
         w8tg==
X-Gm-Message-State: AOAM532bsCLMpyRW7M++qfPQUvZQSD4tXMZkMTHWInXRE91yw125NNNK
	K3nf+8SXJFBcRGFMv8SuvPCumLQdIITbu/bVUEH6B6Kffhxg5ikl6ZVSRqRl2mKrBQca5Xe5oCY
	CoZYRdZ0YZ/064cUJ27dvJkF/eaVBFkI+slfLBhX2MAo+CbG4omA2MaYhzdILtxSxmlhGbMXy1/
	M=
X-Received: by 2002:a17:906:842:: with SMTP id f2mr24646150ejd.460.1625667351756;
        Wed, 07 Jul 2021 07:15:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxogJG5EZkoMMu8maydXHcDJhSX3aRBwefzb6CXUOxZgETiNeOxmsHGUhIROgdGHhgQ760dLw==
X-Received: by 2002:a17:906:842:: with SMTP id f2mr24646105ejd.460.1625667351434;
        Wed, 07 Jul 2021 07:15:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id zp1sm6983114ejb.92.2021.07.07.07.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 07:15:50 -0700 (PDT)
Subject: Re: [PATCH 3/4] KVM: x86: WARN and reject loading KVM if NX is
 supported but not enabled
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 kvm list <kvm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, regressions@lists.linux.dev
References: <20210615164535.2146172-1-seanjc@google.com>
 <20210615164535.2146172-4-seanjc@google.com> <YNUITW5fsaQe4JSo@google.com>
 <ad85c5db-c780-bd13-c6ce-e3478838acbe@redhat.com>
 <CA+G9fYsrQo3FvtW1VhXocY2xkaPLNADA4S5f=fBM5uqa=C5LYg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <40623553-310a-68f7-2981-f8ea9c7bd5b0@redhat.com>
Date: Wed, 7 Jul 2021 16:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CA+G9fYsrQo3FvtW1VhXocY2xkaPLNADA4S5f=fBM5uqa=C5LYg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/07/21 14:09, Naresh Kamboju wrote:
> On Fri, 25 Jun 2021 at 14:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 25/06/21 00:33, Sean Christopherson wrote:
>>> On Tue, Jun 15, 2021, Sean Christopherson wrote:
>>>> WARN if NX is reported as supported but not enabled in EFER.  All flavors
>>>> of the kernel, including non-PAE 32-bit kernels, set EFER.NX=1 if NX is
>>>> supported, even if NX usage is disable via kernel command line.
>>>
>>> Ugh, I misread .Ldefault_entry in head_32.S, it skips over the entire EFER code
>>> if PAE=0.  Apparently I didn't test this with non-PAE paging and EPT?
>>>
>>> Paolo, I'll send a revert since it's in kvm/next, but even better would be if
>>> you can drop the patch :-)  Lucky for me you didn't pick up patch 4/4 that
>>> depends on this...
>>>
>>> I'll revisit this mess in a few weeks.
>>
>> Rather, let's keep this, see if anyone complains and possibly add a
>> "depends on X86_PAE || X86_64" to KVM.
> 
> [ please ignore if this is already reported ]
> 
> The following kernel warning noticed while booting linus master branch and
> Linux next 20210707 tag on i386 kernel booting on x86_64 machine.

Ok, so the "depends on" is needed.  Let's add it, I'm getting back to 
KVM work and will send the patch today or tomorrow.

Paolo

