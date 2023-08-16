Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68332D52B
	for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692188854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijKYo6YIrYvwnBAnXfDfO1VnMtwxZii0rV5a4PpvoTc=;
	b=CYIjDrL0J7mhWg0lLuLzsWog4X4dgdpUFB3cbYrKjMtS79FKDS3SR8hLLnPoXFp/A+EShT
	IDifnpsQ60maFsdPW2OOMORXYaZAW4F+/8OUYAwE1UM26XpPlfqhKcn0Ws/E7qJ9I7rYq0
	87/xRl+RMlTSPLgwWlmDedeZpA1RJWw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-khdSlsm6PI2JfF4gYrvq-w-1; Wed, 16 Aug 2023 08:27:30 -0400
X-MC-Unique: khdSlsm6PI2JfF4gYrvq-w-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5236977ccfdso4542844a12.0
        for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 05:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692188849; x=1692793649;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijKYo6YIrYvwnBAnXfDfO1VnMtwxZii0rV5a4PpvoTc=;
        b=BMolae6eXyB8xEfZGF4qX0aMh1Y8NjimLzTHlUZNS7J90Fmqp9tOB9SNU1MANgwHZI
         FHJ6rYqBW01w2AwhR9O785q5NHwQyk5eFoduKTEIlRDNQp8Q8jfm5AiXWr+XuDHZwc/p
         jdfQNAKx6hXbipTIlgB0W0o94D9COr14dpVp8iFoZD2mB3z6xFWRkWntN/oL4m/u+Y4u
         jBxgrvm9pucH1+KKBIne7rN4L5jb9FU6DG+ehYb8dbh4oSkMhv7qC8bo0lkZXwq7WusM
         WdsRI1tDiz5/ZySVuc0cq83dDXCodbdDIy6AtDeJvFGsSDq5qLSNJp2DoFyP4ZUO3ift
         P/XA==
X-Gm-Message-State: AOJu0YxDxv/jsOP43KheqmXosxZRrriRWB0z1vxNLnfrpiiZHnCqZs0Z
	pu9OqJ6PszFVh3cz61YAhCR/9LVqKH4g53I+rzyzhEOydIYindTiL7f2c8PCH/YNo3ksS+k8S8C
	qACkW2Q0fOAp/nah7L7HmHHw=
X-Received: by 2002:a05:6402:31f7:b0:523:406a:5f6 with SMTP id dy23-20020a05640231f700b00523406a05f6mr1443603edb.12.1692188849185;
        Wed, 16 Aug 2023 05:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU/74XE/K5Jc7jA6BEqLvhuW4kSG78ZzyQI/ebU7QqsSkoPCOzbXSL5nsV7AciG7WH7ck9vQ==
X-Received: by 2002:a05:6402:31f7:b0:523:406a:5f6 with SMTP id dy23-20020a05640231f700b00523406a05f6mr1443587edb.12.1692188848862;
        Wed, 16 Aug 2023 05:27:28 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id o8-20020aa7c508000000b005255eec8797sm4365977edq.79.2023.08.16.05.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 05:27:27 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Roman
 Mamedov <rm+bko@romanrm.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux
 Regressions <regressions@lists.linux.dev>, Linux KVM
 <kvm@vger.kernel.org>, Borislav Petkov (AMD) <bp@alien8.de>
Subject: Re: Fwd: kvm: Windows Server 2003 VM fails to work on 6.1.44 (works
 fine on 6.1.43)
In-Reply-To: <8cc000d5-9445-d6f1-f02e-4629a4a59e0e@gmail.com>
References: <8cc000d5-9445-d6f1-f02e-4629a4a59e0e@gmail.com>
Date: Wed, 16 Aug 2023 14:27:27 +0200
Message-ID: <87o7j75g0g.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> I notice a regression report on Bugzilla [1]. Quoting from it:
>
>> Hello,
>> 
>> I have a virtual machine running the old Windows Server 2003. On kernels 6.1.44 and 6.1.45, the QEMU VNC window stays dark, not switching to any of the guest's video modes and the VM process uses only ~64 MB of RAM of the assigned 2 GB, indefinitely. It's like the VM is paused/halted/stuck before even starting. The process can be killed successfully and then restarted again (with the same result), so it is not deadlocked in kernel or the like.
>> 
>> Kernel 6.1.43 works fine.
>> 
>> I have also tried downgrading CPU microcode from 20230808 to 20230719, but that did not help.
>> 
>> The CPU is AMD Ryzen 5900. I suspect some of the newly added mitigations may be the culprit?
>
> See Bugzilla for the full thread.
>
> Anyway, I'm adding it to regzbot as stable-specific regression:
>
> #regzbot introduced: v6.1.43..v6.1.44 https://bugzilla.kernel.org/show_bug.cgi?id=217799
> #regzbot title: Windows Server 2003 VM boot hang (only 64MB RAM allocated)
>
> Thanks.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217799

From KVM's PoV, I don't see any KVM/x86 patches v6.1.44..v6.1.45 and in fact
there are only two x86 patches:

f2615bb47be4 x86/CPU/AMD: Do not leak quotient data after a division by 0
98cccbd0a19a x86/hyperv: Disable IBT when hypercall page lacks ENDBR instruction

and I'm pretty certain the later is unrelated; f2615bb47be4 looks like
it can, in theory, be related. Cc: Borislav.

-- 
Vitaly

