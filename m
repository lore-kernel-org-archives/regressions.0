Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5428F60874
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 13:39:22 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64d3e5e5980so1023920b3a.2
        for <regressions@lists.linux.dev>; Wed, 24 May 2023 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684935561; x=1687527561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPsAoeioL5fBV6oESCE3p4zCum2vadqzjSJd4gAo1As=;
        b=UerkxAe1cuAxMa0tMwzHRnm4yoFoo00xmDBj9EJfjTIpxnl1u9y/hQqnjm8YEhVTT8
         MMUWAqbxySMSY+RpXGj5k7H2lEU5qkq3UiFziaJqOIZHRGjSQL5ihhcNaJf5my3W5Twk
         fiIwWjmlRLOgCf5ICcpGIxE3vlIEqiIzZsIbie8lsr9T41dAEasU1oKiTlkgpEcKE1aS
         nAKi6S1P4xSLNyKwAUctQiHvx3FZ3W0uVxsNKW3fe1hTf6pDPTRSXwVuYAJOKhUxnoop
         Rpl+MgcRgmRRD3DkGdSnUJCMBT9cr9nqhVXPAbQPOt+uU7HrcDIizGzIC+jz1kzQlk/H
         58oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684935561; x=1687527561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPsAoeioL5fBV6oESCE3p4zCum2vadqzjSJd4gAo1As=;
        b=gqqF2AyJOkiCQ0nzunSCBYGtMAnoA74sqKjhECIvwPI5IYHVKfcBjOinUv3QPsWXXb
         Bp8YYLeG6Yjafsr7+UVpJ+RjIFJ4EI65QKw6j71ec6eIcEgNCOoBpVbHALHgibuBO5lQ
         tsJ3xvII8RoLk37UpHmFQc+1KZfoReD+eY5Cx7LSfyYZ4phr/pscYcEbfaqU4UgtcW/j
         zBWU7dTD63l2280UHcCZxwedpIJWPb3UH4VSD8dCwUv3mM0hgZ58UfcG5CosVhwjWubX
         vAQO2NXy1Dqnj1Vdm50S1K/dHZtz+NDQaIV0FQmf4o1LpdECjg/z9RUl8Vg4z8izZigx
         sNHw==
X-Gm-Message-State: AC+VfDxlJKyNp7sQ953vPoW+nElK33XA/ZnRrCLQlpqKVJjTedM3flRv
	LTvuotTSeqUmAKEzHLF+l88=
X-Google-Smtp-Source: ACHHUZ6+4ecfLPKCvweUFLek2AuikwAHHFdmp7lDN93yiPKuONCVLxG+xoNnfueMOPPVRsYfibfDxA==
X-Received: by 2002:a05:6a00:b52:b0:64d:5f1d:3d77 with SMTP id p18-20020a056a000b5200b0064d5f1d3d77mr3858529pfo.34.1684935561609;
        Wed, 24 May 2023 06:39:21 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-11.three.co.id. [180.214.232.11])
        by smtp.gmail.com with ESMTPSA id y4-20020aa78044000000b0064928cb5f03sm7461051pfm.69.2023.05.24.06.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 06:39:21 -0700 (PDT)
Message-ID: <5df92692-296e-3956-24fa-2bd439337953@gmail.com>
Date: Wed, 24 May 2023 20:39:16 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
Content-Language: en-US
To: Doru Iorgulescu <doru.iorgulescu1@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Zi Yan <ziy@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Disha Goel <disgoel@linux.vnet.ibm.com>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
 <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
 <CA+39qUjOA53UO4oYOzrUJqdYq8A3hbnnxpSV8nfqh0T5KiNL9A@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CA+39qUjOA53UO4oYOzrUJqdYq8A3hbnnxpSV8nfqh0T5KiNL9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/24/23 20:11, Doru Iorgulescu wrote:
> Glad to hear it! 
> Thank you

tl;dr:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
> 
> A: No.
> Q: Should I include quotations after my reply?
> 
> http://daringfireball.net/2007/07/on_top

(IOW, I have no idea what you're referring to. Please stop top-posting;
reply inline with appropriate context instead.)

Also, don't send HTML emails as many mailing lists (including LKML)
don't like it.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

