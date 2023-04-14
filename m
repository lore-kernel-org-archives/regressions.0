Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058B7F1
	for <regressions@lists.linux.dev>; Fri, 14 Apr 2023 07:51:53 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b145b3b03so3515058b3a.1
        for <regressions@lists.linux.dev>; Fri, 14 Apr 2023 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681458713; x=1684050713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K5rTwOdgFJZZPJX3fXkfiAvyTbB7Q3vbD/59Gc9iVe8=;
        b=HAc5MiWnDnFtyBTlxHKLzbEMGTFyAgbTTZrlLdU0FS9A9k8jl+iq0lngjS757FM4Xy
         i0w8Hi4GZw8epIIPNjnmIMfIKwRn7hROlz19QTFX7BCm9js9koBzidT+Gm9ZguRlYwvp
         26xrtKFt96+vQQF4h7+I5ULtIAd1G8Nu6rMFRxF1x8fj4hF+2So/uPj6KrnH4TO4YbZL
         cVZbPVUkhNcZIaEgGOaGJw3KuI8rGhO6T17WED5BTImY4B4TTHQrPVJTxEP2oD4iW1jC
         SDf8h8VqGBW+Dv1OXtmO7ceK80U6n6UsqnHsocaz63WYTpkBjxmGIQL+JI9mVEqiVkIt
         evpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681458713; x=1684050713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5rTwOdgFJZZPJX3fXkfiAvyTbB7Q3vbD/59Gc9iVe8=;
        b=kB8oIncv0astg6VH1ZqmcG0n11tVHSN0azeDfvV0V/OUo3cXgLBuFvbXl3pPfs4nJu
         wCIkbxUGg8hD5TnwtWDJSN0MrNNMPUyGM8BYe2+FlzncEvtR6FBl5JRFJfAp2vi9oCoV
         w4OZ0mR5UNss97R2BGJpaziwSVt6emv2X28pYlQ8Nz6epQsQ3DoZAjmYtDj8Zv9jONMW
         GCyXzISxWK98HIlyecz9f1kkjQMBWrojLO6h9QqTxoNz5mhB2EilhzFEKZgn/TYELK9c
         /pJSF9/5dzPDD+CjXrhkHuDYXvIqFGqOvwNtWaB8+lGHbtvJktHk8IJ8a+cPWg7IzzPY
         j1xA==
X-Gm-Message-State: AAQBX9f/kpLSaHRoEL8NLUyFNiIfSMypQSuPKkhqROOcB1m39AGN5XiR
	44+uQj10S94ReI/dtsD7O2w=
X-Google-Smtp-Source: AKy350ZnWysc0UeSs48nYjpcN4LkbUG3Rcp4C3XtxQgqKYU5gC4EHhKTSZrUqgds2FWiCaEDRaEu0g==
X-Received: by 2002:a05:6a00:430e:b0:62d:d85b:fcfc with SMTP id cb14-20020a056a00430e00b0062dd85bfcfcmr10116197pfb.8.1681458713036;
        Fri, 14 Apr 2023 00:51:53 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-58.three.co.id. [116.206.12.58])
        by smtp.gmail.com with ESMTPSA id g14-20020aa7818e000000b005d61829db4fsm2465430pfi.168.2023.04.14.00.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 00:51:52 -0700 (PDT)
Message-ID: <5f445dab-a152-bcaa-4462-1665998c3e2e@gmail.com>
Date: Fri, 14 Apr 2023 14:51:47 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [REGRESSION] Asus X541UAK hangs on suspend and poweroff (v6.1.6
 onward)
To: Acid Bong <acidbong@tilde.cafe>, regressions@lists.linux.dev
Cc: stable@vger.kernel.org, linux-acpi@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <CRVU11I7JJWF.367PSO4YAQQEI@bong>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CRVU11I7JJWF.367PSO4YAQQEI@bong>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/23 02:35, Acid Bong wrote:
> The issue appeared when I was using pf-kernel with genpatches and
> updated from 6.1-pf2 to 6.1-pf3 (corresponding to vanilla versions 6.1.3
> -> 6.1.6). I used that fork until 6.2-pf2, but since then (early March)
> moved to vanilla sources and started following the 6.1.y branch when it
> was declared LTS. And the issue was present on all of them.
> 
> The hang was last detected 3 days ago on 6.1.22 and today on 6.1.23.
> 

Have you tried testing latest mainline to see if commits which are
backported to 6.1.y cause your regression?

> # regzbot introduced v6.1.3..v6.1.6
> 

Anyway, I'm adding this to regzbot:

#regzbot ^introduced v6.1.3..v6.1.6
#regzbot title Asus X541UAK hangs on suspend and poweroff
#regzbot ignore-activity

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

