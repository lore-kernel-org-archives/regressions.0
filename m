Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F91910E3
	for <regressions@lists.linux.dev>; Fri,  2 Jun 2023 02:15:35 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-53fe2275249so964276a12.2
        for <regressions@lists.linux.dev>; Thu, 01 Jun 2023 19:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685672134; x=1688264134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XApgtkN2jCC5pzmqScCzReitzogZdYBuknqg9aRwaW4=;
        b=Je4uXOOXr5Iu0HBDznyQs/8vrgnYEJnSfl8pKC/3I4DEgRpOW8B/PjbPIyh81karbo
         t4KZWp7KlYnpYiqjZWaVkKNgl0Cr1wVcuh6hkMcbntLLcRqT47+QXekhckdh9L4Iwj5+
         ZnxGVipQ17ocROuiwwf5MpF6U3IGBBnm2Wg11G/B/cuOj0850EQQ2t1KVYF4IBZ0C+eN
         qoeCMCa2AokgnJJmQzR0X7iPwVYIJVOkMzP3INhp52cmZ+bEfHQyQgYZX0oYYZcOfC28
         mZUsbOFCORX1Uc2yziJ9blp6b6eMPNZnv34ay9kHCTF2GkGzju0RWznuDvOeN60sqEPv
         X+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672134; x=1688264134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XApgtkN2jCC5pzmqScCzReitzogZdYBuknqg9aRwaW4=;
        b=AInRwfYkMXiYoAYCNHsSvikVk48yP2Rn6Sox8rFDNez7XZ/P+yRcb02jk5G4Io/MMP
         3fjB2WK3rCURMJIUpu2ITZEyIyOHAmOVZSE9fBbH0ejk5pSGBlcWzu1ibrvaUzimGDCl
         +WDM7IdsCkelINFI8cgGphqeZnxr0+vYW1ZHPzNksaRqjGdDUFMYeosq5OzpXhrixVGr
         eAfIo042oaF4HNHPveyf8qDebYmvxZxi4eCyjhq/oIa6epGpyIDG1a8NCbnulKjWcNSQ
         mLRint4pahwxA3iQtdKdFHbL8JNyye8YhMx0dErDgK2Tbzx6tNeyEB1A3SGZV0PeGlxA
         xyrw==
X-Gm-Message-State: AC+VfDwkDZsESmX7sBi8WSgwght23PloIdqH1worvJbObz8bdlqChXjf
	pq2IJqi5J6cvHS3Uu+eM3nQ=
X-Google-Smtp-Source: ACHHUZ4IbqD5NoHEPFTuiYkAqTB2hoX7awrX/5FQVh9gjb+2PG+UajTM2aTqq5bq/8zMTHZ19VR8SA==
X-Received: by 2002:a17:90a:617:b0:258:9a26:38db with SMTP id j23-20020a17090a061700b002589a2638dbmr802342pjj.16.1685672134273;
        Thu, 01 Jun 2023 19:15:34 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-49.three.co.id. [116.206.12.49])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a0c0800b00256a6ec8507sm2163004pjs.19.2023.06.01.19.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 19:15:33 -0700 (PDT)
Message-ID: <74b8e4c0-a557-b047-4507-c243c9aad216@gmail.com>
Date: Fri, 2 Jun 2023 09:15:25 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: Started to get "memfd_create() without MFD_EXEC nor
 MFD_NOEXEC_SEAL"
To: Kees Cook <keescook@chromium.org>, Vlastimil Babka <vbabka@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Jeff Xu <jeffxu@google.com>, Daniel Verkamp <dverkamp@chromium.org>,
 David Herrmann <dh.herrmann@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hugh Dickins
 <hughd@google.com>, Jann Horn <jannh@google.com>,
 Jorge Lucangeli Obes <jorgelo@chromium.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Stuart Foster <smf-linux@virginmedia.com>
References: <69dad53e-9363-c551-111a-d0051bb0265f@gmail.com>
 <38f847ed-69dc-d5da-5822-bd9da753fc30@suse.cz>
 <202306010710.7F5C39B7A@keescook>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <202306010710.7F5C39B7A@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/1/23 21:12, Kees Cook wrote:
>> Hm indeed it seems to have introduced 2 new flags and immediately warn if
>> any process doesn't use them. Maybe it would make sense for some of the
>> non-default values of vm.memfd_noexec, but it's too early to warn
>> unconditionally everywhere, no?
> 
> This is pretty standard for getting new options like this noticed by
> userspace -- there is no regression in _behavior_. It's just a reminder
> to fix userspace code.
> 

Telling regzbot:

#regzbot invalid: not a kernel regression, but userspace fix is needed

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

