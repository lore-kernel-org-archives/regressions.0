Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAC41FA5
	for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 08:40:44 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso9693428b3a.0
        for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 01:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695890444; x=1696495244; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBf/n8oQr3zotF0kuExdKxVGO0tvQwtR7Cs+ipQs5qY=;
        b=nVe4JFPstZKVbHdUqS1lNdo+HYgJbE4XTHD+AwLlGd+EHYjeSEaup4qxw29heJ5Afr
         m3VoDuefzIn9BbqS5PxtTsbct0Q1nC15rXw7/YJgw1hIL0WsLKHASccXgIeyFSb/0Ygd
         g90VaFz1mA3Jp/TBfaCBMyK06J6rm8Hyg2z9+H+R89GW8swCEOpElnWq9FgZAFBxuXKt
         aGfoBwG5ReMlsUN93CQUu0kcplBJ5FB9mIRYs+THGc4XbFJoqRfQfWicyb67wJc2pFdQ
         ICTMkeQyG/tOXB7FBxfB7HcUtjKqLhFwm8KxRR2mE/xoqoJcbBSFWQxL9PnqVVPkVD7x
         acFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695890444; x=1696495244;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XBf/n8oQr3zotF0kuExdKxVGO0tvQwtR7Cs+ipQs5qY=;
        b=I2iyGuBA+h1sKhYddGQbwlWyPegHcSZWtrrB7mpWtZ4rxaWJVlyodXhLSdSnWAIRqJ
         KMFruEdsBY++zAcMqDT2nzIGr6qdXhWfj5VPpUh0q4IgGQQjkUTpxEg2L38R2Tg3YtVu
         CSVjrd84d82QMw9NGRf9u0sOnavEYEUyPE/rB+2UsCj5eomdkVZv+AnUn2WGhyThZQ9P
         xw/gBMsT8+AY11bWDElJCacgrActfCaHjuAeaA8JnSnmAcK2nYiVhaOHSrtB3TKucdgI
         GzS727+swPow2GQBH08KuB7avdTHkEHy2QsRYo2EWkrjYDITLk7eD7gyet0Xlz08rsHJ
         hy9g==
X-Gm-Message-State: AOJu0Yzqu+LEzOBySu+ehFq6TJeNXsepJE3sV+V/y2qMzc2YQyuGZQMC
	P7asUXSRGw0LAuDKf5aNBPM=
X-Google-Smtp-Source: AGHT+IGjFz36JCOcZVg+0sU6TURqLI/8MmfIg+s73OOjJ6Rx9mZPPYZZgOGqj9IoUQDXt4W80p9wPw==
X-Received: by 2002:a05:6a00:849:b0:68c:44ed:fb6 with SMTP id q9-20020a056a00084900b0068c44ed0fb6mr1019514pfk.16.1695890443798;
        Thu, 28 Sep 2023 01:40:43 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id o28-20020a637e5c000000b0057cb5a780ebsm10756666pgn.76.2023.09.28.01.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 01:40:43 -0700 (PDT)
Message-ID: <4f01f302-9d59-4146-b7ff-0478c4bd94b1@gmail.com>
Date: Thu, 28 Sep 2023 15:40:31 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Daniel Micay <danielmicay@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, freeze0985@gmail.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: kmalloc memory leak over time.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Since 1st weak of Sept I have been observing memory leak in my system, so after doing a little big of digging I found out that the leak is caused by kmalloc. In Linux 6.5.3 memory leak would increase  to nearly 50% of my ram over a period of 6-9 hours. In the Newer Linux 6.5.4 I am yet to observe that much memory leak(Haven't used my laptop for that long till now) but over a period of 3 hours I see 2.2GB reserved and it is not used by any program at all. this is just after 3 hours of usage on Linux 6.5.4.

Later, the reporter (Cc'ed) narrowed down the version range, with
memory statistics:

> 6.4 works fine I down graded to it before linux 6.5.4 was released. no memory leak.
> 
> today i ran my laptop for 6 hours and 40 mins and this memory leak is still happening at same rate.
> 
>               total        used        free      shared  buff/cache   available
> Mem:            15Gi       7.2Gi       2.8Gi       797Mi       6.4Gi       8.1Gi
> Swap:             0B          0B          0B
> Total:          15Gi       7.2Gi       2.8Gi

See Bugzilla for the full thread.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?id=217943

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217943

-- 
An old man doll... just what I always wanted! - Clara
