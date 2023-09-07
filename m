Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFEF291C
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 11:37:08 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bdc19b782aso6396035ad.0
        for <regressions@lists.linux.dev>; Thu, 07 Sep 2023 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694086628; x=1694691428; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlmQ0g0rcR8jIM0YGYnNYLZ2qWdNbYZUYP0dv1VJcEc=;
        b=CS4w3ZhaB8t56KUreFV9di6dmhEp8eWFpR6EnXuhRx0MrEm6puf5J1Xao9jgizK5cY
         49+Jlo/lL7BUS1b3B8o94XF0quzVBrHiI+dUWyzNBi1M/tIDvosNjBqsNRlY583MRYeN
         WKUAvpdEZznJQO40By21w/ArpqJ5RTquGIWcXb+6B9u4HGcyNXydVMQxh2ACFN4R5MTL
         mEKnFldw8yDlhagHyfKc1FesWG3bqMuNjosBfOK1NlqbFC8u9cjZdTabucc7397XUJyc
         USLOpIyXIiDA14fumq45BiR1WLEk+YOuUjP4E1n9vGttLiXQ8Wxdm0fSbj9IpV0/HGO8
         M+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694086628; x=1694691428;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LlmQ0g0rcR8jIM0YGYnNYLZ2qWdNbYZUYP0dv1VJcEc=;
        b=cIpxkVwjlbTBPUXxTOkY3k4GULZRHAfAEvNd61LGi2tXeT/phNPLoSq/urHK7sbXun
         l6pOyp2gv6CTq6ATKHJNn5vpMMEsMArDDlcPyuljRJQGgksyEkafH8ih3T0lui58Aaln
         ktSUay2G628y19a5cM/nswsg5XI1+1cG0nJPNU3LoM/Kyyo0m7cXTjxUQC8pyeqgrwTX
         30Y95an0HJj7XgpdBgpenUKWwce387K5n6V+bbPWm7RuXbRdLK39na/rLaDAXTa6Ck62
         0DY6IZgPgYCKb9HZEnapKUCTFt+xm1a8+P/JRnfGS93Pzx/Dc8KCHoh9Ooe/gRhlrCwI
         5W2A==
X-Gm-Message-State: AOJu0YzwMnZTb2m0rxzaSpLUCzoy9B2bjTlBVoRsRFJwRYyg7On0IZ6h
	NLnqFSX7hny1zQaQjlGWSfQ=
X-Google-Smtp-Source: AGHT+IErairZ9yBTSt2kN6hRRi4u5s+turR2d2XrvcJUpHHW7n53nfz3i2uJ5+X8D5O10AqLjMSI7Q==
X-Received: by 2002:a17:902:bd45:b0:1c0:c0af:ba59 with SMTP id b5-20020a170902bd4500b001c0c0afba59mr16388444plx.34.1694086628392;
        Thu, 07 Sep 2023 04:37:08 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id t11-20020a170902bc4b00b0019ee045a2b3sm12601833plz.308.2023.09.07.04.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 04:37:08 -0700 (PDT)
Message-ID: <9a28c2fc-d769-4802-a1f2-77ba2cb34d25@gmail.com>
Date: Thu, 7 Sep 2023 18:37:00 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Andres Salomon <dilinger@queued.net>,
 "Timur I. Davletshin" <timur.davletshin@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux AMD GEODE <linux-geode@lists.infradead.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: AMD Geode LX hardware RNG driver produces regular patterns
 (geode-rng.c)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> System: Alix board 2d13 (AMD Geode LX800) running OpenWrt 23.05.0-rc3 (kernel 5.15.127)
> 
> Steps to reproduce:
> 
> cat /dev/hwrng and see output. Output in console shows regular pattern, rngd daemon (from rng-tools) refuses to run because of low entropy from /dev/hwrng. Pattern doesn't change until I reboot system.
> 
> Important notice: This problem started somewhere between 4.14.267 (kernel used in OpenWrt 19.07.9) and my current 5.15.127.
> 
> OpenWrt developers recommended addressing this problem upstream since they did not alter this driver in any way.

See Bugzilla for the full thread.

Anyway, I'm adding it to regzbot:

#regzbot ^introduced: v4.14.267..v5.15.127
#regzbot title: predictable urandom output on Alix 2d13

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217882

-- 
An old man doll... just what I always wanted! - Clara
