Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9F5134AF
	for <regressions@lists.linux.dev>; Mon, 22 May 2023 13:25:49 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ae4d1d35e6so42904475ad.0
        for <regressions@lists.linux.dev>; Mon, 22 May 2023 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684761949; x=1687353949;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4b3cl3OODzw5cbGHTkbsgtSEp8oZPxcTDpluClxVbUk=;
        b=eO3rIpsi40iN+2w6btP49efxsdxTdxFOiCQQBcJFc1qjQAPCHGM1ndbcirI2jrHElM
         82mIWTyUiKNEbcA1OqxJxV/cy8w860ZuUZa19gI7FohoWQGljuvwuTXWG6ypc1UYjeRJ
         esqRmGWv3h5sai88fccF5Dgo4w9HWJAtapyegg02sBy8GwiNkMcpONHU+DaRbJgnAaTH
         zkgUTctpnh2Ne/hUgJAL4SZX8j7XBYl7B+DtXgbLWg+U/FWkH+SqwB9hHy0Y322M9872
         Ipie/tzXpsQqNs0CAZlNF7H0EYGqA9Hq7uYvp0b+UWxQc99RLw7B7VNSkRXF24233fxJ
         RntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684761949; x=1687353949;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4b3cl3OODzw5cbGHTkbsgtSEp8oZPxcTDpluClxVbUk=;
        b=aEMbQhdUW+sGrj+wE5ilYBYDdxY9AAgAiPHe0zS1IC+KFgMXsuvADXGW7MUgbK7BKC
         LX5ec+Gqq31agaVQtedLNJ+WDKEzNhqkyiDBeT0DCQXlOhFVwzN0CiP9zLleKZ5fw4GO
         QnNmFs/y0MV6XbaQZFfs9NfaC3JslyWwwWXyu1QsrOyfiuwHfOSQs2R3bQqQmRIYSmER
         DKOD2ijuTDkUtnp2DDCjYtcYgp90Y/zz/n9SSf0icqLPv4sCQtPcw+miUlEag7jVpjh/
         iGLC8ApBCb0CeE1L2OjWhnyycETP8GeRgMULaTf7jkKrlw+w2OdExW6L7gjvZgyUjSQm
         kUaA==
X-Gm-Message-State: AC+VfDzThYGf0LXnjUtlF2VtR5Fbxh3fBf57NIOAqHQxMoEgWooGLHsg
	2s0PVwEnPv18EOMaJyr9Zm0=
X-Google-Smtp-Source: ACHHUZ6W3TTQEgMmXQa5zURSi0AtXuxh42yw2+Qd5pWuLLi/EMw6NyJGi1HDsSizjXkveQPFhxVT7w==
X-Received: by 2002:a17:902:b496:b0:1ae:bf5:7b5 with SMTP id y22-20020a170902b49600b001ae0bf507b5mr9747125plr.34.1684761949072;
        Mon, 22 May 2023 06:25:49 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-24.three.co.id. [180.214.232.24])
        by smtp.gmail.com with ESMTPSA id d6-20020a170902c18600b001addf547a6esm4883562pld.17.2023.05.22.06.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 06:25:48 -0700 (PDT)
Message-ID: <efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com>
Date: Mon, 22 May 2023 20:25:42 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux btrfs <linux-btrfs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, a1bert@atlas.cz
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: vmalloc error: btrfs-delalloc btrfs_work_helper [btrfs] in
 kernel 6.3.x
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> after updating from 6.2.x to 6.3.x, vmalloc error messages started to appear in the dmesg
> 
> 
> 
> # free 
>                total        used        free      shared  buff/cache   available
> Mem:        16183724     1473068      205664       33472    14504992    14335700
> Swap:       16777212      703596    16073616
> 
> 
> (zswap enabled)

See bugzilla for the full thread and attached dmesg.

On the report, the reporter can't perform the required bisection,
unfortunately.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v6.2..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217466
#regzbot title: btrfs_work_helper dealloc error in v6.3.x

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217466

-- 
An old man doll... just what I always wanted! - Clara
