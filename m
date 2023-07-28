Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04585AD5C
	for <regressions@lists.linux.dev>; Fri, 28 Jul 2023 07:00:13 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-55b1238cab4so1049166a12.2
        for <regressions@lists.linux.dev>; Fri, 28 Jul 2023 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690527613; x=1691132413;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csffeR+oPJ4r1BFCRv18Ji1lYkr66TeUyNN6VXBOA5k=;
        b=bRLx7EBYf2U/nH8+u7oRWuawRuAyUzkXbwowllN+/5tlGx22+wcqAfwqnLf6zyOJFT
         aEB0LmSqIHbOI5lh5OaOyP58iVFGwoGiC6u9jCaxhKwNA7EkkrdrSPHJzOBeYRKgGvQQ
         rR99TNGh+oqu74wFG70rdejgZdL98JInkuARS3eKs5FvfZVY+PcS3W8q/HR+6C2j35Yh
         6Xi59KPlnLgmlc1xc8yfkn7TgINdqoqTShBzyKWD5evH6gLgsM9qDw8JYoxyq5SAeYqP
         ZxNLgPQqQq7mGC0dmx10/LJnQT8/7Cv7WEBpSsZN9hv8o8pI8q4zXG5PHI9A/esxIIfx
         et+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690527613; x=1691132413;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csffeR+oPJ4r1BFCRv18Ji1lYkr66TeUyNN6VXBOA5k=;
        b=YdB0oWOf/M8gLkFjK5Ou60MJ3KlKiFGZI3ezVM+dU5AqIsN15/Ttb1LDK/07MeHBiI
         ZXyMnpayK/XIasOrBOf7FOdAvl9LqaV1LbmVGWhybcoXaQykoaAa9m6qw8iu9qf3bLSU
         3oDoVNlSMexhGotzjTJqtp830wWFckuqrCjLkeqqD2yODPgQMQElkfHDpv9baqBigILf
         /2WhACeI8vB+cAcTcGPdCFo8tYpOplS7Q+mbVyKZVfHodDxIxuODq/tzQZNprdhMxs69
         Tk5gWp6zSfWOcXbajzEaO7JtRDoPkbp4+ehrqDE4dCA4aIMsfxlhSLqX/GUPBgXjikE6
         O8yw==
X-Gm-Message-State: ABy/qLaxZZxdZJNBn5A2/kYnga7gIYIW4rywQBcmYGPi7wgOr0Y05WoF
	9Hrxrr8fEOEEttvWBB7ipmGz+P3K8kvaeA==
X-Google-Smtp-Source: APBJJlHQFId3j9XY4axmj92fg1mRTYT3ZW0i6+fQ9XtygsZgZwiS7I1U8crPutn4LhBlrp3d2H13DA==
X-Received: by 2002:a17:90a:bf0a:b0:268:5558:de4c with SMTP id c10-20020a17090abf0a00b002685558de4cmr803408pjs.38.1690527613159;
        Fri, 28 Jul 2023 00:00:13 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id fw3-20020a17090b128300b00262ca945cecsm3642658pjb.54.2023.07.28.00.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 00:00:12 -0700 (PDT)
Message-ID: <849bdcfb-b70f-5212-58f7-71e2da25c5ed@gmail.com>
Date: Fri, 28 Jul 2023 14:00:05 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: XPS 17 9730 runs significantly warmer on Kernel 6.5-rc3
 compared to Kernel 6.4.3
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Goran <goran.brkuljan@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Power Management <linux-pm@vger.kernel.org>
References: <4aaf1d3d-2ab7-2d3a-f597-a1741bf699d6@gmail.com>
 <ZMMaYLcc5G4KSVyf@debian.me>
In-Reply-To: <ZMMaYLcc5G4KSVyf@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/28/23 08:31, Bagas Sanjaya wrote:
> Oops, I accidentally duped this. My email client was stuck sending it
> (but got delivered anyway), thus:
> 
> #regzbot dup-of: https://lore.kernel.org/regressions/107f05b8-0104-501c-130c-4f89f3f8a628@gmail.com/
> 

And to clean regzbot up:

#regzbot invalid: accidental duplicate

Please ignore this thread, and instead follow up the original
forwarded report at [1].

Sorry for inconvenience.

[1]: https://lore.kernel.org/lkml/107f05b8-0104-501c-130c-4f89f3f8a628@gmail.com/

-- 
An old man doll... just what I always wanted! - Clara

