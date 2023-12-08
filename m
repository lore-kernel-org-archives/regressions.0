Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444DF1865
	for <regressions@lists.linux.dev>; Fri,  8 Dec 2023 02:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKpkOf3l"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so1335102a12.2
        for <regressions@lists.linux.dev>; Thu, 07 Dec 2023 18:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702001140; x=1702605940; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5p96aV1jD/kmwOXUo+oTVCU+80IQN61LG9xj68A9h98=;
        b=DKpkOf3lzCLiuSC/fIh/cEj4FOYUTJbnGHh4CYr1mWrdrdD+oosDucYgAePN8lcr7Y
         MV7ItbvPIrXprhBfScpfjRptg2DpRgQpqRJ1B69wxfMH0171UPoYq0GLn9Lb/gQ1xXBS
         2Xt36owrKUjP2l/akgE59w4xyTK4yneuUuqLHMfpPkemdaduIyyRyi8/6QZRzU0zIPGZ
         zivi4NzV1+J5ZSWqPQtgWZxZF0MUO3LBKwN+4UMf7FHldzKCc6Poxg72XB3M/+O0m6IY
         VHa/XMbpr+JP4KUNH8mYFCP1i0e3WLPhaTCRcAc+WebkZCXN/LnOE2bV4C2M3ZeSywXD
         BAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702001140; x=1702605940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5p96aV1jD/kmwOXUo+oTVCU+80IQN61LG9xj68A9h98=;
        b=vkc4gHrrhR7Suz+k/hZ6GHJw5IV4cG6Iay5QU6xSb3UJxmT2k5C7otnXsc3pWGywi2
         2IWnZnigDWVs8rMPt5pTHaC5y4TGTfWwustwSPf3JuKF1bSfzJDKPlmXfxyuVdcPLADm
         8D40v6JO4UySZJwJw1Bm01lUHqc9mUjyf9os1curv5RWUPdXT38wTJs8XQKpfcwV1SR5
         7S6S10E2M987lHUeY+/uTbJql3GSNQnbESys89HJMWbrPsMPzPc/Ej9Ur1ckvU2i/qEP
         xjFr+erSQZSn0KnxzIH9NrTgf/PKcWetVcpjM6dOogpU50F+AIRNqdjyXJcbc9wWwNQ2
         HEkw==
X-Gm-Message-State: AOJu0YyClPC4Nk0KaOO+sjNXu8+EEgh+kWL+ASthhJLKf3Q5VC/pq9Lh
	r52hqkAFqZZyRebGM/wgj1I=
X-Google-Smtp-Source: AGHT+IFMmgiD674YTc4A3jEartJ8gR3NDksSfuREBAIVu8xW2/AiH4VD9wzfTunJJW0wRT/TRMKLJQ==
X-Received: by 2002:a05:6a20:cea7:b0:187:5a4d:7061 with SMTP id if39-20020a056a20cea700b001875a4d7061mr3543631pzb.44.1702001140334;
        Thu, 07 Dec 2023 18:05:40 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id bv190-20020a632ec7000000b005c2967852c5sm448219pgb.30.2023.12.07.18.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 18:05:39 -0800 (PST)
Message-ID: <f6fc246f-4f57-4340-a967-396047e2924d@gmail.com>
Date: Fri, 8 Dec 2023 09:05:33 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: md raid6 oops in 6.6.4 stable
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Genes Lists <lists@sapience.com>, snitzer@kernel.org, song@kernel.org,
 yukuai3@huawei.com, axboe@kernel.dk, mpatocka@redhat.com, heinzm@redhat.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux RAID <linux-raid@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Bhanu Victor DiCara <00bvd0+linux@gmail.com>, Xiao Ni <xni@redhat.com>,
 Guoqing Jiang <guoqing.jiang@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <6e6816dd-2ec5-4bca-9558-60cfde46ef8c@sapience.com>
 <ZXHJEkwIJ5zKTMjV@archie.me>
 <e2d47b6c-3420-4785-8e04-e5f217d09a46@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <e2d47b6c-3420-4785-8e04-e5f217d09a46@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/7/23 20:58, Thorsten Leemhuis wrote:
> On 07.12.23 14:30, Bagas Sanjaya wrote:
>> On Thu, Dec 07, 2023 at 08:10:04AM -0500, Genes Lists wrote:
>>> I have not had chance to git bisect this but since it happened in stable I
>>> thought it was important to share sooner than later.
>>>
>>> One possibly relevant commit between 6.6.3 and 6.6.4 could be:
>>>
>>>   commit 2c975b0b8b11f1ffb1ed538609e2c89d8abf800e
>>>   Author: Song Liu <song@kernel.org>
>>>   Date:   Fri Nov 17 15:56:30 2023 -0800
>>>
>>>     md: fix bi_status reporting in md_end_clone_io
>>>
>>> log attached shows page_fault_oops.
>>> Machine was up for 3 days before crash happened.
>>
>> Can you confirm that culprit by bisection?
> 
> Bagas, I know you are trying to help, but sorry, I'd say this is not
> helpful at all -- any maybe even harmful.
> 
> From the quoted texts it's pretty clear that the reporter knows that a
> bisection would be helpful, but currently is unable to perform one --
> and even states reasons for reporting it without having it bisected. So
> your message afaics doesn't bring anything new to the table; and I might
> be wrong with that, but I fear some people in a situation like this
> might even be offended by a reply like that, as it states something
> already obvious.
> 

Oops, I didn't fully understand the context. Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

