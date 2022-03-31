Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EC07E0
	for <regressions@lists.linux.dev>; Thu, 31 Mar 2022 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648732497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkVYYDJlFWTMMc2Z6dX/dM28zN0J9Wa3+IVOAevA2cY=;
	b=bKgIsddZPt7q7y6G/2Ykhzcto85dDVP12+otrtwFNqCrD28kG1y3JWjVVliyaPz4TCb27l
	+m6Fw5v7zSWnm//RSUJIli/xwQD4y9rHx8Aq0nMhMNzJ9DVX1sRULnZykfyfU6KcayrqTp
	PUz5tx0ww+HWob5pZ1JC1WpaBgV1ZYA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-6qkXWvBtMtuxKseH6hfPHg-1; Thu, 31 Mar 2022 09:14:56 -0400
X-MC-Unique: 6qkXWvBtMtuxKseH6hfPHg-1
Received: by mail-ed1-f69.google.com with SMTP id z22-20020a50cd16000000b0041960ea8555so14922833edi.2
        for <regressions@lists.linux.dev>; Thu, 31 Mar 2022 06:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OkVYYDJlFWTMMc2Z6dX/dM28zN0J9Wa3+IVOAevA2cY=;
        b=grpa9/Z54uqfZ0cH850NSwbmfiwAX92+9pxxJJilIkTiEDRavupfVWyItu56qgaZT0
         54wK8zqwmy16Y5bX6cfoHnN4bpDfqmipz6xIz2JMb7nncNMxNgZuuRvNHY3QJgKJGti+
         BuIUyN1z/CSVlhtDPmbehb7NnbarXiU4hiJ6UsXxCi9y3mqS+jmaY9ZYXnfn1tI33SKJ
         nu0JFv18bO83AgPoEpJ8ME6QbN+ykAwKuR3UpSzTRnAlmKrqMA9K1zL5PsvikocN5s45
         Huyrkj4veBGVH1VNtyfi2AeRrMHv/YMUfiKcvCtxMw+ulmab+r4QUpY+1RgTAAe5lsVZ
         ZmDQ==
X-Gm-Message-State: AOAM531AmwEfELxoX3t8nz7C6FMr2FVZf652+QXj042SKmBuKYJbx6wZ
	GrPiOEoX+/hQqm0dD6daCptjDTRbKbK7KbWMNVvAwcBA4Z4Jl99+f06REgQT4iJMQwQfBapVA2j
	rqchH8iVoiN7cfpXeVX/sxXk=
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id w7-20020a17090652c700b006cea88050a3mr4827480ejn.437.1648732494964;
        Thu, 31 Mar 2022 06:14:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQzDYHAQVupCNTQk/C9Em0Ge5tk+eDG8bVZlBMOj8UpAlVt/FON7lA8mjtW2a+kFCvkwIF3A==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id w7-20020a17090652c700b006cea88050a3mr4827444ejn.437.1648732494661;
        Thu, 31 Mar 2022 06:14:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1? ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
        by smtp.googlemail.com with ESMTPSA id bo14-20020a170906d04e00b006ce98d9c3e3sm9335197ejb.194.2022.03.31.06.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 06:14:54 -0700 (PDT)
Message-ID: <be9244bb-8004-05b1-9cb3-0e0852b6f712@redhat.com>
Date: Thu, 31 Mar 2022 15:14:50 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [next ] x86: Assembler messages: Error: invalid operands (*UND*
 and .data..percpu sections) for `+'
To: Naresh Kamboju <naresh.kamboju@linaro.org>, X86 ML <x86@kernel.org>,
 kvm list <kvm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 regressions@lists.linux.dev
Cc: Li RongQing <lirongqing@baidu.com>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
References: <CA+G9fYsaUWL4MfkmFJGyZ5WRjibieSLE1V1R8OPsWNmjeYWyUQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CA+G9fYsaUWL4MfkmFJGyZ5WRjibieSLE1V1R8OPsWNmjeYWyUQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/22 14:45, Naresh Kamboju wrote:
> Linux next-20220331 x86_64 build failed due to below warnings / errors
> with gcc-11. build log link [1].
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64
> CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> /tmp/ccS5DmVa.s: Assembler messages:
> /tmp/ccS5DmVa.s:59: Error: invalid operands (*UND* and .data..percpu
> sections) for `+'
> make[3]: *** [/builds/linux/scripts/Makefile.build:289:
> arch/x86/kernel/kvm.o] Error 1
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Fixed already, but thanks for the report!

Paolo

> metadata:
>    git_ref: master
>    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>    git_sha: fdcbcd1348f4ef713668bae1b0fa9774e1811205
>    git_describe: next-20220331
>    build link: https://builds.tuxbuild.com/278RMAf1jcRHx7LwzjCMgFSMMLt/
> 
> 
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> 
> tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-11
> --kconfig https://builds.tuxbuild.com/278RMAf1jcRHx7LwzjCMgFSMMLt/config
> 
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 
> [1] https://builds.tuxbuild.com/278RMAf1jcRHx7LwzjCMgFSMMLt/
> 

